type PlaceData record {|
    readonly int id;
    string name;
    string city;
    string country;
    decimal entryFee;
|};

type ReviewData record {|
    readonly int id;
    int rating;
    string content;
    int placeId;
    int authorId;
|};

type AuthorData record {|
    readonly int id;
    string username;
|};

final table<PlaceData> key (id) places = table [
    {id: 8000, name: "Tower Vista", city: "Colombo", country: "Sri Lanka", entryFee: 0},
    {id: 8001, name: "TechTrail", city: "Miami", country: "United States", entryFee: 10},
    {id: 8002, name: "TechTrail", city: "Miami", country: "US", entryFee: 10}
];

final table<ReviewData> key (id) reviews = table [
    {id: 1001, placeId: 8000, authorId: 5001, content: "Wonderful place, would recommend!", rating: 5},
    {id: 1002, placeId: 8001, authorId: 5001, content: "Long queues, not worth the wait.", rating: 1},
    {id: 1003, placeId: 8000, authorId: 5002, content: "Tends to get crowded in the evening, other than that, great experience.", rating: 4},
    {id: 1004, placeId: 8001, authorId: 5000, content: "Getting in is a challenge, but if you can sort out transport, a must visit!", rating: 4},
    {id: 1005, placeId: 8001, authorId: 5002, content: "An absolute must-visit for a tech enthusiast", rating: 5}
];

final table<AuthorData> key (id) authors = table [
    {id: 5000, username: "John"},
    {id: 5001, username: "Raya"},
    {id: 5002, username: "Liyana"},
    {id: 5003, username: "Shri"}
];
