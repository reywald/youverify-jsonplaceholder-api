@ignore @report=false
Feature: Generate Test User Data

    Generate test data for users

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    Scenario: Return Random User
        Given path "users"
        When method Get
        Then status 200
        And match responseType == "json"
        * def users_size = response.length
        * def randomUserNum = (Math.round(0 + Math.random() * (users_size - 1)))
        * def userId = response[randomUserNum].id
        * print userId
