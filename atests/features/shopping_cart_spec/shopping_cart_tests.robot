*** Settings ***
Resource        keywords/shopping_cart_keywords.robot
Resource        ../../support/baseTests.robot

Suite Setup       Set Log Level    ${LOG_LEVEL}
Test Setup        Setting the Data for Testing
Test Teardown     Steps to Close Browser  

Default Tags    shopping_cart_tests

*** Variables ***
${PRODUCTS_ADD}=          Sauce Labs Bolt T-Shirt, Sauce Labs Fleece Jacket
${PRODUCT_TO_REMOVE}=     Sauce Labs Bolt T-Shirt
${PRODUCTS_TO_REMOVE}=    Sauce Labs Bolt T-Shirt, Sauce Labs Fleece Jacket

*** Test Cases ***
Scenario - Shopping cart checkout itens in cart
    [Tags]    shopping_cart_ok
    Given Successful login testing
    When Select Inventory Item by Name   ${PRODUCTS_ADD}
    And Select the option to view the items in your cart
    Then Validate in Cart

Scenario - Shopping cart checkout remove iten in cart
    [Tags]    shopping_cart_remove
    Given Successful login testing
    When Select Inventory Item by Name   ${PRODUCTS_ADD}
    And Select the option to view the items in your cart
    And Remove item from cart            ${PRODUCT_TO_REMOVE}
    Then Validate in Cart

Scenario - Shopping cart checkout remove all itens in cart
    [Tags]    shopping_cart_remove
    Given Successful login testing
    When Select Inventory Item by Name   ${PRODUCTS_ADD}
    And Select the option to view the items in your cart
    And Remove item from cart            ${PRODUCTS_TO_REMOVE}
    Then Validate empty itens in Cart