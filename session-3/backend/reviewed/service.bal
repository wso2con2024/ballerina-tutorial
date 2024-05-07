import reviewed.db;

import ballerina/constraint;
import ballerina/graphql;
import ballerina/graphql.dataloader;
import ballerina/http;
import ballerina/log;

import ballerinax/jaeger as _;
import ballerinax/prometheus as _;

import xlibb/pubsub;

import maryamzi/city_data_client;

const USER_ID = "userId";

configurable boolean graphiqlEnabled = false;
configurable boolean introspection = false;
configurable int maxQueryDepth = 15;
configurable string[] allowOrigins = ["http://localhost:3000"];

// Just for demo purposes, to reset the database to the original state.
configurable boolean reset = true;

function init() returns error? {
    if reset {
        check resetData();
    }
}

final city_data_client:Client geoClient = check getGeoClient();

function getGeoClient() returns city_data_client:Client|error => new ();

final db:Client db = check new;

final pubsub:PubSub subscriptions = new;

listener graphql:Listener ln = new (9000,
        secureSocket = {
            key: {
                certFile: "../resources/certs/public.crt",
                keyFile: "../resources/certs/private.key"
            }
        });

@graphql:ServiceConfig {
    graphiql: {
        enabled: graphiqlEnabled
    },
    introspection,
    maxQueryDepth,
    contextInit,
    cors: {
        allowOrigins
    }
}
service /reviewed on ln {

    resource function get places(string? city = (), string? country = (), boolean sortByRating = false) returns Place[]|error {
        Place[] filteredPlaces = check getFilteredPlaces(city, country);
        if sortByRating {
            return from Place place in filteredPlaces
                order by check place.getRating() descending
                select place;
        }
        return from Place place in filteredPlaces
            order by place.getName()
            select place;
    }

    resource function get place(@graphql:ID int placeId) returns Place|error {
        return getPlace(placeId);
    }

    resource function get author(@graphql:ID int authorId) returns Author|error {
        return new (authorId);
    }

    remote function addReview(ReviewInput reviewInput) returns Review|error {
        int[] ids = check db->/reviews.post([{id: check getNextReviewId(), ...reviewInput}]);
        int id = ids[0];
        pubsub:Error? status = subscriptions.publish(reviewInput.placeId.toString(), id);
        if status is pubsub:Error {
            log:printError("Error publishing review update", id = id);
        }
        return new (id);
    }

    @graphql:ResourceConfig {
        interceptors: new AuthInterceptor()
    }
    remote function addPlace(PlaceInput placeInput) returns Place|error {
        int[] ids = check db->/places.post([{id: check getNextPlaceId(), ...placeInput}]);
        int id = ids[0];
        return getPlace(id);
    }

    resource function subscribe reviews(int placeId) returns stream<Review, error?>|error {
        stream<int, error?> reviews = check subscriptions.subscribe(placeId.toString());
        return from int reviewId in reviews select check new (reviewId);
    }
}

type CityDataResultsItem record {
    int population;
    string timezone;
};

isolated function getCityData(string city, string country) returns CityDataResultsItem|error {
    log:printInfo("Retrieving city data", city = city, country = country);
    return geoClient->getCityData(city, country);
}

type Place distinct service object {
    function getName() returns string;
    
    function getRating() returns decimal|error?;

    resource function get id() returns @graphql:ID int;

    resource function get name() returns string;

    resource function get city() returns string;

    resource function get country() returns string;

    resource function get population(graphql:Context ctx) returns int|error?;

    resource function get timezone(graphql:Context ctx) returns string|error?;

    resource function get reviews() returns Review[]|error?;

    resource function get rating() returns decimal|error?;
};

// With union.
// type Place PlaceWithEntranceFee|PlaceWithFreeEntrance;

