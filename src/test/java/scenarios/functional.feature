@integration @functional
Feature: Functional Tests for Endpoints

    Functional tests for API Resources

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    @setup=post
    Scenario:
        # Get post objects from posts.json, randomly return one
        * def postRequests = read("classpath:scenarios/data/posts.json")
        * def index = Math.round( 0 + Math.random() * (postRequests.length - 1) )
        * def postBody = postRequests[index]

    @ignore
    Scenario: Create a Post
        * def postBody = karate.setup("post").postBody

        Given path "posts"
        And header Content-Type = "application/json"
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
        * def postBody = karate.setup("post").postBody
        * set postBody.id = postId

        Given path "posts", postId
        And header Content-Type = "application/json"
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

    @setup=todo
    Scenario:
        # Get todo objects from posts.json, randomly return one
        * def todoRequests = read("classpath:scenarios/data/todos.json")
        * def index = Math.round( 0 + Math.random() * (todoRequests.length - 1) )
        * def todoBody = todoRequests[index]

    @ignore
    Scenario: Create a Todo
        * def todoBody = karate.setup("todo").todoBody

        Given path "todos"
        And header Content-Type = "application/json"
        And request todoBody
        When method Post
        Then status 201
        And match responseType == "json"
        And match response == "#object"
        * print response
        And match response == { userId: "#number", id: "#number", title: "#string", completed: "#boolean" }
        And match response contains todoBody
        * print `Created todo with id: ${response.id}`

    @ignore
    Scenario: Update a Todo
        * call read("classpath:scenarios/data/todo_data.feature")
        * def todoBody = karate.setup("todo").todoBody
        * set todoBody.id = todoId

        Given path "todos", todoId
        And header Content-Type = "application/json"
        And request todoBody
        When method Put
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response == { userId: "#number", id: "#number", title: "#string", completed: "#boolean" }
        And match response contains todoBody
        * print `Updated todo with id: ${response.id}`

    # @ignore
    Scenario: Delete a Todo
        * call read("classpath:scenarios/data/todo_data.feature")

        Given path "todos", todoId
        When method Delete
        Then status 200
        And match responseType == "json"
        And match response == {}
        * print `Deleted todo with id: ${todoId}`
