*** Settings ***
Resource        keywords/shopping_cart_keywords.robot
Resource        ../../support/baseTests.robot

Test Setup    Set Log Level    ${LOG_LEVEL}

Test Teardown    Steps to Close Browser  

Default Tags    shopping_cart_tests

*** Test Cases ***
Successful login testing
    [Tags]    shopping_cart_ok
    Given Successful login testing
    When Select Inventory Item by Name   Sauce Labs Bolt T-Shirt
    AND Select Inventory Item by Name    Sauce Labs Fleece Jacket
    Then Validate in Cart
