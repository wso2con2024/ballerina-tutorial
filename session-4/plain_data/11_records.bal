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
    // _ = person.remove("firstName"); // Panics, even if key is found.

    demoUsers();
}

// Record inclusion. 
type Employee record {
    *Person;
    string employeeId;
    string department;
};

type Contractor record {
    *Person;
    string? employeeId; // Optional type.
    string department?; // Optional field.
};

function demoUsers() {
    Contractor contractor = {
        firstName: "Jane",
        lastName: "Doe",
        age: 25,
        employeeId: ()
    };
    io:println("Contractor: ", contractor);
    // {"employeeId":null,"firstName":"Jane","lastName":"Doe","age":25}

    contractor.employeeId = "C001";
    io:println("Contractor(with ID): ", contractor);
    // {"employeeId":"C001","firstName":"Jane","lastName":"Doe","age":25}

    contractor.employeeId = ();
    io:println("Contractor(without ID): ", contractor);
    // {"employeeId":null,"firstName":"Jane","lastName":"Doe","age":25}

    contractor.department = "HR";
    io:println("Contractor(with Department): ", contractor);
    // {"employeeId":null,"department":"HR","firstName":"Jane","lastName":"Doe","age":25}

    // Remove optional field
    contractor.department = ();
    io:println("Contractor(without Department): ", contractor);
    // {"employeeId":null,"firstName":"Jane","lastName":"Doe","age":25}

    // Record without certain fields
    User user = {username: "john", password: "1234"};
    // user.age = 30; // Compile time error
    string ageKey = "age";
    user[ageKey] = 30; // Panics
}

type User record {
    string username;
    string password;
    never age?;
};

