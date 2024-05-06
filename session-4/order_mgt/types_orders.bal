// Order Data Model

type OrderWithRelations record {|
    string orderID;
    string date;
    GetCustomer customer;
    record{|
        string itemId;
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

// Following types are generated from `_samples/response/get_orders.json`
type Customer record {
    string id;
    string name;
    string email;
    string loyalty;
    boolean optedInNewsLetter;
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
