import ballerina/data.xmldata;
import ballerina/io;

public function main() returns error? {
    // Replace Person with Person2 or Person3 to see the difference
    xml x = xml `<p:person xmlns:p="www.example.org/personData" age="30">
    <p:name>John</p:name>
    <a:address xmlns:a="www.example.org/personAddress">
        <a:city>Hollywood</a:city>
        <a:state>FL</a:state>
        <a:country>USA</a:country>
    </a:address>
</p:person>`;

    Person person = check xmldata:parseAsType(x);
    io:println(person);

    stream<io:Block, io:Error?> streamResult = check io:fileReadBlocksAsStream("18_data.xml");
    Person person2 = check xmldata:parseStream(streamResult);
    io:println(person2);
}

// Generated from the XML value above.

type A_Address record {
    string city;
    string state;
    string country;
};

@xmldata:Name {value: "person"}
type Person record {
    string name;
    A_Address address;
    @xmldata:Attribute
    string age;
};
