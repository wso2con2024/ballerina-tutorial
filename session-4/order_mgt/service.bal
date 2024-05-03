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
            OrderWithRelations data = check dbClient->/orders/[id]();

            GetOrderedItemWithRelations[] list = from var item in data.items
                let GetOrderedItemWithRelations itemData = check dbClient->/ordereditems/[data.orderID]/[item.itemId]()
                select itemData;

            // Transform the db entity to the response
            return transform(data, list);
        } on fail var err {
            // Error handling
            if err is persist:NotFoundError {
                http:NotFound notFound = {
                    body: {message: "Order not found", code: id}
                };
                // Log the incoming request for later analysis
                log:printError("Order Not Found", err, code = ref, id = id);
                return notFound;
            }
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

function transform(OrderWithRelations ord, GetOrderedItemWithRelations[] items) returns OrderResponse => let var prices = (from GetOrderedItemWithRelations item in items
        let decimal value = <decimal>item.quantity * item.item.unit_price
        select value), var total = decimal:sum(...prices).round(2)
    in {
        id: ord.orderID,
        customer: {
            id: ord.customer.customerID,
            name: ord.customer.firstName + " " + ord.customer.lastName,
            email: ord.customer.email,
            loyalty: ord.customer.premiumCustomer.toString(),
            optedInNewsLetter: ord.customer.optInEmail.toString()
        },
        items: from var itemsItem in items
            select {
                id: itemsItem.item.itemId,
                name: itemsItem.item.name,
                quantity: itemsItem.quantity,
                price: itemsItem.item.unit_price + <decimal>itemsItem.quantity
            },
        total: total
    };
