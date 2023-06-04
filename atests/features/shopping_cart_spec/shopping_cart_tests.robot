*** Settings ***
Resource        keywords/shopping_cart_keywords.robot
Resource        ../../support/baseTests.robot

Suite Setup   Set Log Level    ${LOG_LEVEL}

Test Teardown    Steps to Close Browser  

Default Tags    shopping_cart_tests

*** Test Cases ***
Successful login testing
    [Tags]    shopping_cart_ok
    Given Successful login testing
    When Select Inventory Item by Name   Sauce Labs Bolt T-Shirt
    And Select Inventory Item by Name    Sauce Labs Fleece Jacket
    And Select the option to view the items in your cart
    Then Validate in Cart
