import ballerina/data.xmldata;
import ballerina/io;

public function main() returns error? {
    // Replace Person with Person2 or Person3 to see the difference
    Person j = {
        "name": "John",
        "age": 30,
        address: {
            "city": "Hollywood",
            "state": "FL",
            "country": "USA"
        }
    };

    xml x = check xmldata:toXml(j);

    io:println(x);
}

type Person record {
    string name;
    int age;
    Address address;
};

type Address record {
    string city;
    string state;
    string country;
};

@xmldata:Name {
    value: "person"
}
type Person2 record {
    string name;
    @xmldata:Attribute
    int age;
    Address address;
};

@xmldata:Name {
    value: "person"
}
@xmldata:Namespace {
    uri: "www.example.com/person",
    prefix: "per"
}
type Person3 record {
    @xmldata:Namespace {
        uri: "www.example.com/person",
        prefix: "per"
    }
    string name;
    @xmldata:Attribute
    int age;
    Address3 address;
};

@xmldata:Namespace {
    uri: "www.example.com/address",
    prefix: "add"
}
type Address3 record {
    string city;
    string state;
    string country;
};

// Use xml to record conversion to generate the xml schema with the annotations

// <p:person xmlns:p="www.example.org/personData" age="30">
//     <p:name >John</p:name>
//     <a:address xmlns:a="www.example.org/personAddress">
//         <a:city>Hollywood</a:city>
//         <a:state>FL</a:state>
//         <a:country>USA</a:country>
//     </a:address>
// </p:person>

