@integration
# @ignore
Feature: API Integration Tests

    Tests for all possible interactions between API Resources

    Background:
        * url baseUrl

    Scenario: Get All Todos for Specific User
        * def pathUrl = "users"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId, "todos"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${newId}`
        And match each response == schemas.todoSchema

    Scenario: Get All Posts for Specific User
        * def pathUrl = "users"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId, "posts"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${newId}`
        And match each response == schemas.postSchema

    Scenario: Get All Albums for Specific User
        * def pathUrl = "users"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId, "albums"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${newId}`
        And match each response == schemas.albumSchema

    Scenario: Get All Comments for Specific Posts
        * def pathUrl = "posts"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId, "comments"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.postId == ${newId}`
        And match each response == schemas.commentSchema

    Scenario: Get All Photos for Specific Albums
        * def pathUrl = "albums"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId, "photos"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.albumId == ${newId}`
        And match each response == schemas.photoSchema

    Scenario: Filter Todos for Specific User
        * def pathUrl = "todos"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl
        And param userId = newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `##[] #object? _.userId == ${newId}`
        And match each response == schemas.todoSchema

    Scenario: Filter Posts for Specific User
        * def pathUrl = "posts"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl
        And param userId = newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `##[] #object? _.userId == ${newId}`
        And match each response == schemas.postSchema

    Scenario: Filter Albums for Specific User
        * def pathUrl = "albums"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl
        And param userId = newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `##[] #object? _.userId == ${newId}`
        And match each response == schemas.albumSchema

    Scenario: Filter Comments for Specific Posts
        * def pathUrl = "comments"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl
        And param postId = newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `##[] #object? _.postId == ${newId}`
        And match each response == schemas.commentSchema

    Scenario: Filter Photos for Specific Albums
        * def pathUrl = "photos"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl
        And param albumId = newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `##[] #object? _.albumId == ${newId}`
        And match each response == schemas.photoSchema