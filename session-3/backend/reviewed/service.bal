import ballerina/graphql;
import ballerina/http;

final http:Client geoClient = check new ("https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets");

@graphql:ServiceConfig {
    graphiql: {
        enabled: true
    }
}
service /reviewed on new graphql:Listener(9000) {

    resource function get places() returns Place[] {
        return from PlaceData placeData in places
            select new Place(placeData.id);
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

service class Place {
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

    // Has nil in the return type, only this field will become null if 
    // this resolver resource method returns error.
    resource function get population() returns int|error? {
        CityDataResultsItem cityData = check getCityData(self.city, self.country);
        return cityData.population;
    }

    // Does not have nil in the return type, therefore, the entire data retrieval
    // will just return null when this resolver resource method returns error.
    resource function get timezone() returns string|error {
        CityDataResultsItem cityData = check getCityData(self.city, self.country);
        return cityData.timezone;
    }

    resource function get rating() returns decimal? {
        return from ReviewData {placeId, rating} in reviews
            where placeId == self.id
            collect avg(rating);
    }
}
