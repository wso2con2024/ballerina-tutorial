import ballerina/io;

public function main() {

    // String Literals
    string str1 = "Hello, World!";

    string firstName = "John";
    string lastName = "Doe";

    int age = 35;
    boolean permanent = true;

    // String Template
    string template = string `Person Details
    Name: ${fullName(firstName, lastName)},
    Age: ${age},
    Permanent: ${permanent}`;

    io:println("String Template: ", template);

    // Operations on Strings
    string fullName = firstName + " " + lastName;

    string:Char charAt = str1[2]; // Access String Code Points
    io:println("Character: ", charAt);

    int length = str1.length();
    io:println("Length of the string: ", length);

    // String are immutable
    // str1[0] = "5"; // Compilation Error

    // String Library Functions

    boolean cond = string:includes(template, "John");
    boolean cond2 = template.includes("John"); // Same as above.

    // No implicit conversion between string and other types
    string number = 10.toString();
}

function fullName(string firstName, string lastName) returns string {
    return string `${firstName} ${lastName}`;
}
