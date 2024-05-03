import ballerina/data.jsondata;
import ballerina/graphql;
import ballerina/io;

final graphql:Client cl = check new ("https://localhost:9000/reviewed", secureSocket = {
                                        cert: "./resources/certs/public.crt"
                                    });

public function main() returns error? {
    json payload = check cl->execute(string `{
        places {
            id
            name
            city
            country
        }
    }`);
    io:println(jsondata:prettify(payload));

    Response response = check cl->execute(string `query QueryPlace($placeId: ID!) {
        place(placeId: $placeId) {
            id
            name
            city
            country
            timezone
        }
    }`, {"placeId": 8001});
    io:println(jsondata:prettify(response.data));
    io:println(response.hasKey("errors"));

    response = check cl->execute(string `query QueryPlace($placeId: ID!) {
        place(placeId: $placeId) {
            id
            name
            city
            country
            timezone
        }
    }`, {"placeId": 8002});
    io:println(response.data is ());
    io:println(response.hasKey("errors"));
    io:println(response.errors);
}

type Place record {|
    int id;
    string name;
    string city;
    string country;
    string? timezone;
|};

type Response record {
    graphql:ErrorDetail[] errors?;
    record {|
        Place place;
    |}? data;
};
