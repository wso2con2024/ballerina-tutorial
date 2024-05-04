import ballerina/io;

public function main() {

    map<string> person = {firstName: "John", lastName: "Doe"};
    io:println("Person: ", person);

    // Map access
    string? firstName = person["firstName"];

    string lastName = person.get("lastName"); // Panics if key is not found

    map<string|int> personAge = {firstName: "John", lastName: "Doe", age: 30};

    string|int? age = personAge["age"];

    // Update map

    person["firstName"] = "Jane";
    person["city"] = "Hollywood";

    io:println("Person with City: ", person);

    // Remove key
    _ = person.remove("city"); // Panics if key is not found
    _ = person.removeIfHasKey("city"); // No panic if key is not found

    // Built-in functions
    map<[string, string]> entries = person.entries(); // Returns key-value pairs map

    io:println("Entries: ", entries);

    // Iterate over map
    foreach var value in person {
        // Do something with value
    }

    foreach [string, string] [key, value] in person.entries() {
        //                   ^^^^^^^^^^^^ - Data destructuring   
        // Do something with key and value
    }
}
