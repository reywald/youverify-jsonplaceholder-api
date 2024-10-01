Feature: Todos Endpoint Tests

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    @smoke
    Scenario: Get All Todos
        Given path "todos"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#[200] #object"
        And match each response == { userId: "#number", id: "#number", title: "#string", completed: "#boolean" }

    @smoke
    Scenario: Get A Single Todo
        * call read("classpath:scenarios/data/todo_data.feature")
        Given path "todos", todoId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response.id == todoId
        And match response == { userId: "#number", id: "#number", title: "#string", completed: "#boolean" }