distinct service class PlaceWithFreeEntrance {
    *Place;

    final int id;
    final string name;
    final string city;
    final string country;

    function init(@graphql:ID int id) returns error? {
        db:Place {name, city, country} = check db->/places/[id]();
        self.id = id;
        self.name = name;
        self.city = city;
        self.country = country;
    }

    function getName() returns string => self.name;
    
    function getRating() returns decimal|error? {
        return from db:Review {placeId, rating} in db->/reviews(db:Review)
            where placeId == self.id
            collect avg(rating);
    }

    resource function get id() returns @graphql:ID int => self.id;

    resource function get name() returns string => self.getName();

    resource function get city() returns string => self.city;

    resource function get country() returns string => self.country;

    isolated function cityDataPreLoader(graphql:Context ctx) {
        dataloader:DataLoader cityDataLoader = ctx.getDataLoader("cityDataLoader");
        cityDataLoader.add([self.city, self.country]);
    }

    @graphql:ResourceConfig {
        prefetchMethodName: "cityDataPreLoader"
    }
    resource function get population(graphql:Context ctx) returns int|error? {
        dataloader:DataLoader cityDataLoader = ctx.getDataLoader("cityDataLoader");
        CityDataResultsItem cityData = check cityDataLoader.get([self.city, self.country]);
        return cityData.population;
    }

    @graphql:ResourceConfig {
        prefetchMethodName: "cityDataPreLoader"
    }
    resource function get timezone(graphql:Context ctx) returns string|error? {
        dataloader:DataLoader cityDataLoader = ctx.getDataLoader("cityDataLoader");
        CityDataResultsItem cityData = check cityDataLoader.get([self.city, self.country]);
        return cityData.timezone;
    }

    resource function get reviews() returns Review[]|error? {
        return from db:Review reviewData in db->/reviews(db:Review)
            where reviewData.placeId == self.id
            select check new (reviewData.id);
    }

    resource function get rating() returns decimal|error? => self.getRating();
}

distinct service class PlaceWithEntranceFee {
    *Place;

    final int id;
    final string name;
    final string city;
    final string country;
    final decimal fee;

    function init(@graphql:ID int id) returns error? {
        db:Place {name, city, country, entryFee} = check db->/places/[id]();
        self.id = id;
        self.name = name;
        self.city = city;
        self.country = country;
        self.fee = entryFee;
    }

    function getName() returns string => self.name;
    
    function getRating() returns decimal|error? {
        return from db:Review {placeId, rating} in db->/reviews(db:Review)
            where placeId == self.id
            collect avg(rating);
    }

    resource function get id() returns @graphql:ID int => self.id;

    resource function get name() returns string => self.getName();

    resource function get city() returns string => self.city;

    resource function get country() returns string => self.country;

    isolated function cityDataPreLoader(graphql:Context ctx) {
        dataloader:DataLoader cityDataLoader = ctx.getDataLoader("cityDataLoader");
        cityDataLoader.add([self.city, self.country]);
    }

    @graphql:ResourceConfig {
        prefetchMethodName: "cityDataPreLoader"
    }
    resource function get population(graphql:Context ctx) returns int|error? {
        dataloader:DataLoader cityDataLoader = ctx.getDataLoader("cityDataLoader");
        CityDataResultsItem cityData = check cityDataLoader.get([self.city, self.country]);
        return cityData.population;
    }

    @graphql:ResourceConfig {
        prefetchMethodName: "cityDataPreLoader"
    }
    resource function get timezone(graphql:Context ctx) returns string|error? {
        dataloader:DataLoader cityDataLoader = ctx.getDataLoader("cityDataLoader");
        CityDataResultsItem cityData = check cityDataLoader.get([self.city, self.country]);
        return cityData.timezone;
    }

    resource function get reviews() returns Review[]|error? {
        return from db:Review reviewData in db->/reviews(db:Review)
            where reviewData.placeId == self.id
            select check new (reviewData.id);
    }

    resource function get rating() returns decimal|error? => self.getRating();
    
    resource function get fee() returns decimal => self.fee;
}

public service class Review {
    final int id;
    final int rating;
    final string content;
    final int placeId;
    final int authorId;

    function init(@graphql:ID int id) returns error? {
        db:Review {rating, content, placeId, authorId} = check db->/reviews/[id]();
        self.id = id;
        self.rating = rating;
        self.content = content;
        self.placeId = placeId;
        self.authorId = authorId;
    }

    resource function get id() returns @graphql:ID int => self.id;

    resource function get rating() returns int => self.rating;

    resource function get content() returns string => self.content;

    resource function get place() returns Place|error? => getPlace(self.placeId);

    resource function get author() returns Author|error? => new (self.authorId);
}

service class Author {
    final int id;
    final string username;

    function init(@graphql:ID int id) returns error? {
        self.id = id;
        db:Author {username} = check db->/authors/[id]();
        self.username = username;
    }

    resource function get id() returns @graphql:ID int => self.id;

    resource function get username() returns string => self.username;

    resource function get reviews() returns Review[]|error? {
        return from db:Review review in db->/reviews(db:Review)
            where review.authorId == self.id
            select check new Review(review.id);
    }
}

type ReviewInput record {|
    @constraint:Int {
        minValue: 1,
        maxValue: 5
    }
    int rating;
    string content;
    int placeId;
    int authorId;
|};

