import ballerina/http;
import ballerina/log;
import ballerina/uuid;

service / on new http:Listener(9090) {

    resource function post item(http:Request request) returns ItemResponse|http:BadRequest {
        // Simple error handling technique.
        string ref = uuid:createType1AsString();
        do {
            // Transform the request to a item db entity

            // Insert the item to the db
            
            // Send the response
            return {code: ref};
        } on fail error err {
            // Error handling
            http:BadRequest badRequest = {
                body: {message: "Invalid request", code: ref}
            };

            log:printError("Add Item Error", err, code = ref);
            return badRequest;
        }
    }
}
