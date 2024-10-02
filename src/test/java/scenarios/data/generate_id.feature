@ignore @report=false
Feature: Generate Resource ID

    Generate test data for posts, todos, albums, comments, photos and users

    Background:
        * url baseUrl
        * def resourceSizes = { posts: 100, comments: 500, albums: 100, photos: 5000, todos: 200, users: 10 }

    Scenario: Generate ID
        * def size = resourceSizes[pathUrl]
        * def randomNum = Math.round( 1 + Math.random() * size )

        Given path pathUrl, randomNum
        When method Get
        Then status 200
        And match responseType == "json"

        * def newId = response.id