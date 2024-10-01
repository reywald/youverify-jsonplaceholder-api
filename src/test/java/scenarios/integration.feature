# @integration
@ignore
Feature: API Integration Tests

    Tests for all possible interactions between API Resources

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    Scenario: Get All Todos for Specific User
        * def pathUrl "users"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId, "todos"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${newId}`
        And match each response == { userId: "#number", id: "#number", title: "#string", completed: "#boolean" }

    Scenario: Get All Posts for Specific User
        * def pathUrl "users"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId, "posts"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${newId}`
        And match each response == { userId: "#number", id: "#number", title: "#string", body: "#string" }

    Scenario: Get All Albums for Specific User
        * def pathUrl "users"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId, "albums"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${newId}`
        And match each response == { userId: "#number", id: "#number", title: "#string" }

    Scenario: Get All Comments for Specific Posts
        * def pathUrl "posts"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId, "comments"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.postId == ${newId}`
        And match each response == { postId: "#number", id: "#number", name: "#string", email: "#string", body: "#string" }

    Scenario: Get All Photos for Specific Albums
        * def pathUrl "albums"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId, "photos"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.albumId == ${newId}`
        And match each response == { albumId: "#number", id: "#number", title: "#string", url: "#string", thumbnailUrl: "#string" }

    Scenario: Filter Todos for Specific User
        * def pathUrl "todos"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl
        And param userId = newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${newId}`
        And match each response == { userId: "#number", id: "#number", title: "#string", completed: "#boolean" }

    Scenario: Filter Posts for Specific User
        * def pathUrl "posts"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl
        And param userId = newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${newId}`
        And match each response == { userId: "#number", id: "#number", title: "#string", body: "#string" }

    Scenario: Filter Albums for Specific User
        * def pathUrl "albums"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl
        And param userId = newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${newId}`
        And match each response == { userId: "#number", id: "#number", title: "#string" }

    Scenario: Filter Comments for Specific Posts
        * def pathUrl "comments"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl
        And param postId = newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.postId == ${newId}`
        And match each response == { postId: "#number", id: "#number", name: "#string", email: "#string", body: "#string" }

    Scenario: Filter Photos for Specific Albums
        * def pathUrl "photos"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl
        And param albumId = newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.albumId == ${newId}`
        And match each response == { albumId: "#number", id: "#number", title: "#string", url: "#string", thumbnailUrl: "#string" }