Feature: Comments Endpoint Tests

    Background:
        * url baseUrl
        * def pathUrl = "comments"

    @smoke
    Scenario: Get All Comments
        Given path pathUrl
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#[500] #object"
        And match each response == schemas.commentSchema

    @smoke
    Scenario: Get A Single Comment
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#object? _.id == ${newId}`
        And match response == schemas.commentSchema