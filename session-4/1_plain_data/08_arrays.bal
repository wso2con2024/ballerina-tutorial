import ballerina/io;

public function main() {

    int[] numbers = [1, 2, 3, 4, 5];

    int num1 = numbers[2];
    io:println("num1: ", num1); // 3

    numbers[2] = 10;
    io:println("Updated numbers: ", numbers);

    numbers[9] = 20;
    io:println("Updated numbers: ", numbers);

    // Fixed size arrays
    string[3] colors = ["red", "green", "blue"];
    io:println("colors: ", colors);

    colors[1] = "black";
    // colors[4] = "yellow"; // Compilation error
    io:println("Updated colors: ", colors);

    // Array Library Functions
    io:println("Length of numbers: ", numbers.length());

    int[] pow2 = numbers.filter(n => n % 2 == 0).map(n => n * n);
    io:println("Pow2: ", pow2);

    // Stack and Queue operations
    string[] stack = [];
    stack.push("A");
    stack.push("B", "C");
    _ = stack.pop();
    stack.push("D");
    io:println("Stack: ", stack);

    int[] queue = [];
    queue.push(1);
    queue.push(2, 3, 4);
    _ = queue.shift();
    queue.push(5);
    io:println("Queue: ", queue);

    // Array of Arrays

    int[][] matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
    io:println("Matrix: ", matrix);
}
