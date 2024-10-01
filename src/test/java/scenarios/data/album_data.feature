@ignore @report=false
Feature: Generate Test Album Data

    Generate test data for albums

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    Scenario: Return Random Album
        Given path "albums"
        When method Get
        Then status 200
        And match responseType == "json"
        * def albums_size = response.length
        * def randomAlbumNum = (Math.round(0 + Math.random() * (albums_size - 1)))
        * def albumId = response[randomAlbumNum].id
        * print albumId
