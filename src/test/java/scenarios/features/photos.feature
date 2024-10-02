Feature: Photos Endpoint Tests

    Background:
        * url baseUrl
        * callonce read("classpath:helpers/resourceSchema.feature")
        * def pathUrl = "photos"

    @smoke
    Scenario: Get All Photos
        Given path pathUrl
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#[5000] #object"
        And match each response == photoSchema

    @smoke
    Scenario: Get A Single Photo
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#object? _.id == ${newId}`
        And match response == photoSchema