// import ballerina/constraint;

type AddItemResponse record {|
    string code;
    string message?;
|};

// These types are generated from `_samples/post_item_request.json`
type Item_details record {
    string sku;
    string name;
    string description;
};

type Location record {
    string city;
    string country;
};

type Manufacturer record {
    string name;
    Location location;
    string code;
};

type Price record {
    string currency;
    decimal amount;
};

type Warehouse record {
    string location_id;
    string address;
};

type Stock record {
    int quantity;
    Price price;
    Warehouse warehouse;
};

type ReviewsItem record {
    int user_id;
    int rating;
    string comment;
    string date;
};

type AddItemRequest record {
    Item_details item_details;
    Manufacturer manufacturer;
    Stock stock;
    string[] tags;
    ReviewsItem[] reviews;
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
    int quantity;
    SimplePrice price;
|};

type SimplePrice record {|
    decimal amount;
|};

// Order Data Model

type GetOrder record {|
    string orderID;
    string date;
    GetCustomer customer;
    GetOrderedItem[] items;
|};

type GetCustomer record {|
    string customerID;
    string firstName;
    string lastName;
    string email;
    boolean optInEmail;
    boolean premiumCustomer;
|};

type GetOrderedItem record {|
    float quantity;
    GetItem item; // Problematic field
    // string itemItemId;
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
    int quantity;
    decimal price;
};

type OrderResponse record {
    string id;
    Customer customer;
    ItemsItem[] items;
    decimal total;
};
