Feature: Posts Endpoint Tests

    Background:
        * url baseUrl
        * def pathUrl = "posts"

    @smoke
    Scenario: Get All Posts
        Given path pathUrl
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#[100] #object"
        And match each response == schemas.postSchema

    @smoke
    Scenario: Get A Single Post
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#object? _.id == ${newId}`
        And match response == schemas.postSchema