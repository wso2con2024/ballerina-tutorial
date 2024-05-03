import ballerina/io;

type FullName record {
    string firstName;
    string lastName;
};

type Name FullName|string;

public function main() {

    Name name1 = {
        firstName: "John",
        lastName: "Doe"
    };

    Name name2 = "Jane Doe";

    io:println(nameToString(name1));
    io:println(nameToString(name2));

    // Optional types
    string? name3 = "Bob Smith";
    name3 = ();

    if name3 is () {
        io:println("Name is not set");
    } else {
        io:println("Name is set");
    }
}

function nameToString(Name name) returns string {
    if name is string {
        // name is a string
        return name;
    } else {
        // name is a record
        return name.firstName + " " + name.lastName;
    }
}

// Common mistake defining an union type with records

// Here when records are open, Manager is a subtype of Person 
// and Employee is a subtype of Person.
// Not a proper way to define a union type. Why? not exclusive
type User Person|Employee|Manager;

type Person record {
    string firstName;
    string lastName;
};

type Employee record {
    *Person;
    int employeeId;
};

type Manager record {
    *Person;
    int managerId;
    string email;
};

function unionExample() {

    Person p = {firstName: "John", lastName: "Doe"};

    User user = p; // Works


    // Non-exclusive union type leads to ambiguity and compile time error.
    //User user1 = {firstName: "Jane", lastName: "Doe", employeeId: 1};

    // if user is Manager {
    //     Manager m = user;
    // } else if user is Person {
    //     Person p1 = user;
    // } else if user is Employee {
    //     Employee e = user;
    // }
}
