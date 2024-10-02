@functional
Feature: Functional Tests for Endpoints

    Functional tests for API Resources

    Background:
        * url baseUrl

    # @ignore
    Scenario: Create a Post
        # Get a random Post object
        * def pathUrl = "posts"
        * call read("classpath:scenarios/data/generate_payload.feature")

        Given path pathUrl
        And header Content-Type = "application/json"
        And request payload
        When method Post
        Then status 201
        And match responseType == "json"
        And match response == "#object"
        And match response == schemas.postSchema
        And match response contains payload
        * print `Created post with id: ${response.id}`

    # @ignore
    Scenario: Update a Post
        # Get a random existing Post's id, Post object
        * def pathUrl = "posts"
        * call read("classpath:scenarios/data/generate_id.feature")
        * call read("classpath:scenarios/data/generate_payload.feature")
        * set payload.id = newId

        Given path pathUrl, newId
        And header Content-Type = "application/json"
        And request payload
        When method Put
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response == schemas.postSchema
        And match response contains payload
        * print `Updated post with id: ${response.id}`

    # @ignore
    Scenario: Delete a Post
        # Get an existing Post's id
        * def pathUrl = "posts"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId
        When method Delete
        Then status 200
        And match responseType == "json"
        And match response == {}
        * print `Deleted post with id: ${newId}`

    # @ignore
    Scenario: Create a Todo
        # Get a random Todo object
        * def pathUrl = "todos"
        * call read("classpath:scenarios/data/generate_payload.feature")

        Given path pathUrl
        And header Content-Type = "application/json"
        And request payload
        When method Post
        Then status 201
        And match responseType == "json"
        And match response == "#object"
        And match response == schemas.todoSchema
        And match response contains payload
        * print `Created todo with id: ${response.id}`

    # @ignore
    Scenario: Update a Todo
        # Get a random existing Todo's id, Todo object
        * def pathUrl = "todos"
        * call read("classpath:scenarios/data/generate_id.feature")
        * call read("classpath:scenarios/data/generate_payload.feature")
        * set payload.id = newId

        Given path pathUrl, newId
        And header Content-Type = "application/json"
        And request payload
        When method Put
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response == schemas.todoSchema
        And match response contains payload
        * print `Updated todo with id: ${response.id}`

    # @ignore
    Scenario: Delete a Todo
        # Get a random Todo id
        * def pathUrl = "todos"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId
        When method Delete
        Then status 200
        And match responseType == "json"
        And match response == {}
        * print `Deleted todo with id: ${newId}`

    # @ignore
    Scenario: Create an Album
        # Get a random Album object
        * def pathUrl = "albums"
        * call read("classpath:scenarios/data/generate_payload.feature")

        Given path pathUrl
        And header Content-Type = "application/json"
        And request payload
        When method Post
        Then status 201
        And match responseType == "json"
        And match response == "#object"
        And match response == schemas.albumSchema
        And match response contains payload
        * print `Created album with id: ${response.id}`

    # @ignore
    Scenario: Update an Album
        # Get a random existing Album's id, Album object
        * def pathUrl = "albums"
        * call read("classpath:scenarios/data/generate_id.feature")
        * call read("classpath:scenarios/data/generate_payload.feature")
        * set payload.id = newId

        Given path pathUrl, newId
        And header Content-Type = "application/json"
        And request payload
        When method Put
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response == schemas.albumSchema
        And match response contains payload
        * print `Updated album with id: ${response.id}`

    # @ignore
    Scenario: Delete an Album
        # Get a random Album id
        * def pathUrl = "albums"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId
        When method Delete
        Then status 200
        And match responseType == "json"
        And match response == {}
        * print `Deleted album with id: ${newId}`

    # @ignore
    Scenario: Create a Comment
        # Get a random Comment object
        * def pathUrl = "comments"
        * call read("classpath:scenarios/data/generate_payload.feature")

        Given path pathUrl
        And header Content-Type = "application/json"
        And request payload
        When method Post
        Then status 201
        And match responseType == "json"
        And match response == "#object"
        And match response == schemas.commentSchema
        And match response contains payload
        * print `Created comment with id: ${response.id}`

    # @ignore
    Scenario: Update a Comment
        # Get a random existing Comment's id, Comment object
        * def pathUrl = "comments"
        * call read("classpath:scenarios/data/generate_id.feature")
        * call read("classpath:scenarios/data/generate_payload.feature")
        * set payload.id = newId

        Given path pathUrl, newId
        And header Content-Type = "application/json"
        And request payload
        When method Put
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response == schemas.commentSchema
        And match response contains payload
        * print `Updated comment with id: ${response.id}`

    # @ignore
    Scenario: Delete a Comment
        # Get a random Comment id
        * def pathUrl = "comments"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId
        When method Delete
        Then status 200
        And match responseType == "json"
        And match response == {}
        * print `Deleted comment with id: ${newId}`

    # @ignore
    Scenario: Create a Photo
        # Get a random Photo object
        * def pathUrl = "photos"
        * call read("classpath:scenarios/data/generate_payload.feature")

        Given path pathUrl
        And header Content-Type = "application/json"
        And request payload
        When method Post
        Then status 201
        And match responseType == "json"
        And match response == "#object"
        And match response == schemas.photoSchema
        And match response contains payload
        * print `Created photo with id: ${response.id}`

    # @ignore
    Scenario: Update a Photo
        # Get a random existing Photo's id, Photo object
        * def pathUrl = "photos"
        * call read("classpath:scenarios/data/generate_id.feature")
        * call read("classpath:scenarios/data/generate_payload.feature")
        * set payload.id = newId

        Given path pathUrl, newId
        And header Content-Type = "application/json"
        And request payload
        When method Put
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response == schemas.photoSchema
        And match response contains payload
        * print `Updated photo with id: ${response.id}`

    # @ignore
    Scenario: Delete a Photo
        # Get a random Photo id
        * def pathUrl = "photos"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId
        When method Delete
        Then status 200
        And match responseType == "json"
        And match response == {}
        * print `Deleted photo with id: ${newId}`

    # @ignore
    Scenario: Create a User
        # Get a random User object
        * def pathUrl = "users"
        * call read("classpath:scenarios/data/generate_payload.feature")

        Given path pathUrl
        And header Content-Type = "application/json"
        And request payload
        When method Post
        Then status 201
        And match responseType == "json"
        And match response == "#object"
        And match response == schemas.userSchema
        And match response contains payload
        * print `Created user with id: ${response.id}`

    # @ignore
    Scenario: Update a User
        # Get a random existing User's id, User object
        * def pathUrl = "users"
        * call read("classpath:scenarios/data/generate_id.feature")
        * call read("classpath:scenarios/data/generate_payload.feature")
        * set payload.id = newId

        Given path pathUrl, newId
        And header Content-Type = "application/json"
        And request payload
        When method Put
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response == schemas.userSchema
        And match response contains payload
        * print `Updated user with id: ${response.id}`

    # @ignore
    Scenario: Delete a User
        # Get a random User id
        * def pathUrl = "users"
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId
        When method Delete
        Then status 200
        And match responseType == "json"
        And match response == {}
        * print `Deleted user with id: ${newId}`