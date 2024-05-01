import ballerina/persist as _;

type Order record {|
    readonly string orderID;
    string date;
    Customer customer;
    OrderedItem[] items;
|};

type Customer record {|
    readonly string customerID;
    string firstName;
    string lastName;
    string email;
    boolean optInEmail;
    boolean premiumCustomer;
    Order[] orders;
|};

type Item record {|
    readonly string itemId;
    string name;
    string manufacturer_code;
    decimal unit_price;
	OrderedItem? ordereditem;
|};

type OrderedItem record {|
    readonly string orderedItemId;
    float quantity;
    Order 'order;
    Item item;
|};
