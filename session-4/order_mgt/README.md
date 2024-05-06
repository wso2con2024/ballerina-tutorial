# Example 2: Building a simple data-oriented service

This example demonstrates how to build a simple data-oriented service using Ballerina. The service is a simple order management system that stores order data in a MySQL database. The service exposes RESTful endpoints.

- Building a data persistance service, using Ballerina persist tool
- Expose the service as a RESTful service
- Demonstrate the JSON data processing capabilities of ballerina.
- Capabilities of new `ballerina\data.jsondata` module. 

## Building the example from scratch 

For the convenience of this example, the service is already implemented in the `order_mgt` module. You can follow the steps below to build the example from scratch.

### Step 1 - Using Bal Persist to create a data persistence service

* Create new Ballerina Module called `order_mgt` 
    `bal new order_mgt`
* Nevigate to the project directory
    `cd order_mgt`
* Add data persistence support
    `bal persist add --module db --datastore mysql`
* Define the database model in `order_mgt/persist/model.bal`
    Copy the content from `data/db_model.bal`
* Build project
    `bal build`
* To configure the database connection, add the following configurations to the `Config.toml` file.
```toml
[order_mgt.db]
host = "localhost"
port = 3307
user = "dbuser"
password = "dbpwd123"
database = "orderDB"
```
* Start MySQL server and create a database and insert data using the following SQL script.
  * Option 1 - Using Docker Composer
    Execute docker compose up in the `order_mgt` directory.
    `docker compose up`
  * Option 2 - Using MySQL Client
    - Create a database called `orderDB` and create tables using the `generated/db/schema.sql` file.
    - Insert data using the `_samples/db/data-seed.sql` file.

### Step 2 - Create the order management RESTful service

* Create a http service with following resources in service.bal

```ballerina
import ballerina/http;
import ballerina/log;
import ballerina/uuid;

service / on new http:Listener(9090) {
    resource function post item(http:Request request) returns json|http:BadRequest {
        // Simple error handling technique.
        string ref = uuid:createType1AsString();
        do {
            // Transform the request to a item db entity
            db:ItemInsert item = {}; // Transform Request to Item

            // Insert the item to the db and log
            
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
```
> Note! This service contains a single resource that accepts a POST request to add an item to the order management system. This resource includes a simple error handling for demonstration purposes. 
> But in a real-world scenario, you should handle errors more effectively. You could use ballerina built-in observability features to monitor the service and log errors.
> https://ballerina.io/learn/by-example/tracing/
>

### Step 3 - Create required data schemas

* Add records using provided JSON value.

```json 
{
    "item_details": {
        "sku": "SMP-001",
        "name": "Sample Item",
        "description": "This is a sample item"
    },
    "manufacturer": {
        "name": "ABC Corporation",
        "location": {
            "city": "New York",
            "country": "USA"
        },
        "code": "MFG-ABC"
    },
    "stock": {
        "quantity": 10.0,
        "price": {
            "currency": "USD",
            "amount": 1999.90
        },
        "warehouse": {
            "location_id": "WH001",
            "address": "New York, NY, 10001"
        }
    },
    "tags": [
        "Electronics",
        "Office"
    ],
    "reviews": [
        {
            "user_id": 12345,
            "rating": 4,
            "comment": "Very useful product, good value for the money.",
            "date": "2024-03-21"
        },
        {
            "user_id": 67890,
            "rating": 5,
            "comment": "Excellent! Works better than expected.",
            "date": "2024-03-22"
        }
    ]
}
```
* Use Data Binding to map http:Request to the record type.
* Use Data Mapping to map the record type to the database entity.
* Remove Unwanted fields from the Record types. Why
  - Easy to adopt to front-end requirements. (Robustness Principle)
  - Easy to maintain the code. Keep it simple.


### Step 4 - Insert the item to the database

* Create `db:Client` varaible to connect to the database.

```ballerina
final isolated db:Client dbClient = check new ();
```

* Insert the item to the database.

```ballerina
 string[] result = check dbClient->/items.post([item]);
```

### Step 5 - Create Get Order resource

* Following is the implementation of the get order resource. 
  
```ballerina
resource function get orders/[string id]() returns OrderResponse|http:NotFound|http:InternalServerError {
        string ref = uuid:createType1AsString();
        do {
            // Get the order from the db
            // 2 Steps:
            // Step 1. Get the order with orderedItems

            // Step 2. Get the order items for the order

            // Transform the db entity to the response
            return transformOrder(data, list);
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
```
* Inorder to get the order from the database, you need to implement the following steps.
  - Get the order with orderedItems
  - Get the items for the orderedItems
  - Then merge the data to create OrderResponse.
  
* If the order is not found, return a 404 response. For this check the error type and return