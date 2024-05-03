import ballerina/graphql;
import ballerina/http;

final http:Client geoClient = check new ("https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets");

@graphql:ServiceConfig {
    graphiql: {
        enabled: true
    }
}
service /reviewed on new graphql:Listener(9000) {

    resource function get places() returns Place[]|error {
        return from PlaceData placeData in places
            let string city = placeData.city,
                string country = placeData.country,
                // But this will happen even when population or timezone are not requested.
                CityDataResultsItem cityData = check getCityData(city, country)
            select {
                id: placeData.id,
                name: placeData.name,
                city,
                country,
                population: cityData.population,
                timezone: cityData.timezone
            };
    }

    // If the fields were only id, name, city, and country, since `Place` is 
    // an open record, can directly return `places` with a table as the 
    // return type. 
    // resource function get places() returns table<Place> {
    //     return places;
    // }
}

type Place record {
    int id;
    string name;
    string city;
    string country;
    int population;
    string timezone;
};

// Records aren't ideal when we want to incorporate reviews and authors though.
// Need a `Place` to create a `Review`, can do using optional fields and/or by creating 
// the place with an empty review array first and then updating the reviews, but not ideal.

// type Place record {
//     int id;
//     string name;
//     string city;
//     string country;
//     Review[] reviews;
// };

// type Review record {
//     int id;
//     Place place;
//     Author author;
//     string content;
//     int rating;
// };

// type Author record {
//     int id;
//     string username;
// };

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
