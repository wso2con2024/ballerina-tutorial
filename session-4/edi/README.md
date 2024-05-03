# EDI (Electronic Data Interchange) Tool

EDI is a widely used message format for business-to-business (B2B) communications. Ballerina simplifies working with EDI data by converting them to Ballerina records, so that all operations related to Ballerina records can be applied on EDI data as well; e.g. 
- transforming EDI data
- writing EDI data to databases
- transering EDI data over various network protocols, etc.

## Before you begin

First, it is necessary to write a schema for the EDI data type that needs to be processed. You can use [Ballerina EDI Schema Specification](https://github.com/ballerina-platform/module-ballerina-edi/blob/main/docs/specs/SchemaSpecification.md#ballerina-edi-schema-specification) as a reference to write the schema.

This specification outlines the essential components required to describe an EDI schema, encompassing attributes such as _name_, _delimiters_, _segments_, _field definitions_, _components_, _sub-components_, and additional configuration options.

For the demonstration purpose, we will assume that we have an EDI schema that describes the structure of an EDI message. You can find the sample EDI schema [here](./resources/schema.json).
You can find the sample EDI message [here](./resources/message.edi).

## Using the EDI Tool

1. First you need to pull EDI tool. You can do this by executing the following command. Create a Ballerina project and navigate to the project directory and execute the following command.

```shell
bal tool pull edi
```
 This will download the EDI tool to your local machine.

2. Use `bal edi` command to generate ballerina EDI APIs from the EDI schema. You can do this by executing the following command.

```shell
bal edi -i resources/schema.json -o edi.bal
```

3. Now you can use the generated ballerina APIs to process EDI messages. Create a new Ballerina file and copy the following code.

```ballerina
import ballerina/data.jsondata;
import ballerina/io;

public function main() returns error? {
    string ediMsg = check io:fileReadString("resources/message.edi");
    SubmitterEDIContactInformation fromEdiStringResult = check fromEdiString(ediMsg);
    io:println(jsondata:prettify(fromEdiStringResult));
}
```

  You can see that the generated APIs are used to convert the EDI message to a Ballerina record.

4. Now you can use ballerina expression to transform/manipulate the EDI data.

## Useful Links

- [EDI to Record Conversion](https://ballerina.io/learn/by-example/edi-to-record/)
- [Record to EDI Conversion](https://ballerina.io/learn/by-example/record-to-edi/)