Feature: Users Endpoint Tests

    Tests to cover the users endpoint

    Background:
        * url baseUrl
        * def pathUrl = "users"

    @smoke
    Scenario: Get All Users
        Given path pathUrl
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#[10] #object"
        And match each response == schemas.userSchema

    @smoke
    Scenario: Get A Single User
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#object? _.id == ${newId}`
        And match response == schemas.userSchema

