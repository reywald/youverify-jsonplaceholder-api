# @integration @functional
@ignore
Feature: API Integration Tests

    Tests for all possible interactions between API Resources

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    Scenario: Get All Todos for Specific User
        * call read("classpath:scenarios/data/user_data.feature")
        Given path "users", userId, "todos"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${userId}`
        And match each response == { userId: "#number", id: "#number", title: "#string", completed: "#boolean" }

    Scenario: Get All Posts for Specific User
        * call read("classpath:scenarios/data/user_data.feature")
        Given path "users", userId, "posts"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${userId}`
        And match each response == { userId: "#number", id: "#number", title: "#string", body: "#string" }

    Scenario: Get All Albums for Specific User
        * call read("classpath:scenarios/data/user_data.feature")
        Given path "users", userId, "albums"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${userId}`
        And match each response == { userId: "#number", id: "#number", title: "#string" }

    Scenario: Get All Comments for Specific Posts
        * call read("classpath:scenarios/data/post_data.feature")
        Given path "posts", postId, "comments"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.postId == ${postId}`
        And match each response == { postId: "#number", id: "#number", name: "#string", email: "#string", body: "#string" }

    Scenario: Get All Photos for Specific Albums
        * call read("classpath:scenarios/data/album_data.feature")
        Given path "album", albumId, "photos"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.albumId == ${albumId}`
        And match each response == { albumId: "#number", id: "#number", title: "#string", url: "#string", thumbnailUrl: "#string" }

    Scenario: Filter Todos for Specific User
        * call read("classpath:scenarios/data/user_data.feature")
        Given path "todos"
        And param userId = userId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${userId}`
        And match each response == { userId: "#number", id: "#number", title: "#string", completed: "#boolean" }

    Scenario: Filter Posts for Specific User
        * call read("classpath:scenarios/data/user_data.feature")
        Given path "posts"
        And param userId = userId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${userId}`
        And match each response == { userId: "#number", id: "#number", title: "#string", body: "#string" }

    Scenario: Filter Albums for Specific User
        * call read("classpath:scenarios/data/user_data.feature")
        Given path "albums"
        And param userId = userId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.userId == ${userId}`
        And match each response == { userId: "#number", id: "#number", title: "#string" }

    Scenario: Filter Comments for Specific Posts
        * call read("classpath:scenarios/data/post_data.feature")
        Given path "comments"
        And param postId = postId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.postId == ${postId}`
        And match each response == { postId: "#number", id: "#number", name: "#string", email: "#string", body: "#string" }

    Scenario: Filter Photos for Specific Albums
        * call read("classpath:scenarios/data/album_data.feature")
        Given path "photos"
        And param albumId = albumId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#[] #object? _.albumId == ${albumId}`
        And match each response == { albumId: "#number", id: "#number", title: "#string", url: "#string", thumbnailUrl: "#string" }