type PlaceInput record {|
    string name;
    string city;
    string country;
    decimal entryFee;
|};

function getPlace(int placeId) returns Place|error {
    db:Place {entryFee} = check db->/places/[placeId]();
    return entryFee == 0d ?
        new PlaceWithFreeEntrance(placeId) :
        new PlaceWithEntranceFee(placeId);
}

isolated function cityDataLoaderFunction(readonly & anydata[] ids) returns CityDataResultsItem[]|error {
    [string, string][] cities = check ids.ensureType();
    return from [string, string] [city, country] in cities
        select check getCityData(city, country);
}

isolated function contextInit(http:RequestContext requestContext, http:Request request) returns graphql:Context|error {
    graphql:Context ctx = new;

    string|http:HeaderNotFoundError userId = request.getHeader(USER_ID);
    ctx.set(USER_ID, userId is http:HeaderNotFoundError ? () : check int:fromString(userId));
    ctx.registerDataLoader("cityDataLoader", new dataloader:DefaultDataLoader(cityDataLoaderFunction));
    return ctx;
}

readonly service class AuthInterceptor {
    *graphql:Interceptor;

    isolated remote function execute(graphql:Context context, graphql:Field 'field) returns anydata|error {
        check validateAdminRole(context);
        return context.resolve('field);
    }
}

// Mock function for role validation.
isolated function validateAdminRole(graphql:Context context) returns error? {
    int|error userId = context.get(USER_ID).ensureType();
    if userId is int && userId is 5002|5003 {
        return ();
    }
    return error("Forbidden");
}

function getFilteredPlaces(string? filterCity, string? filterCountry) returns Place[]|error {
    if filterCity is string && filterCountry is string {
        return from db:Place {id, city, country} in db->/places(db:Place)
            where city == filterCity && country == filterCountry
            select check getPlace(id);
    }

    if filterCity is string {
        return from db:Place {id, city} in db->/places(db:Place)
            where city == filterCity
            select check getPlace(id);
    }

    if filterCountry is string {
        return from db:Place {id, country} in db->/places(db:Place)
            where country == filterCountry
            select check getPlace(id);
    }

    return from db:Place {id} in db->/places(db:Place) select check getPlace(id);
}

function getNextPlaceId() returns int|error {
    int[] ids = check from db:PlaceWithRelations place in db->/places(db:PlaceWithRelations)
                    select check place.id.ensureType();
    return ids[ids.length() - 1] + 1;
}

function getNextAuthorId() returns int|error {
    int[] ids = check from db:AuthorWithRelations author in db->/authors(db:AuthorWithRelations)
                    select check author.id.ensureType();
    return ids[ids.length() - 1] + 1;
}

function getNextReviewId() returns int|error {
    int[] ids = check from db:ReviewWithRelations review in db->/reviews(db:ReviewWithRelations)
                    select check review.id.ensureType();
    return ids[ids.length() - 1] + 1;
}

function resetData() returns error? {
    _ = check db->executeNativeSQL(`DELETE FROM Review`);
    _ = check db->executeNativeSQL(`DELETE FROM Place`);
    _ = check db->executeNativeSQL(`DELETE FROM Author`);

    _ = check db->/places.post([
        {id: 8000, name: "Tower Vista", city: "Colombo", country: "Sri Lanka", entryFee: 0},
        {id: 8001, name: "TechTrail", city: "Miami", country: "United States", entryFee: 10}
    ]);

    _ = check db->/authors.post([
        {id: 5000, username: "John"},
        {id: 5001, username: "Raya"},
        {id: 5002, username: "Liyana"},
        {id: 5003, username: "Shri"}
    ]);
    
    _ = check db->/reviews.post([
        {id: 1001, placeId: 8000, authorId: 5001, content: "Wonderful place, would recommend!", rating: 5},
        {id: 1002, placeId: 8001, authorId: 5001, content: "Long queues, not worth the wait.", rating: 1},
        {id: 1003, placeId: 8000, authorId: 5002, content: "Tends to get crowded in the evening, other than that, great experience.", rating: 4},
        {id: 1004, placeId: 8001, authorId: 5000, content: "Getting in is a challenge, but if you can sort out transport, a must visit!", rating: 4},
        {id: 1005, placeId: 8001, authorId: 5002, content: "An absolute must-visit for a tech enthusiast", rating: 5},
        {id: 1006, placeId: 8000, authorId: 5000, content: "Would definitely visit again.", rating: 5}
    ]);
}
