import ballerina/io;

// Tuples are list, but members are defined separately for each index

public function main() returns error? {

    [int, string, string, boolean] person = [1, "John", "Doe", true];

    io:println("Third element: ", person[2]);

    [int...] data1 = [1, 2, 3];
    int[] data2 = [1, 2, 3];

    // Equality check
    io:println("Deep equality check ==", data1 == data2); // true
    io:println("Reference equality check ===", data1 === data2); // false

    io:println("Type of data1: ", typeof data1);
    io:println("Type of data2: ", typeof data2);

    // Open Tuples
    [int, string, boolean, int...] details = [1, "John", true, 10, 20, 30];

    int score = details[5]; // Panic at runtime if the index is out of bounds
    io:println("Score: ", score);

    string name = details[1];

    (int|string|boolean)[] scores = details.slice(3);
    //^^^^^^^^^^^^^^^^^ Member type is inferred as int|string|boolean 

    int[] scores2 = check scores.cloneWithType();
    io:println("Scores2: ", scores2);
}

// Open vs Closed Arrays and Tuples

type OpenArray int[];
type OpenTuple [int...];

type ClosedArray int[3];
type ClosedTuple [int, int, int];