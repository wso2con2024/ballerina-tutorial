import order_mgt.db;

import ballerina/data.jsondata;
import ballerina/http;
import ballerina/log;
import ballerina/persist;
import ballerina/uuid;

final isolated db:Client dbClient = check new ();

service / on new http:Listener(9090) {

    resource function post item(ItemRequest request) returns ItemResponse|http:BadRequest {
        // Simple error handling technique.
        string ref = uuid:createType1AsString();
        do {
            // Transform the request to a item db entity
            db:ItemInsert item = transformItemRequest(request);

            // Insert the item to the db
            string[] result = check dbClient->/items.post([item]);
            log:printInfo("Item Added:", ref = ref, sku = request.item_details.sku, db_result = result);

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

    resource function post item\-simple(http:Request httpReq) returns ItemResponse|http:BadRequest {
        // Simple error handling technique.
        string ref = uuid:createType1AsString();
        do {
            SimpleItemRequest request = check jsondata:parseStream(check httpReq.getByteStream());
            // Transform the request to a item db entity
            db:ItemInsert item = transformItemRequest(request);

            // Insert the item to the db
            string[] result = check dbClient->/items.post([item]);
            log:printInfo("Item Added:", ref = ref, sku = request.item_details.sku, db_result = result);

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

    resource function get orders/[string id]() returns OrderResponse|http:NotFound|http:InternalServerError {
        string ref = uuid:createType1AsString();
        do {
            // Get the order from the db
            
            // Transform the db entity to the response
        } on fail var err {
            // Error handling
            // Return 404 if the order is not found
            
            // Return 500 if an internal server error occurs
            http:InternalServerError internalError = {
                body: {message: "Internal server error", code: ref}
            };
            log:printError("Get Order Error", err, code = ref, id = id);
            return internalError;
        }
    }
}

function transformItemRequest(ItemRequest itemRequest) returns db:ItemInsert => {
    itemId: itemRequest.item_details.sku,
    name: itemRequest.item_details.name,
    manufacturer_code: itemRequest.manufacturer.code,
    unit_price: itemRequest.stock.price.amount / itemRequest.stock.quantity
};
