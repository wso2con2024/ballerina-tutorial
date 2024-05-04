# EDI (Electronic Data Interchange) Tool

EDI is a widely used message format for business-to-business (B2B) communications. Ballerina simplifies the manipulation of EDI data by converting it into Ballerina records. This conversion allows developers to apply familiar record operations to EDI data, such as:
- Transforming EDI data
- Writing EDI data to databases
- Transferring EDI data over various network protocols, and more.

## Before You Begin

Start by crafting a schema for the EDI data type you intend to process. Refer to the [Ballerina EDI Schema Specification](https://github.com/ballerina-platform/module-ballerina-edi/blob/main/docs/specs/SchemaSpecification.md#ballerina-edi-schema-specification) for guidance on writing your schema. This specification details the necessary components of an EDI schema, including attributes like _name_, _delimiters_, _segments_, _field definitions_, _components_, _sub-components_, and other configuration options.

For demonstration purposes, we will use a predefined EDI schema and message. You can find the sample EDI schema [here](./resources/schema.json) and the sample EDI message [here](./resources/message.edi).

## Using the EDI Tool

1. **Setup:** 
   To begin, ensure the EDI tool is installed on your local machine. Within your Ballerina project directory, execute the following command:

```shell
bal tool pull edi
```

This command downloads the EDI tool.

2. **Generate Ballerina EDI APIs:**
   Generate the APIs by pointing the tool to your EDI schema with the command below:

```shell
bal edi codegen -i resources/schema.json -o types.bal
```

3. **Process EDI Messages:**
   Utilize the generated Ballerina APIs to process EDI messages. Start by creating a new Ballerina file and paste the following code:

```ballerina
import ballerina/data.jsondata;
import ballerina/io;

public function main() returns error? {
    string ediMsg = check io:fileReadString("resources/message.edi");
    SimpleOrder data = check fromEdiString(ediMsg);
    io:println(jsondata:prettify(data));
}
```

This code snippet demonstrates how the generated APIs convert an EDI message into a Ballerina record.

4. **Manipulate EDI Data:**
   Now you can use Ballerina expressions to transform or manipulate the EDI data as needed.

## Useful Links

- [Ballerina EDI Schema Specification](https://github.com/ballerina-platform/module-ballerina-edi/blob/main/docs/specs/SchemaSpecification.md#ballerina-edi-schema-specification)
- [EDI to Record Conversion](https://ballerina.io/learn/by-example/edi-to-record/)
- [Record to EDI Conversion](https://ballerina.io/learn/by-example/record-to-edi/)
- Example: [FTP B2B EDI message to Salesforce opportunity](https://github.com/ballerina-guides/integration-samples/tree/main/ftp-edi-message-to-salesforce-opportunity)
