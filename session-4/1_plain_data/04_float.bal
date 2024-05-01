// import ballerina/io;

// float is a 64-bit IEEE 754 floating point number.

public function main() returns error? {

    // Float literals
    float a = 10.0;
    float b = -0.10;
    float c = 10.0f;
    //            ^  use `f`or `F` suffix to specify a float literal.

    float d = 0x1e.ac;
    //        ^^^^^^^ Hexadecimal floating-point literals are supported.

    // Float operations and Library functions
    float sum = a + b;
    float div = a / b;
    float log = float:log(a);
    float pow = float:pow(a, 2.0);

    float val = check float:fromString("10.0");
}
