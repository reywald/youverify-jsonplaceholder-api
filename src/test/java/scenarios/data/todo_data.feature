@ignore @report=false
Feature: Generate Test Todo Data

    Generate test data for todos

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    Scenario: Return Random Todo
        Given path "todos"
        When method Get
        Then status 200
        And match responseType == "json"
        * def todos_size = response.length
        * def randomTodoNum = (Math.round(0 + Math.random() * (todos_size - 1)))
        * def todoId = response[randomTodoNum].id
        * print todoId
