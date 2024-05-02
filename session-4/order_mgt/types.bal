// import ballerina/constraint;

type AddItemResponse record {|
    string code;
    string message?;
|};

// These types are generated from `_samples/post_item_request.json`. Removed unnecessary fields.
type Item_details record {
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

type AddItemRequest record {
    Item_details item_details;
    Manufacturer manufacturer;
    Stock stock;
};

// Simple Data Model

type SimpleItemRequest record {|
    SimpleItemDetails item_details;
    SimpleManufacturer manufacturer;
    SimpleStock stock;
|};

type SimpleItemDetails record {|
    string sku;
    string name;
|};

type SimpleManufacturer record {|
    string code;
|};

type SimpleStock record {|
    decimal quantity;
    SimplePrice price;
|};

type SimplePrice record {|
    decimal amount;
|};

// Order Data Model

type OrderWithRelations record {|
    string orderID;
    string date;
    GetCustomer customer;
    record{|
        string orderedItemId;
    |}[] items;
|};

type GetCustomer record {|
    string customerID;
    string firstName;
    string lastName;
    string email;
    boolean optInEmail;
    boolean premiumCustomer;
|};

type GetOrderedItemWithRelations record {|
    decimal quantity;
    GetItem item;
|};

type GetItem record {|
    string itemId;
    string name;
    string manufacturer_code;
    decimal unit_price;
|};

// Following types are generated from `_samples/get_orders_response.json`
type Customer record {
    string id;
    string name;
    string email;
    string loyalty;
    string optedInNewsLetter;
};

type ItemsItem record {
    string id;
    string name;
    decimal quantity;
    decimal price;
};

type OrderResponse record {
    string id;
    Customer customer;
    ItemsItem[] items;
    decimal total;
};
