import ballerina/constraint;
import ballerina/io;
import ballerinax/persist.sql;

// decimal : 128 bit decimal floating point

public function main() returns error? {

    // Decimal literals
    decimal a = 10.123456789;
    decimal b = -0.10;
    decimal c = 10.0d;
    //              ^  use `d` or `D` suffix to specify a decimal literal.

    // Note: No hex support for decimal literals.
    io:println("Decimal literals: ", a, ", ", b, ", ", c);

    // Decimal operation and library functions
    decimal sub = a - b;
    decimal sum = decimal:sum(a, b);
    decimal avg = decimal:avg(a, b, c);

    decimal qte = decimal:quantize(a, 2.0);
    io:println("Quantized value: ", qte);

    decimal val = check decimal:fromString("10.0");
    io:println("Decimal value: ", val);

}

// Constraints

type Item record {
    @constraint:Number {minValue: 0, maxFractionDigits: 2}
    @sql:Decimal {precision: [10, 2]} // precision, scale
    decimal price = 10.0;
    string name;
};
