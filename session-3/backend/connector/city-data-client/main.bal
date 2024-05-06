import ballerina/http;

public isolated client class Client {
    final http:Client geoClient;

    public isolated function init() returns error? {
        self.geoClient = check new ("https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets");
    }

    isolated remote function getCityData(string city, string country) returns CityDataResultsItem|error {
        CityData cityData = check self.geoClient->get(
            string `/geonames-all-cities-with-a-population-500/records?refine=name:${
                city}&refine=country:${country}`);

        if cityData.total_count == 0 {
            return error(string `cannot find data for ${city}, ${country}`);
        }

        // Assume the entry with the highest population is the most correct one.
        CityDataResultsItem[] results = cityData.results;
        int[] populationValues = from CityDataResultsItem {population} in results select population;
        int max = int:max(populationValues[0], ...populationValues.slice(1));
        int indexOfEntryWithHighestPopulation = check populationValues.indexOf(max).ensureType();
        return results[indexOfEntryWithHighestPopulation];
    }
}


public type Coordinates record {
    decimal lon;
    decimal lat;
};

public type CityDataResultsItem record {
    int population;
    string timezone;
    string admin1_code;
    string? elevation;
    string country;
    string latitude;
    Coordinates coordinates;
    anydata country_code_2;
    int dem;
    anydata admin4_code;
    string geoname_id;
    string[] alternate_names;
    string country_code;
    string feature_class;
    string ascii_name;
    string admin2_code;
    string modification_date;
    string name;
    anydata admin3_code;
    string feature_code;
    string longitude;
};

type CityData record {
    int total_count;
    CityDataResultsItem[] results;
};
