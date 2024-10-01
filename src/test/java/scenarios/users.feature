Feature: Users Endpoint Tests

    Tests to cover the users endpoint

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    @smoke
    Scenario: Get All Users
        Given path "users"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#[10] #object"
        And match each response contains { id: "#number", name: "#string", username: "#string", email: "#string", phone : "#string", website: "#string" }
        And match each response contains { address: "#object" }
        And match each response contains { company: "#object" }

    @smoke
    Scenario: Get A Single User
        * call read("classpath:scenarios/data/user_data.feature")
        Given path "users", userId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[1] #object? _.userId == ${userId}`
        And match response[0].address contains { street: "#string", city: "#string", suite: "#string", zipcode: "#string", geo: "#object" }
        And match response[0].address.geo contains { lat: "#string", lng: "#string" }
        And match response[0].company contains { name: "#string", catchPhrase: "#string", bs: "#string" }

