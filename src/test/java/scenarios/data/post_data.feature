@ignore @report=false
Feature: Generate Test Post Data

    Generate test data for posts

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    Scenario: Return Random Post
        Given path "posts"
        When method Get
        Then status 200
        And match responseType == "json"
        * def posts_size = response.length
        * def randomPostNum = (Math.round(0 + Math.random() * (posts_size - 1)))
        * def postId = response[randomPostNum].id
