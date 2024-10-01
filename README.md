# JSONPlaceholder API Test Automation

This framework answers the test automation coding challenge:

Objective: Automate the testing of a sample API.

- Tools: Use any API testing framework or tool (e.g., Postman, SoapUI, JMeter, RestAssured, etc.).

## Dependencies

1. Java 17 installed and added to the system PATH
2. Maven installed and added to the system PATH

## How to Install the dependencies

1. Clone the repo to the local computer
2. Extract the repo and navigate into the project folder
3. Open a terminal in the project folder:
   - For Windows 11: right-click in the project folder and click `Open in terminal`
4. Run the command `mvn clean test` to start maven. This will install all the dependencies and run the tests

For information on how to run the project in VS Code, see the video playlist: [Karate Kick Start] (https://www.youtube.com/playlist?list=PLnONaB4tNFOkxwM3dOvXLXJstSg_wMJSs)

## How to run the script

1. Open a terminal in the project folder
2. Run the command `mvn test -Dtest=ScenariosTest -Dkarate.options="classpath: --tags=@integration"` for integration tests
3. Substitute the keyword `@integration` for `smoke, functional, performance, regression` tests
4. After the script has finished running, open the `<project-folder>/target/karate-reports/karate-summary.html` file in a browser to view the test report
