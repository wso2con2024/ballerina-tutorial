import ballerina/constraint;

type ItemResponse record {|
    string code;
    string message?;
|};

// Following types are generated from the content of `_samples/requests/01_create_item.http`. 
// Remove unnecessary fields.
type Item_details record {
    @constraint:String {
        minLength: 2
    }
    string sku;
    string name;
};

type Manufacturer record {
    string code;
};

type Price record {
    decimal amount;
};

type Stock record {
    decimal quantity;
    Price price;
};

type ItemRequest record {
    Item_details item_details;
    Manufacturer manufacturer;
    Stock stock;
};
