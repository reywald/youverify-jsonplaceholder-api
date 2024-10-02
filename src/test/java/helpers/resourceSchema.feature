@ignore @report=false
Feature: Resource Schemas

    Schema Objects for Response Body Validation

    Scenario: Resource Schema
        * def userSchema =
            """
            {
                "id": "#number",
                "name": "#string",
                "username": "#string",
                "email": "#string",
                "address": {
                    "street": "#string",
                    "suite": "#string",
                    "city": "#string",
                    "zipcode": "##string",
                    "geo": {
                        "lat": "#string",
                        "lng": "#string"
                    }
                },
                "phone": "#string",
                "website": "#string",
                "company": {
                    "name": "#string",
                    "catchPhrase": "#string",
                    "bs": "#string"
                }
            }
            """
        * def postSchema =
            """
            {
                "userId": "#number",
                "id": "#number",
                "title": "#string",
                "body": "#string"
            }
            """
        * def todoSchema =
            """
            {
                "userId": "#number",
                "id": "#number",
                "title": "#string",
                "completed": "#boolean"
            }
            """
        * def albumSchema =
            """
            {
                "userId": "#number",
                "id": "#number",
                "title": "#string"
            }
            """
        * def commentSchema =
            """
            {
                "postId": "#number",
                "id": "#number",
                "name": "#string",
                "email": "#string",
                "body": "#string"
            }
            """
        * def photoSchema =
            """
            {
                "albumId": "#number",
                "id": "#number",
                "title": "#string",
                "url": "#string",
                "thumbnailUrl": "#string"
            }
            """