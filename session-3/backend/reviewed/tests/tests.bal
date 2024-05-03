import ballerina/graphql;
import ballerina/http;
import ballerina/test;

final graphql:Client cl = check new ("http://localhost:9000/reviewed");

@test:Mock {
    functionName: "getGeoClient"
}
function getMockClient() returns http:Client => test:mock(http:Client);

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

    BasicPlaceData[] expected = from PlaceData {id, name, city, country} in places 
                                    select {
                                        id,
                                        name,
                                        city,
                                        country
                                    };
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
    CityData cityData = {
        total_count: 1,
        results: [
            {
                population: 450000,
                timezone: "America/New_York"
            }
        ]
    };

    test:prepare(geoClient)
        .when("get")
        .withArguments("/geonames-all-cities-with-a-population-500/records?refine=name:Miami&refine=country:United States")
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

    PlaceData placeData = places.get(8001);

    test:assertEquals(payload, {
                                   "data": {
                                       "place": {
                                           "id": placeData.id,
                                           "name": placeData.name,
                                           "city": placeData.city,
                                           "country": placeData.country,
                                           "population": 450000,
                                           "timezone": "America/New_York"
                                       }
                                   }
                               });
}
