import ballerina/http;
import ballerina/time;
import ballerinax/mysql;
import ballerina/sql;
import ballerinax/mysql.driver as _;
import social_media.sentiment;

type User record {|
    readonly int id;
    string name;
    @sql:Column {
        name: "birth_date"
    }
    time:Date birthDate;
    @sql:Column {
        name: "mobile_number"
    }
    string mobileNumber;
|};

type ErrorDetails record {
    string message;
    string detail;
    time:Utc timestamp;
};

type UserNotFound record {|
    *http:NotFound;
    ErrorDetails body;
|};

type NewUser record {|
    string name;
    time:Date birthDate;
    string mobileNumber;
|};

public type NewPost record {|
    string description;
    string tags;
    string category;
|};

type PostForbidden record {|
    *http:Forbidden;
    ErrorDetails body;
|};
final sentiment:Client sentimentEp1 = check new ();

configurable string host = ?;
configurable string user = ?;
configurable string password = ?;
configurable string database = ?;
configurable int port = ?;

final mysql:Client socialMediaDb = check new (host, user, password, database, port);

@http:ServiceConfig {
    cors: {
        allowOrigins: ["*"]
    }
}
service /social\-media on new http:Listener(9095) {
    resource function get users() returns User[]|error {
        stream<User, sql:Error?> query = socialMediaDb->query(`SELECT * FROM users`);
        User[] users = check from User user in query select user;
        return users;
    }

    resource function get users/[int id]() returns User|UserNotFound|error {
        User|sql:Error queryRow = socialMediaDb->queryRow(`SELECT * FROM users WHERE id = ${id}`);
        if queryRow is sql:NoRowsError {
            UserNotFound notFound = {
                body: {message: "User not found", detail: "User not found in the system", timestamp: time:utcNow()}
            };
            return notFound;
        } else {
            return queryRow;
        }
    }

    resource function post users(NewUser newUser) returns http:Created|error {
        _ = check socialMediaDb->execute(`
            INSERT INTO users(birth_date, name, mobile_number)
            VALUES (${newUser.birthDate}, ${newUser.name}, ${newUser.mobileNumber});`);
        return http:CREATED;
    }

    resource function post users/[int id]/posts(NewPost newPost) returns http:Created|UserNotFound|PostForbidden|error {
        User|error user = socialMediaDb->queryRow(`SELECT * FROM users WHERE id = ${id}`);
        if user is sql:NoRowsError {
            ErrorDetails errorDetails = {
                message: "User not found",
                detail: "User not found in the system",
                timestamp: time:utcNow()
            };
            UserNotFound userNotFound = {
                body: errorDetails
            };
            return userNotFound;
        }
        if user is error {
            return user;
        }

        sentiment:Sentiment sentiment = check sentimentEp1->/api/sentiment.post({ "text": newPost.description });
        if sentiment.label == "neg" {
            ErrorDetails errorDetails = {
                message: "Post contains negative sentiment",
                detail: "Post contains negative sentiment and cannot be posted",
                timestamp: time:utcNow()
            };
            PostForbidden postForbidden = {
                body: errorDetails
            };
            return postForbidden;
        }

        _ = check socialMediaDb->execute(`
            INSERT INTO posts(description, category, created_time_stamp, tags, user_id)
            VALUES (${newPost.description}, ${newPost.category}, CURRENT_TIMESTAMP(), ${newPost.tags}, ${id});`);
        return http:CREATED;
    }
}
