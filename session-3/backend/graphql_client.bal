import ballerina/graphql;
import ballerina/io;

final string document = check io:fileReadString("./reviewed/queries.graphql");

final graphql:Client cl = check new ("https://localhost:9000/reviewed", secureSocket = {
                                        cert: "./resources/certs/public.crt"
                                    });

public function main() returns error? {
    json _ = check cl->execute(document, operationName = "QueryPlacesSummmary");

    json _ = check cl->execute(document, operationName = "QueryPlacesSummmarySortByRating");

    json _ = check cl->execute(document, operationName = "QueryPlacesDetailed");

    json _ = check cl->execute(document, {"placeId": 8001}, "QueryPlace");

    json _ = check cl->execute(document, operationName = "AddReview");

    // Error, constraint validation.
    json _ = check cl->execute(document, operationName = "AddReviewWithInvalidRating");

    // Forbidden.
    json _ = check cl->execute(document, operationName = "AddPlace");

    json response = check cl->execute(document, operationName = "AddPlaceWithInvalidCountryName", headers = {"userId": "5002"});
    int id = check response.data.addPlace.id;

    // Partial error (population and timezone), for invalid country name.
    json _ = check cl->execute(document, {"placeId": id}, "QueryPlace");
}
