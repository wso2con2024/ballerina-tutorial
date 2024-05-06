import ballerina/http;
import ballerina/io;

final http:Client geoClient = check new ("https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets");

type CityDataResultsItem record {
    int population;
    string timezone;
};

type CityData record {
    int total_count;
    CityDataResultsItem[] results;
};

public function main() returns error? {
    string city = "Miami";
    string country = "United States";

    CityData cityData = check geoClient->get(
        string `/geonames-all-cities-with-a-population-500/records?refine=name:${
            city}&refine=country:${country}`);
    io:println(cityData);
}
