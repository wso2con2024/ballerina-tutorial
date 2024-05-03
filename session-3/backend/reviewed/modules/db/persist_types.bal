// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

public type Place record {|
    readonly int id;
    string name;
    string city;
    string country;
    decimal entryFee;

|};

public type PlaceOptionalized record {|
    int id?;
    string name?;
    string city?;
    string country?;
    decimal entryFee?;
|};

public type PlaceWithRelations record {|
    *PlaceOptionalized;
    ReviewOptionalized[] reviews?;
|};

public type PlaceTargetType typedesc<PlaceWithRelations>;

public type PlaceInsert Place;

public type PlaceUpdate record {|
    string name?;
    string city?;
    string country?;
    decimal entryFee?;
|};

public type Review record {|
    readonly int id;
    int rating;
    string content;
    int placeId;
    int authorId;
|};

public type ReviewOptionalized record {|
    int id?;
    int rating?;
    string content?;
    int placeId?;
    int authorId?;
|};

public type ReviewWithRelations record {|
    *ReviewOptionalized;
    PlaceOptionalized place?;
    AuthorOptionalized author?;
|};

public type ReviewTargetType typedesc<ReviewWithRelations>;

public type ReviewInsert Review;

public type ReviewUpdate record {|
    int rating?;
    string content?;
    int placeId?;
    int authorId?;
|};

public type Author record {|
    readonly int id;
    string username;

|};

public type AuthorOptionalized record {|
    int id?;
    string username?;
|};

public type AuthorWithRelations record {|
    *AuthorOptionalized;
    ReviewOptionalized[] reviews?;
|};

public type AuthorTargetType typedesc<AuthorWithRelations>;

public type AuthorInsert Author;

public type AuthorUpdate record {|
    string username?;
|};

