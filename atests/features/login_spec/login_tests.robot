*** Settings ***
Resource        keywords/login_keywords.robot

Suite Teardown    Close Browser
Default Tags    login_tests

*** Test Cases ***
Successful login testing
    [Tags]    login_ok
    Given You display the Login Page
    When Perform the site authentication
    Then Validate if the login was successful
