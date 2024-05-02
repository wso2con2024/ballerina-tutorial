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

type GetItem record {|
    string itemId;
    string name;
    decimal unit_price;
|};

type GetOrderedItem record {|
    string orderedItemId;
    float quantity;
    GetItem item;
|};