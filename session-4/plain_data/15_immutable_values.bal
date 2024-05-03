import ballerina/constraint;
import ballerina/io;

type Person record {
    string name;
    int age;
    Address address;
};

type Address record {
    string street;
    string city;
};

type ImmutablePerson readonly & Person;

public function main() returns error? {

    Person person = {name: "John", age: 30, address: {street: "A Street", city: "A City"}};

    ImmutablePerson ip1 = person.cloneReadOnly();

    ImmutablePerson ip2 = {name: "Jane", age: 30, address: {street: "B Street", city: "B City"}};

    // imutablePerson.name = "Doe"; // Compilation error
    // ImmutablePerson ip1 = person; // Compilation error

    // ImmutablePerson is a subtype of Person
    person = ip1;
    io:println("Immutable Person: ", person is ImmutablePerson); // true

    // Creating a mutable copy of an immutable value. 
    Person person2 = check ip1.cloneWithType();
    person2.name = "Doe";
    io:println("Deep equality: ", person2 == ip1); // false
    io:println("Reference equality: ", person2 === ip1); // false

    // Another Option : If you want to copy only certain fields
    var {name, ...rest} = ip1;
    ImmutablePerson ip3 = {name: "Doe", ...rest};

    // Constraint validation
    Grades grades = {math: 90, chemistry: 80, physics: 70};
    Grades & readonly validatedGrades = check constraint:validate(grades);
    //^^^^^^^^^^^^^^^ This make sure the validatedGrades is not modified again.
}

type Grades record {|
    @constraint:Int {
        minValue: 0,
        maxValue: 100
    }
    int math;
    @constraint:Int {
        minValue: 0,
        maxValue: 100
    }
    int chemistry;
    @constraint:Int {
        minValue: 0,
        maxValue: 100
    }
    int physics;
|};
