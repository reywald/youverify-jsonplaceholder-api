Feature: Comments Endpoint Tests

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    @smoke
    Scenario: Get All Comments
        Given path "comments"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#[500] #object"
        And match each response == { postId: "#number", id: "#number", name: "#string", email: "#string", body: "#string" }

    @smoke
    Scenario: Get A Single Comment
        * def commentId = 256
        Given path "comments", commentId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response.id == commentId
        And match response == { postId: "#number", id: "#number", name: "#string", email: "#string", body: "#string" }