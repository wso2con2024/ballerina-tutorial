import ballerina/graphql;
import ballerina/test;

import maryamzi/city_data_client;

final graphql:Client cl = check new ("http://localhost:9000/reviewed");

@test:Mock {
    functionName: "getGeoClient"
}
function getMockClient() returns city_data_client:Client => test:mock(city_data_client:Client);

@test:Config
function testRetrievingBasicPlaceData() returns error? {
    json actual = check cl->execute(string `{
        places {
            id
            name
            city
            country
        }
    }`);

    BasicPlaceData[] expected = check from BasicPlaceData cityData in db->/places(BasicPlaceData)
        order by cityData.name
        select cityData;
    test:assertEquals(actual, {"data": {"places": expected}});
}

type BasicPlaceData record {|
    int id;
    string name;
    string city;
    string country;
|};

type CityDataWithPopulationAndTimeZone record {|
    int id;
    string name;
    string city;
    string country;
    int population;
    string timezone;
|};

@test:Config
function testRetrievingPlaceDataWithCityData() returns error? {
    city_data_client:CityDataResultsItem cityData = {
        population: 450000,
        timezone: "America/New_York",
        admin1_code: "",
        elevation: "",
        country: "",
        latitude: "",
        coordinates: {lon: 0, lat: 0},
        country_code_2: (),
        dem: 0,
        admin4_code: (),
        geoname_id: "",
        alternate_names: [],
        country_code: "",
        feature_class: "",
        ascii_name: "",
        admin2_code: "",
        modification_date: "",
        name: "",
        admin3_code: (),
        feature_code: "",
        longitude: ""
    };

    test:prepare(geoClient)
        .when("getCityData")
        .withArguments("Miami", "United States")
        .thenReturn(cityData);

    json payload = check cl->execute(string `query QueryPlace($placeId: ID!) {
        place(placeId: $placeId) {
            id
            name
            city
            country
            population
            timezone
        }
    }`, {"placeId": 8001});

    BasicPlaceData placeData = check db->/places/[8001]();

    test:assertEquals(payload, {
                                   "data": {
                                       "place": {
                                           ...placeData,
                                           "population": 450000,
                                           "timezone": "America/New_York"
                                       }
                                   }
                               });
}
