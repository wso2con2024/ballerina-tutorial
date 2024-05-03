// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

public type Order record {|
    readonly string orderID;
    string date;
    string customerCustomerID;

|};

public type OrderOptionalized record {|
    string orderID?;
    string date?;
    string customerCustomerID?;
|};

public type OrderWithRelations record {|
    *OrderOptionalized;
    CustomerOptionalized customer?;
    OrderedItemOptionalized[] items?;
|};

public type OrderTargetType typedesc<OrderWithRelations>;

public type OrderInsert Order;

public type OrderUpdate record {|
    string date?;
    string customerCustomerID?;
|};

public type Customer record {|
    readonly string customerID;
    string firstName;
    string lastName;
    string email;
    boolean optInEmail;
    boolean premiumCustomer;

|};

public type CustomerOptionalized record {|
    string customerID?;
    string firstName?;
    string lastName?;
    string email?;
    boolean optInEmail?;
    boolean premiumCustomer?;
|};

public type CustomerWithRelations record {|
    *CustomerOptionalized;
    OrderOptionalized[] orders?;
|};

public type CustomerTargetType typedesc<CustomerWithRelations>;

public type CustomerInsert Customer;

public type CustomerUpdate record {|
    string firstName?;
    string lastName?;
    string email?;
    boolean optInEmail?;
    boolean premiumCustomer?;
|};

public type Item record {|
    readonly string itemId;
    string name;
    string manufacturer_code;
    decimal unit_price;

|};

public type ItemOptionalized record {|
    string itemId?;
    string name?;
    string manufacturer_code?;
    decimal unit_price?;
|};

public type ItemWithRelations record {|
    *ItemOptionalized;
    OrderedItemOptionalized[] ordereditems?;
|};

public type ItemTargetType typedesc<ItemWithRelations>;

public type ItemInsert Item;

public type ItemUpdate record {|
    string name?;
    string manufacturer_code?;
    decimal unit_price?;
|};

public type OrderedItem record {|
    decimal quantity;
    string orderID;
    string itemId;
|};

public type OrderedItemOptionalized record {|
    decimal quantity?;
    string orderID?;
    string itemId?;
|};

public type OrderedItemWithRelations record {|
    *OrderedItemOptionalized;
    OrderOptionalized 'order?;
    ItemOptionalized item?;
|};

public type OrderedItemTargetType typedesc<OrderedItemWithRelations>;

public type OrderedItemInsert OrderedItem;

public type OrderedItemUpdate record {|
    decimal quantity?;
    string orderID?;
    string itemId?;
|};

