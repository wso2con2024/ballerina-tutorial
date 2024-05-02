import order_mgt.db;

import ballerina/data.jsondata;
import ballerina/http;
import ballerina/log;
import ballerina/uuid;

listener http:Listener httpListener = new (9090);

final isolated db:Client dbClient = check new ();

service / on httpListener {

    resource function post item(AddItemRequest request) returns AddItemResponse|http:BadRequest {
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
            // Log the incoming request for later analysis
            log:printError("Add Item Error", err, code = ref, item = request);
            return badRequest;
        }
    }

    resource function post itemSimple(http:Request httpReq) returns AddItemResponse|http:BadRequest {
        // Simple error handling technique.
        string ref = uuid:createType1AsString();
        do {
            SimpleItemRequest request = check jsondata:parseStream(check httpReq.getByteStream());
            // Transform the request to a item db entity
            db:ItemInsert item = transformSimpleItemRequest(request);

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

            // Log the incoming request for later analysis
            json|error request = httpReq.getJsonPayload();
            if (request is error) {
                log:printError("Failed to parse the request", ref = ref);
                return badRequest;
            }
            log:printError("Add Item Error", err, code = ref, item = request);
            return badRequest;
        }
    }

    resource function get orders(string id) returns OrderResponse?|error {
        do {
            // Get the order from the db
            GetOrder data = check dbClient->/orders/[id]();

            // This works fine. But not above
            GetOrderedItem odd = check dbClient->/ordereditems/[id]();

            // Transform the db entity to the response
        } on fail error err {

        }
    }
}

function transformItemRequest(AddItemRequest itemRequest) returns db:ItemInsert => {
    itemId: itemRequest.item_details.sku,
    name: itemRequest.item_details.name,
    manufacturer_code: itemRequest.manufacturer.code,
    unit_price: itemRequest.stock.price.amount / itemRequest.stock.quantity
};

function transformSimpleItemRequest(SimpleItemRequest simpleItemRequest) returns db:ItemInsert => {
    itemId: simpleItemRequest.item_details.sku,
    name: simpleItemRequest.item_details.name,
    manufacturer_code: simpleItemRequest.manufacturer.code,
    unit_price: simpleItemRequest.stock.price.amount / simpleItemRequest.stock.quantity
};

