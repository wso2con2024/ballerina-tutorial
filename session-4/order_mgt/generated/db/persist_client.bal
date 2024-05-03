// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

import ballerina/jballerina.java;
import ballerina/persist;
import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerinax/persist.sql as psql;

const ORDER = "orders";
const CUSTOMER = "customers";
const ITEM = "items";
const ORDERED_ITEM = "ordereditems";

public isolated client class Client {
    *persist:AbstractPersistClient;

    private final mysql:Client dbClient;

    private final map<psql:SQLClient> persistClients;

    private final record {|psql:SQLMetadata...;|} & readonly metadata = {
        [ORDER]: {
            entityName: "Order",
            tableName: "Order",
            fieldMetadata: {
                orderID: {columnName: "orderID"},
                date: {columnName: "date"},
                customerCustomerID: {columnName: "customerCustomerID"},
                "customer.customerID": {relation: {entityName: "customer", refField: "customerID"}},
                "customer.firstName": {relation: {entityName: "customer", refField: "firstName"}},
                "customer.lastName": {relation: {entityName: "customer", refField: "lastName"}},
                "customer.email": {relation: {entityName: "customer", refField: "email"}},
                "customer.optInEmail": {relation: {entityName: "customer", refField: "optInEmail"}},
                "customer.premiumCustomer": {relation: {entityName: "customer", refField: "premiumCustomer"}},
                "items[].quantity": {relation: {entityName: "items", refField: "quantity"}},
                "items[].orderID": {relation: {entityName: "items", refField: "orderID"}},
                "items[].itemId": {relation: {entityName: "items", refField: "itemId"}}
            },
            keyFields: ["orderID"],
            joinMetadata: {
                customer: {entity: Customer, fieldName: "customer", refTable: "Customer", refColumns: ["customerID"], joinColumns: ["customerCustomerID"], 'type: psql:ONE_TO_MANY},
                items: {entity: OrderedItem, fieldName: "items", refTable: "OrderedItem", refColumns: ["orderID"], joinColumns: ["orderID"], 'type: psql:MANY_TO_ONE}
            }
        },
        [CUSTOMER]: {
            entityName: "Customer",
            tableName: "Customer",
            fieldMetadata: {
                customerID: {columnName: "customerID"},
                firstName: {columnName: "firstName"},
                lastName: {columnName: "lastName"},
                email: {columnName: "email"},
                optInEmail: {columnName: "optInEmail"},
                premiumCustomer: {columnName: "premiumCustomer"},
                "orders[].orderID": {relation: {entityName: "orders", refField: "orderID"}},
                "orders[].date": {relation: {entityName: "orders", refField: "date"}},
                "orders[].customerCustomerID": {relation: {entityName: "orders", refField: "customerCustomerID"}}
            },
            keyFields: ["customerID"],
            joinMetadata: {orders: {entity: Order, fieldName: "orders", refTable: "Order", refColumns: ["customerCustomerID"], joinColumns: ["customerID"], 'type: psql:MANY_TO_ONE}}
        },
        [ITEM]: {
            entityName: "Item",
            tableName: "Item",
            fieldMetadata: {
                itemId: {columnName: "itemId"},
                name: {columnName: "name"},
                manufacturer_code: {columnName: "manufacturer_code"},
                unit_price: {columnName: "unit_price"},
                "ordereditems[].quantity": {relation: {entityName: "ordereditems", refField: "quantity"}},
                "ordereditems[].orderID": {relation: {entityName: "ordereditems", refField: "orderID"}},
                "ordereditems[].itemId": {relation: {entityName: "ordereditems", refField: "itemId"}}
            },
            keyFields: ["itemId"],
            joinMetadata: {ordereditems: {entity: OrderedItem, fieldName: "ordereditems", refTable: "OrderedItem", refColumns: ["itemId"], joinColumns: ["itemId"], 'type: psql:MANY_TO_ONE}}
        },
        [ORDERED_ITEM]: {
            entityName: "OrderedItem",
            tableName: "OrderedItem",
            fieldMetadata: {
                quantity: {columnName: "quantity"},
                orderID: {columnName: "orderID"},
                itemId: {columnName: "itemId"},
                "order.orderID": {relation: {entityName: "order", refField: "orderID"}},
                "order.date": {relation: {entityName: "order", refField: "date"}},
                "'order.customerCustomerID": {relation: {entityName: "order", refField: "customerCustomerID"}},
                "item.itemId": {relation: {entityName: "item", refField: "itemId"}},
                "item.name": {relation: {entityName: "item", refField: "name"}},
                "item.manufacturer_code": {relation: {entityName: "item", refField: "manufacturer_code"}},
                "item.unit_price": {relation: {entityName: "item", refField: "unit_price"}}
            },
            keyFields: ["orderID", "itemId"],
            joinMetadata: {
                'order: {entity: Order, fieldName: "'order", refTable: "Order", refColumns: ["orderID"], joinColumns: ["orderID"], 'type: psql:ONE_TO_MANY},
                item: {entity: Item, fieldName: "item", refTable: "Item", refColumns: ["itemId"], joinColumns: ["itemId"], 'type: psql:ONE_TO_MANY}
            }
        }
    };

    public isolated function init() returns persist:Error? {
        mysql:Client|error dbClient = new (host = host, user = user, password = password, database = database, port = port, options = connectionOptions);
        if dbClient is error {
            return <persist:Error>error(dbClient.message());
        }
        self.dbClient = dbClient;
        self.persistClients = {
            [ORDER]: check new (dbClient, self.metadata.get(ORDER), psql:MYSQL_SPECIFICS),
            [CUSTOMER]: check new (dbClient, self.metadata.get(CUSTOMER), psql:MYSQL_SPECIFICS),
            [ITEM]: check new (dbClient, self.metadata.get(ITEM), psql:MYSQL_SPECIFICS),
            [ORDERED_ITEM]: check new (dbClient, self.metadata.get(ORDERED_ITEM), psql:MYSQL_SPECIFICS)
        };
    }

    isolated resource function get orders(OrderTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get orders/[string orderID](OrderTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post orders(OrderInsert[] data) returns string[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ORDER);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from OrderInsert inserted in data
            select inserted.orderID;
    }

    isolated resource function put orders/[string orderID](OrderUpdate value) returns Order|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ORDER);
        }
        _ = check sqlClient.runUpdateQuery(orderID, value);
        return self->/orders/[orderID].get();
    }

    isolated resource function delete orders/[string orderID]() returns Order|persist:Error {
        Order result = check self->/orders/[orderID].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ORDER);
        }
        _ = check sqlClient.runDeleteQuery(orderID);
        return result;
    }

    isolated resource function get customers(CustomerTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get customers/[string customerID](CustomerTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post customers(CustomerInsert[] data) returns string[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(CUSTOMER);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from CustomerInsert inserted in data
            select inserted.customerID;
    }

    isolated resource function put customers/[string customerID](CustomerUpdate value) returns Customer|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(CUSTOMER);
        }
        _ = check sqlClient.runUpdateQuery(customerID, value);
        return self->/customers/[customerID].get();
    }

    isolated resource function delete customers/[string customerID]() returns Customer|persist:Error {
        Customer result = check self->/customers/[customerID].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(CUSTOMER);
        }
        _ = check sqlClient.runDeleteQuery(customerID);
        return result;
    }

    isolated resource function get items(ItemTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get items/[string itemId](ItemTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post items(ItemInsert[] data) returns string[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ITEM);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from ItemInsert inserted in data
            select inserted.itemId;
    }

    isolated resource function put items/[string itemId](ItemUpdate value) returns Item|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ITEM);
        }
        _ = check sqlClient.runUpdateQuery(itemId, value);
        return self->/items/[itemId].get();
    }

    isolated resource function delete items/[string itemId]() returns Item|persist:Error {
        Item result = check self->/items/[itemId].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ITEM);
        }
        _ = check sqlClient.runDeleteQuery(itemId);
        return result;
    }

    isolated resource function get ordereditems(OrderedItemTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get ordereditems/[string orderID]/[string itemId](OrderedItemTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post ordereditems(OrderedItemInsert[] data) returns [string, string][]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ORDERED_ITEM);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from OrderedItemInsert inserted in data
            select [inserted.orderID, inserted.itemId];
    }

    isolated resource function put ordereditems/[string orderID]/[string itemId](OrderedItemUpdate value) returns OrderedItem|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ORDERED_ITEM);
        }
        _ = check sqlClient.runUpdateQuery({"orderID": orderID, "itemId": itemId}, value);
        return self->/ordereditems/[orderID]/[itemId].get();
    }

    isolated resource function delete ordereditems/[string orderID]/[string itemId]() returns OrderedItem|persist:Error {
        OrderedItem result = check self->/ordereditems/[orderID]/[itemId].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ORDERED_ITEM);
        }
        _ = check sqlClient.runDeleteQuery({"orderID": orderID, "itemId": itemId});
        return result;
    }

    remote isolated function queryNativeSQL(sql:ParameterizedQuery sqlQuery, typedesc<record {}> rowType = <>) returns stream<rowType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor"
    } external;

    remote isolated function executeNativeSQL(sql:ParameterizedQuery sqlQuery) returns psql:ExecutionResult|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor"
    } external;

    public isolated function close() returns persist:Error? {
        error? result = self.dbClient.close();
        if result is error {
            return <persist:Error>error(result.message());
        }
        return result;
    }
}

