# Example 2: Building a simple data-oriented service
   
   Sample Service : `order_mgt`

- Building a data persistance service, using Ballerina persist tool
- Expose the service as a RESTful service
- Demonstrate the JSON and XML data processing capabilities of ballerina.
- Capabilities of new `ballerina\data.*` modules.  

## Step 1

This sample contains pre-defined data types and services. To create the service from scratch, follow the steps below.

* Create new Ballerina Module called `order_mgt` 
    `bal new order_mgt`
* Nevigate to the project directory
    `cd order_mgt`
* Add data persistence support
    `bal persist add --module db --datastore mysql`
* Define the database model in `order_mgt/persist/model.bal`
    Copy the content from `data/db_model.bal`
* Build project
    `bal build`

## Step 2