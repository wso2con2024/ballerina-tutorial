import ballerina/http;
import ballerina/io;

// custome errors.
type MyError error<record {|
    string details;
    int code;
|}>;

public function main() {

    // Generic error
    error err = error("Error occurred", code = 500, details = "Error details");

    // Custom error
    MyError myError = error MyError("Error occurred", err, code = 500, details = "Error details");
    // Second argument is the cause of the error.
    // Rest of the fields are the fields of the MyError.

    // Error handling
    string|error result = doSomething();
    if result is string {
        io:println("Operation successful");
    } else {
        io:println("Operation failed", result.message());
    }

    // Checking using `check` expression and catch using do-on-fail
    do {
        string result2 = check doSomething();
    } on fail error e {
        io:println("Operation failed", e.message());
    }

    // Error are hard to ignore, if so it has to be explict. Even mistakes are caught.
    // result.toString(); // Mistake caught at compile time.
}

// Errors are returned from functions.
function doSomething() returns string|error {
    return error("Error occurred");
}

// Common mistake.
service on new http:Listener(8080) {

    // Don't let error to be cross the application boundary. 
    // You may expose unwanted information to outside.
    resource function get badAPI() returns string|error {

        string result = check doSomething();
        // do more work
        return result;
    }

    resource function get goodAPI() returns string|http:BadRequest {
        do {
            string result = check doSomething();
            // do more work
            return result;
        } on fail error e {
            // Log the error for auditing. 
            // Return protocol specific error(s) 
            // Optinal return a reference id to track the error.
            return http:BAD_REQUEST; 
        }
    }
}
