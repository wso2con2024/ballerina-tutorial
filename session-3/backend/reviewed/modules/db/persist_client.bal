// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

import ballerina/jballerina.java;
import ballerina/persist;
import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerinax/persist.sql as psql;

const PLACE = "places";
const REVIEW = "reviews";
const AUTHOR = "authors";

public isolated client class Client {
    *persist:AbstractPersistClient;

    private final mysql:Client dbClient;

    private final map<psql:SQLClient> persistClients;

    private final record {|psql:SQLMetadata...;|} & readonly metadata = {
        [PLACE]: {
            entityName: "Place",
            tableName: "Place",
            fieldMetadata: {
                id: {columnName: "id"},
                name: {columnName: "name"},
                city: {columnName: "city"},
                country: {columnName: "country"},
                entryFee: {columnName: "entryFee"},
                "reviews[].id": {relation: {entityName: "reviews", refField: "id"}},
                "reviews[].rating": {relation: {entityName: "reviews", refField: "rating"}},
                "reviews[].content": {relation: {entityName: "reviews", refField: "content"}},
                "reviews[].placeId": {relation: {entityName: "reviews", refField: "placeId"}},
                "reviews[].authorId": {relation: {entityName: "reviews", refField: "authorId"}}
            },
            keyFields: ["id"],
            joinMetadata: {reviews: {entity: Review, fieldName: "reviews", refTable: "Review", refColumns: ["placeId"], joinColumns: ["id"], 'type: psql:MANY_TO_ONE}}
        },
        [REVIEW]: {
            entityName: "Review",
            tableName: "Review",
            fieldMetadata: {
                id: {columnName: "id"},
                rating: {columnName: "rating"},
                content: {columnName: "content"},
                placeId: {columnName: "placeId"},
                authorId: {columnName: "authorId"},
                "place.id": {relation: {entityName: "place", refField: "id"}},
                "place.name": {relation: {entityName: "place", refField: "name"}},
                "place.city": {relation: {entityName: "place", refField: "city"}},
                "place.country": {relation: {entityName: "place", refField: "country"}},
                "place.entryFee": {relation: {entityName: "place", refField: "entryFee"}},
                "author.id": {relation: {entityName: "author", refField: "id"}},
                "author.username": {relation: {entityName: "author", refField: "username"}}
            },
            keyFields: ["id"],
            joinMetadata: {
                place: {entity: Place, fieldName: "place", refTable: "Place", refColumns: ["id"], joinColumns: ["placeId"], 'type: psql:ONE_TO_MANY},
                author: {entity: Author, fieldName: "author", refTable: "Author", refColumns: ["id"], joinColumns: ["authorId"], 'type: psql:ONE_TO_MANY}
            }
        },
        [AUTHOR]: {
            entityName: "Author",
            tableName: "Author",
            fieldMetadata: {
                id: {columnName: "id"},
                username: {columnName: "username"},
                "reviews[].id": {relation: {entityName: "reviews", refField: "id"}},
                "reviews[].rating": {relation: {entityName: "reviews", refField: "rating"}},
                "reviews[].content": {relation: {entityName: "reviews", refField: "content"}},
                "reviews[].placeId": {relation: {entityName: "reviews", refField: "placeId"}},
                "reviews[].authorId": {relation: {entityName: "reviews", refField: "authorId"}}
            },
            keyFields: ["id"],
            joinMetadata: {reviews: {entity: Review, fieldName: "reviews", refTable: "Review", refColumns: ["authorId"], joinColumns: ["id"], 'type: psql:MANY_TO_ONE}}
        }
    };

    public isolated function init() returns persist:Error? {
        mysql:Client|error dbClient = new (host = host, user = user, password = password, database = database, port = port, options = connectionOptions);
        if dbClient is error {
            return <persist:Error>error(dbClient.message());
        }
        self.dbClient = dbClient;
        self.persistClients = {
            [PLACE]: check new (dbClient, self.metadata.get(PLACE), psql:MYSQL_SPECIFICS),
            [REVIEW]: check new (dbClient, self.metadata.get(REVIEW), psql:MYSQL_SPECIFICS),
            [AUTHOR]: check new (dbClient, self.metadata.get(AUTHOR), psql:MYSQL_SPECIFICS)
        };
    }

    isolated resource function get places(PlaceTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get places/[int id](PlaceTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post places(PlaceInsert[] data) returns int[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(PLACE);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from PlaceInsert inserted in data
            select inserted.id;
    }

    isolated resource function put places/[int id](PlaceUpdate value) returns Place|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(PLACE);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/places/[id].get();
    }

    isolated resource function delete places/[int id]() returns Place|persist:Error {
        Place result = check self->/places/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(PLACE);
        }
        _ = check sqlClient.runDeleteQuery(id);
        return result;
    }

    isolated resource function get reviews(ReviewTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get reviews/[int id](ReviewTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post reviews(ReviewInsert[] data) returns int[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(REVIEW);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from ReviewInsert inserted in data
            select inserted.id;
    }

    isolated resource function put reviews/[int id](ReviewUpdate value) returns Review|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(REVIEW);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/reviews/[id].get();
    }

    isolated resource function delete reviews/[int id]() returns Review|persist:Error {
        Review result = check self->/reviews/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(REVIEW);
        }
        _ = check sqlClient.runDeleteQuery(id);
        return result;
    }

    isolated resource function get authors(AuthorTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get authors/[int id](AuthorTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post authors(AuthorInsert[] data) returns int[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(AUTHOR);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from AuthorInsert inserted in data
            select inserted.id;
    }

    isolated resource function put authors/[int id](AuthorUpdate value) returns Author|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(AUTHOR);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/authors/[id].get();
    }

    isolated resource function delete authors/[int id]() returns Author|persist:Error {
        Author result = check self->/authors/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(AUTHOR);
        }
        _ = check sqlClient.runDeleteQuery(id);
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

