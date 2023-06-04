*** Settings ***
Resource        ../global_variables.robot
Resource        ../features/login_spec/keywords/login_keywords.robot
Variables       resources/data/mass_of_tests.yaml
Library         libraries/baseTests.py

*** Keywords ***

You display the Login Page
    ${DIC_EMPTY}=     Create Dictionary
    Set Browser Timeout    50s
    New Browser    chromium    headless=${HEADLESS_FLAG}    channel=chrome
    New Context
    New Page    ${URL_SITE}
    Wait Until Network Is Idle    timeout=20s

Successful login testing
    You display the Login Page
    Perform the site authentication
    Validate if the login was successful

Steps to Close Browser
    Run Keyword And Ignore Error     Take Screenshot    filename=${TEST_NAME}    timeout=10
    Close Browser