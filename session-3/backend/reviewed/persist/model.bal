import ballerina/persist as _;

type Place record {|
    readonly int id;
    string name;
    string city;
    string country;
    decimal entryFee;
    Review[] reviews;
|};

type Review record {|
    readonly int id;
    int rating;
    string content;
    Place place;
    Author author;
|};

type Author record {|
    readonly int id;
    string username;
    Review[] reviews;
|};