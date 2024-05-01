import ballerina/io;

public function main() returns error? {

    int a = 10;
    float b = 10.0;
    decimal c = 10.123;

    // No Auto Conversion between numeric types
    // decimal d = a + b + c; // Compile Time Error

    // int e = a + c; // // Compile Time Error: Why ?
    // Loss of precision

    // Solution: Explicit Conversion
    int e = a + <int>c;
    //          ^^^^^^ Type Cast works as numerical type conversion

    // Example of Multiplication
    float f = 2 * 1.1;
    //        ^ Here 2 is not a integer literal, rather it is a 2.0 float literal.

    float g = a * 1.1;
    //        ^  Allowed multiplication using a integer value. Why?
    // float g = 1.1 + 1.1 + .... + 1.1; // Sum of 1.1 repeated `a` times.

    // float h = a * a; // Compile Time Error
}
