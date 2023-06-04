*** Settings ***
Resource        keywords/login_keywords.robot

Suite Setup       Set Log Level    ${LOG_LEVEL}
Test Teardown     Steps to Close Browser  
Force Tags        login_tests

*** Test Cases ***
Scenario - Successful login testing
    [Tags]    login_ok
    Given You display the Login Page
    When Perform the site authentication
    Then Validate if the login was successful
