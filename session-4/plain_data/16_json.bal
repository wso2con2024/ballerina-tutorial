import ballerina/data.jsondata;
import ballerina/io;

type Person record {|
    int id;
    string name;
|};

public function main() returns error? {
    json n = null;
    json i = 21;
    json s = "str";
    json m = {"x": n, "y": s, "z": true};

    io:println(m.toJsonString());
    io:println(jsondata:prettify(m));

    string rawData = "{\"id\": 2, \"name\": \"Georgy\"}";
    // Get the `json` value from the string.
    json j = check rawData.fromJsonString();

    // Access the fields of `j` using field access.
    string name = check j.name;

    // Convert the `json` into a user-defined type.
    Person s1 = check j.cloneWithType();

    // Convert the user-defined type to a `json`.
    Person s2 = {id: 3, name: "Anne"};
    j = s2;

    json data = {id: 4, name: "John", address: {lane: "1st street", city: "NYC}"}};

    // json navigation using lax type.
    string city1 = check data.address.city;
    //                  ^^^^^^^^^^^^^^^^^ Can't guarantee that `data.address` present in the json.
    io:println("City (using lax type): ", city1);

    json city2 = check jsondata:read(data, `$.address.city`);
    io:println("City (using jsondata:read): ", city2);
}

