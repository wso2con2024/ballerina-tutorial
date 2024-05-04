import ballerina/data.jsondata;
import ballerina/io;

public function main() returns error? {
    string ediMsg = check io:fileReadString("resources/message.edi");
    SimpleOrder data = check fromEdiString(ediMsg);
    io:println(jsondata:prettify(data));

    // Modify the data
    data.items.push({code: "ITM", item: "Item 10", quantity: 3});
    data.items.push({code: "ITM", item: "Item 11", quantity: 4});
    data.items.push({code: "ITM", item: "Item 12", quantity: 5});

    // Write the modified data back to new EDI message
    string modifiedData = check toEdiString(data);
    check io:fileWriteString("resources/modified_message.edi", modifiedData);
}
