import ballerina/constraint;
import ballerina/io;

// int : 64 bit signed integer

public function main() returns error? {

    // Integer Literals
    int a = 10;
    int b = 0x10;
    //      ^^^^ Hexadecimal literals are supported.

    // Integer Operations and Library Functions
    int sum = a + b;
    int diff = a - b;
    int max = int:max(a, b);
    int val = check int:fromString("10");

    // Integer Subtypes
    int:Signed32 signed32 = -10;
    int:Unsigned32 unsigned32 = 10;

    // Byte is a subtype of int
    byte aByte = 10; // 0 <= aByte < 256

    int:Unsigned8 unsigned8 = aByte;
    int c = aByte;

    // Equality
    if c == aByte {
        io:println("c is equal to aByte");
    }

    // Special values
    int d = int:MAX_VALUE;

    // Constraints Validation
    Grades grades = {math: 90, chemistry: 110, physics: 70};
    Grades validGrade = check constraint:validate(grades);
    //     ^^^^^^^^^^^ By defining this as immutable, we can ensure that the validated 
    //                 value is not modified. Let's discuss this during the immutability example.
}

// Constraints API is used to do validations on the Ballerina types.

type Grades record {
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
};
