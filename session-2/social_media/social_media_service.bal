import ballerina/http;
import ballerina/time;
import ballerinax/mysql;
import ballerina/sql;
import ballerinax/mysql.driver as _;

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

table<User> key(id) userTable = table [
    {id: 1, name: "John Doe", birthDate: {year: 1987, month: 2, day: 6}, mobileNumber: "0712345678"},
    {id: 2, name: "Jane Doe", birthDate: {year: 1988, month: 3, day: 7}, mobileNumber: "0712345679"}
];

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
}
