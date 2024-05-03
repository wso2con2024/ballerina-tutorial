// Two value - boolean `true` and `false` values

public function main() returns error? {

    // Boolean Literals
    boolean open = true;
    boolean close = false;

    // Boolean Operators
    boolean result1 = open && close; // false
    boolean result2 = open || close; // true

    // Boolean Library Functions
    boolean every = boolean:every(open, close);
    //             ^^^^^^^^^^^^^^^^^^^^^^^^^^^ Lang Library Function
    
    boolean val = check boolean:fromString("true");
}