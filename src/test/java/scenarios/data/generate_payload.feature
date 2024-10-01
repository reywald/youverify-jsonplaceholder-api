@ignore @report=false
Feature: Generate Resource Body

    Generate request body for a resource

    Background:
        * url 'https://jsonplaceholder.typicode.com'

    Scenario:
        # Get resource objects from its json file, randomly return one
        * def requestObjects = read(`classpath:scenarios/data/${pathUrl}.json`)
        * def index = Math.round( 0 + Math.random() * (requestObjects.length - 1) )
        * def payload = requestObjects[index]