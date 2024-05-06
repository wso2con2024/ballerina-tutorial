import ballerina/test;

@test:Config{}
function testGetUsersById() returns error? {

    json expectedUser = {
        "id": 1,
        "name": "Wise Guy",
        "birthDate": {
            "year": 2024,
            "month": 5,
            "day": 6
        },
        "mobileNumber": "+94771234001"
    };
    User actualUser = check socialMediaDb->queryRow(`SELECT * FROM users WHERE id = 1`);
    test:assertEquals(expectedUser, actualUser, "User retrieved does not match the expected user");
}

