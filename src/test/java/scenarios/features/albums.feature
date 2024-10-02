Feature: Albums Endpoint Tests

    Background:
        * url baseUrl
        * def pathUrl = "albums"

    @smoke
    Scenario: Get All Albums
        Given path pathUrl
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#[100] #object"
        And match each response == schemas.albumSchema

    @smoke
    Scenario: Get A Single Album
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#object? _.id == ${newId}`
        And match response == schemas.albumSchema