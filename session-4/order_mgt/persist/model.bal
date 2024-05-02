import ballerina/persist as _;
import ballerinax/persist.sql;

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
    @sql:Decimal {precision: [10,2]}
    decimal unit_price;
    OrderedItem[] ordereditems;
|};

type OrderedItem record {|
    readonly string orderID;
    readonly string itemId;
    @sql:Decimal {precision: [10,2]}
    decimal quantity;
    @sql:Relation {
        keys: ["orderID"]
    }
    Order 'order;
    @sql:Relation {
        keys: ["itemId"]
    }
    Item item;
|};
