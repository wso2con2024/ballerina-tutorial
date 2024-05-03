import ballerina/io;

public function main() {

    // Nil Literal
    var varA = ();
    var varB = null;

    // Represent Optional Values
    int? varC = 10;
    varC = ();

    io:println("varC: ", varC);

    // Handling Nil.

    int varD = varC ?: 5;
    //         ^^^^^^^^^^ Elvis Operator (x ?: y) 
    // Check x is not nil, if so return x, else return y
    io:println("varD: ", varD);

    int varE = varC is int ? varC : 5;
    //         ^^^^^^^^^^^^^^^^^^^^^^^ Ternary Operator (Conditional ? Then : Else)
    //         ^^^^^^^^^^^ Type Test 
    io:println("varE: ", varE);
}
