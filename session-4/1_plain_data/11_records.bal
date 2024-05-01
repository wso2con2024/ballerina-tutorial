import ballerina/io;

type Person record {
    string firstName;
    string lastName;
    int age;
};

public function main() {

    Person person = {firstName: "John", lastName: "Doe", age: 30};
    io:println("Person: ", person);

    // Access fields
    string firstName = person.firstName; // No nil check required
    string lastName = person["lastName"];

    string key = "age";
    anydata age = person[key];
    //^^^^^  Why anydata?. Not string|int
    // By default records are maps and the key can be anydata.

    map<anydata> personMap = person; // Records are maps.

    personMap["city"] = "Hollywood";

    io:println("Person with City: ", person);

    // Update record fields
    person.firstName = "Jane";
    person["city"] = "Miami";

    // Remove field
    _ = person.remove("city"); // Panics if key is not found
    _ = person.remove("firstName"); // Panics, even if key is found.
}
