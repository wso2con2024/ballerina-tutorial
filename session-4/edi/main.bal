import ballerina/data.jsondata;
import ballerina/io;

public function main() returns error? {
    string ediMsg = check io:fileReadString("resources/message.edi");
    SimpleOrder data = check fromEdiString(ediMsg);
    io:println(jsondata:prettify(data));
}
