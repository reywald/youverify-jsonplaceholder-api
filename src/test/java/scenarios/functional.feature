@integration @functional
Feature: Functional Tests for Endpoints

    Functional tests for API Resources

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    @setup
    Scenario:
        * def postRequests = read("classpath:scenarios/data/posts.json")
        * def index = Math.round( 0 + Math.random() * (postRequests.length - 1) )
        * def postBody = postRequests[index]

    @ignore
    Scenario: Create a Post
        * def postBody = karate.setup().postBody
        * print postBody

        Given path "posts"
        And request postBody
        When method Post
        Then status 201
        And match responseType == "json"
        And match response == "#object"
        And match response == { userId: "#number", id: "#number", title: "#string", body: "#string" }
        And match response contains postBody
        * print `Created post with id: ${response.id}`

    @ignore
    Scenario: Update a Post
        * call read("classpath:scenarios/data/post_data.feature")
        * def postBody = karate.setup().postBody
        * print postBody
        * set postBody.id = postId
        * print postBody

        Given path "posts", postId
        And request postBody
        When method Put
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response == { userId: "#number", id: "#number", title: "#string", body: "#string" }
        And match response contains postBody
        * print `Updated post with id: ${response.id}`

    @ignore
    Scenario: Delete a Post
        * call read("classpath:scenarios/data/post_data.feature")

        Given path "posts", postId
        When method Delete
        Then status 200
        And match responseType == "json"
        And match response == {}
        * print `Deleted post with id: ${postId}`

    @setup
    Scenario: Todo
        * def todoRequests = read("classpath:scenarios/data/todos.json")
        * print todoRequests
        * def index = Math.round( 0 + Math.random() * (todoRequests.length - 1) )
        * def todoBody = todoRequests[index]

    # @ignore
    Scenario: Create a Todo
        * def todoBody = karate.setup("Todo").todoBody
        * print todoBody
        Given path "todos"
        When method Get
        Then status 200

    # And request todoBody
    # When method Post
    # Then status 201
    # And match responseType == "json"
    # And match response == "#object"
    # * print response
    # And match response == { userId: "#number", id: "#number", title: "#string", completed: "#boolean" }
    # And match response contains todoBody
    # * print `Created todo with id: ${response.id}`

    @ignore
    Scenario: Update a Todo

        Given path "todos"
        And request todoBody
        When method Post
        Then status 201
        And match responseType == "json"
        And match response == "#object"
        And match response == { userId: "#number", id: "#number", title: "#string", completed: "#boolean" }
        And match response contains todoBody
        * print `Created todo with id: ${response.id}`
