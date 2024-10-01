Feature: Posts Endpoint Tests

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    @smoke
    Scenario: Get All Posts
        Given path "posts"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#[100] #object"
        And match each response == { userId: "#number", id: "#number", title: "#string", body: "#string" }

    @smoke
    Scenario: Get A Single Post
        * call read("classpath:scenarios/data/post_data.feature")
        Given path "posts", postId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response.id == postId
        And match response == { userId: "#number", id: "#number", title: "#string", body: "#string" }