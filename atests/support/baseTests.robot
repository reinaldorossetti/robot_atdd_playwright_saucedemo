*** Settings ***
Resource        ../global_variables.robot
Resource        ../features/login_spec/keywords/login_keywords.robot
Variables       resources/data/mass_of_tests.yaml
Library         libraries/baseTests.py

*** Keywords ***

You display the Login Page
    ${DIC_EMPTY}=     Create Dictionary
    Set Browser Timeout    50s
    Open Browser    ${URL_SITE}
    ...    headless=${False}
    Wait For All Promises
    Wait Until Network Is Idle

Successful login testing
    You display the Login Page
    Perform the site authentication
    Validate if the login was successful

Steps to Close Browser
    Take Screenshot    ${TEST_NAME}
    Close Browser