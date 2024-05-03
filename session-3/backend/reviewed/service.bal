import ballerina/graphql;
import ballerina/http;
import ballerina/log;

import xlibb/pubsub;

final http:Client geoClient = check getGeoClient();

function getGeoClient() returns http:Client|error => new ("https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets");

final pubsub:PubSub subscriptions = new;

@graphql:ServiceConfig {
    graphiql: {
        enabled: true
    }
}
service /reviewed on new graphql:Listener(9000) {

    resource function get places() returns Place[] {
        return from PlaceData placeData in places
            select getPlace(placeData.id);
    }

    resource function get place(@graphql:ID int placeId) returns Place {
        return getPlace(placeId);
    }

    resource function get author(@graphql:ID int authorId) returns Author {
        return new (authorId);
    }

    remote function addReview(ReviewInput reviewInput) returns Review {
        int id = reviews.nextKey();
        ReviewData reviewData = {id, ...reviewInput};
        reviews.add(reviewData);
        pubsub:Error? status = subscriptions.publish(reviewData.placeId.toString(), id);
        if status is pubsub:Error {
            log:printError("Error publishing review update", data = reviewData);
        }
        return new (id);
    }

    resource function subscribe reviews(int placeId) returns stream<Review, error?>|error {
        stream<int, error?> reviews = check subscriptions.subscribe(placeId.toString());
        return from int reviewId in reviews select new (reviewId);
    }
}

type CityDataResultsItem record {
    int population;
    string timezone;
};

type CityData record {
    int total_count;
    CityDataResultsItem[] results;
};

function getCityData(string city, string country) returns CityDataResultsItem|error {
    CityData cityData = check geoClient->get(
        string `/geonames-all-cities-with-a-population-500/records?refine=name:${
            city}&refine=country:${country}`);

    if cityData.total_count == 0 {
        return error(string `cannot find data for ${city}, ${country}`);
    }
    return cityData.results[0];
}

type Place distinct service object {
    resource function get id() returns @graphql:ID int;

    resource function get name() returns string;

    resource function get city() returns string;

    resource function get country() returns string;

    resource function get population() returns int|error?;

    resource function get timezone() returns string|error?;

    resource function get reviews() returns Review[];

    resource function get rating() returns decimal?;
};

// With union.
// type Place PlaceWithEntranceFee|PlaceWithFreeEntrance;

distinct service class PlaceWithFreeEntrance {
    *Place;

    final int id;
    final string name;
    final string city;
    final string country;

    function init(@graphql:ID int id) {
        PlaceData placeData = places.get(id);
        self.id = id;
        self.name = placeData.name;
        self.city = placeData.city;
        self.country = placeData.country;
    }

    resource function get id() returns @graphql:ID int => self.id;

    resource function get name() returns string => self.name;

    resource function get city() returns string => self.city;

    resource function get country() returns string => self.country;

    resource function get population() returns int|error? {
        CityDataResultsItem cityData = check getCityData(self.city, self.country);
        return cityData.population;
    }

    resource function get timezone() returns string|error? {
        CityDataResultsItem cityData = check getCityData(self.city, self.country);
        return cityData.timezone;
    }

    resource function get reviews() returns Review[] {
        return from ReviewData reviewData in reviews
            where reviewData.placeId == self.id
            select new (reviewData.id);
    }

    resource function get rating() returns decimal? {
        return from ReviewData {placeId, rating} in reviews
            where placeId == self.id
            collect avg(rating);
    }
}

distinct service class PlaceWithEntranceFee {
    *Place;

    final int id;
    final string name;
    final string city;
    final string country;
    final decimal fee;

    function init(@graphql:ID int id) {
        PlaceData placeData = places.get(id);
        self.id = id;
        self.name = placeData.name;
        self.city = placeData.city;
        self.country = placeData.country;
        self.fee = placeData.entryFee;
    }

    resource function get id() returns @graphql:ID int => self.id;

    resource function get name() returns string => self.name;

    resource function get city() returns string => self.city;

    resource function get country() returns string => self.country;

    resource function get population() returns int|error? {
        CityDataResultsItem cityData = check getCityData(self.city, self.country);
        return cityData.population;
    }

    resource function get timezone() returns string|error? {
        CityDataResultsItem cityData = check getCityData(self.city, self.country);
        return cityData.timezone;
    }

    resource function get reviews() returns Review[] {
        return from ReviewData reviewData in reviews
            where reviewData.placeId == self.id
            select new (reviewData.id);
    }

    resource function get rating() returns decimal? {
        return from ReviewData {placeId, rating} in reviews
            where placeId == self.id
            collect avg(rating);
    }

    resource function get fee() returns decimal => self.fee;
}

public service class Review {
    final int id;
    final int rating;
    final string content;
    final int placeId;
    final int authorId;

    function init(@graphql:ID int id) {
        ReviewData reviewData = reviews.get(id);
        self.id = id;
        self.rating = reviewData.rating;
        self.content = reviewData.content;
        self.placeId = reviewData.placeId;
        self.authorId = reviewData.authorId;
    }

    resource function get id() returns @graphql:ID int => self.id;

    resource function get rating() returns int => self.rating;

    resource function get content() returns string => self.content;

    resource function get place() returns Place =>
        getPlace(self.placeId);

    resource function get author() returns Author =>
        new (self.authorId);
}

service class Author {
    final int id;
    final string username;

    function init(@graphql:ID int id) {
        self.id = id;
        self.username = authors.get(id).username;
    }

    resource function get id() returns @graphql:ID int => self.id;

    resource function get username() returns string => self.username;

    resource function get reviews() returns Review[] {
        return from ReviewData reviewData in reviews
            where reviewData.authorId == self.id
            select new Review(reviewData.id);
    }
}

type ReviewInput record {|
    int rating;
    string content;
    int placeId;
    int authorId;
|};

function getPlace(int placeId) returns Place {
    decimal entryFee = places.get(placeId).entryFee;
    return entryFee == 0d ?
        new PlaceWithFreeEntrance(placeId) :
        new PlaceWithEntranceFee(placeId);
}
