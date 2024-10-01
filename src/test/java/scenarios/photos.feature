Feature: Photos Endpoint Tests

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    @smoke
    Scenario: Get All Photos
        Given path "photos"
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#[5000] #object"
        And match each response == { albumId: "#number", id: "#number", title: "#string", url: "#string", thumbnailUrl: "#string" }

    @smoke
    Scenario: Get A Single Photo
        * def photoId = 189
        Given path "photos", photoId
        When method Get
        Then status 200
        And match responseType == "json"
        And match response == "#object"
        And match response.id == photoId
        And match response == { albumId: "#number", id: "#number", title: "#string", url: "#string", thumbnailUrl: "#string" }