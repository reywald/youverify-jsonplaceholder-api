Feature: Albums Endpoint Tests

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    @smoke
    Scenario: Get All Albums
        Given path "albums"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#[100] #object"
        And match each response == { userId: "#number", id: "#number", title: "#string"}

    @smoke
    Scenario: Get A Single Album
        * def albumId = 82
        Given path "albums", albumId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response.id == albumId
        And match response == { userId: "#number", id: "#number", title: "#string" }