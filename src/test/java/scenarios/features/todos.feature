Feature: Todos Endpoint Tests

    Background:
        * url baseUrl
        * def pathUrl = "todos"

    @smoke
    Scenario: Get All Todos
        Given path pathUrl
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#[200] #object"
        And match each response == schemas.todoSchema

    @smoke
    Scenario: Get A Single Todo
        * call read("classpath:scenarios/data/generate_id.feature")

        Given path pathUrl, newId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == `#object? _.id == ${newId}`
        And match response == schemas.todoSchema