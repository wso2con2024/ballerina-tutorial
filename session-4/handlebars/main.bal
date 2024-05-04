import templates.com.github.jknack.handlebars;
import templates.java.lang;
import templates.java.util;

import ballerina/io;
import ballerina/jballerina.java;

public function main() returns error? {

    // Read the template file.
    string hbs = check io:fileReadString("resources/template.hbs");

    // Compile the template.
    handlebars:Handlebars handlebars = handlebars:newHandlebars1();
    handlebars:Template template = check handlebars.compileInline(hbs);

    // Using Java HashMap to represent the data.
    util:HashMap person = util:newHashMap1();
    _ = person.put(new lang:Object(java:fromString("name")), new lang:Object(java:fromString("John Doe")));
    _ = person.put(new lang:Object(java:fromString("age")), new lang:Object(createHandle(30)));

    util:HashMap address = util:newHashMap1();
    _ = address.put(new lang:Object(java:fromString("street")), new lang:Object(java:fromString("123 Abc St")));
    _ = address.put(new lang:Object(java:fromString("city")), new lang:Object(java:fromString("Abc City")));
    _ = address.put(new lang:Object(java:fromString("state")), new lang:Object(java:fromString("Abc State")));
    _ = address.put(new lang:Object(java:fromString("zip")), new lang:Object(java:fromString("12345")));

    _ = person.put(new lang:Object(java:fromString("address")), address);

    // Template Apply
    string value = check template.apply3(person);

    // Write the output to a file.
    check io:fileWriteString("resources/demo.html", value);
}

// This is a Ballerina extern function to call a Java method.

function createHandle(any data) returns handle = @java:Method {
    name: "createHandleValue",
    'class: "io.ballerina.runtime.api.creators.ValueCreator"
} external;
