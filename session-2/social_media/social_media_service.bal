import ballerina/http;
import ballerina/time;

type User record {|
    readonly int id;
    string name;
    time:Date birthDate;
    string mobileNumber;
|};
table<User> key(id) userTable = table [
    {id: 1, name: "John Doe", birthDate: {year:1987, month:2, day:6 }, mobileNumber: "0712345678"},
    {id: 2, name: "Jane Doe", birthDate: {year:1988, month:3, day:7 }, mobileNumber: "0712345679"}
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

@http:ServiceConfig {
    cors: {
        allowOrigins: ["*"]
    }
}
service /social\-media on new http:Listener(9095) {
    resource function get users() returns User[]|error {
        return userTable.toArray();
    }

    resource function get users/[int id]() returns User|UserNotFound|error {
        User? user = userTable[id];
        if user is User {
            return user;
        } else {
            UserNotFound notFound = {
                body:  {message: "User not found", detail: "User not found in the system", timestamp: time:utcNow()}
            };
            return notFound;
        }
    }

    resource function post users(NewUser newUser) returns http:Created|error {
        User user = { id: userTable.length() + 1, ...newUser};
        userTable.add(user);
        return http:CREATED;
    }
}
