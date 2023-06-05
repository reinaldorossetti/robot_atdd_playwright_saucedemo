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

Scenario - Negative test, test with wrong login user
    [Tags]    login_fail
    Given You display the Login Page
    When Perform the site authentication    ${USER}    ${INCORRECT_PASSWORD}
    Then Validate if the login was fail

Scenario - Negative test, test with wrong login user
    [Tags]    login_fail
    Given You display the Login Page
    When Perform the site authentication   ${INCORRECT_USER}    ${INCORRECT_PASSWORD}
    Then Validate if the login was fail

Scenario - Negative test, empty user name
    [Tags]    login_fail
    Given You display the Login Page
    When Perform the site authentication   ${EMPTY}    ${INCORRECT_PASSWORD}
    Then Validate if the login was fail    ${ERROR_USER_REQUIRED}

Scenario - Negative test, empty password
    [Tags]    login_fail
    Given You display the Login Page
    When Perform the site authentication   ${USER}    ${EMPTY}
    Then Validate if the login was fail    ${ERROR_PASSWORD_REQUIRED}

Scenario - Negative test, empty user and password
    [Tags]    login_fail
    Given You display the Login Page
    When Perform the site authentication   ${EMPTY}    ${EMPTY}
    Then Validate if the login was fail    ${ERROR_ALL_REQUIRED}

Scenario - Negative test, access the Inventory Page without authentication
    [Tags]    login_fail
    Given You display the Login Page
    When Access the page without authentication        ${INVENTORY_URL}
    Then Validate if the login was fail                ${ACCCESS_ERROR_INVENTORY}