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
