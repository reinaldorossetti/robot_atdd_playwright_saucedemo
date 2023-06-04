*** Settings ***

Resource     ../../../support/baseTests.robot
Variables    ../elements/shopping_cart_page.yaml

*** Variables ***
@{list_names}=
@{list_prices}=

*** Keywords ***
Select Inventory Item by Name
    [Arguments]    ${name}
    Set Item in Locator    ${name}
    Scroll To Element    css=${ITEN_ELEMENT}
    Click                css=${ITEN_ELEMENT}    force=${True}
    Wait For All Promises
    Click                ${ADD_CART_BUTTON}
    ${price_text}=       Get Text    ${PRICE_DIV}
    Click                ${BACK_PRODUCTS_BUTTON}
    Append To List       ${list_names}      ${name}
    Append To List       ${list_prices}     ${price_text}
    Set Suite Variable   @{list_names}
    Set Suite Variable   @{list_prices}

Select the option to view the items in your cart
    Click    ${CART_BUTTON}   force=${True}
    Wait For All Promises

Validate in Cart
    Validate the list of elements
    Wait For Elements State         ${CHECKOUT_BUTTON}   state=visible    timeout=30s
    Wait For Elements State         ${CONTINUE_SHOPPING_BUTTON}   state=visible    timeout=30s
    ${elements_delete}=             Get Elements    ${DELETE_BUTTON}
    ${elements_cart_quantity}=      Get Elements    ${QUATITY_ITEM_TEXT}
    ${delete_count}=                Get Length    ${elements_delete}
    ${cart_quantity_count}=         Get Length    ${elements_delete}
    ${list_count}=                  Get Length    ${list_names}
    Should Be Equal       ${list_count}    ${cart_quantity_count}
    Should Be Equal       ${list_count}    ${delete_count}

Set Item in Locator
    [Arguments]    ${item}
    ${ITEN_ELEMENT}=   Set Variable  div.inventory_item_name:has-text(\"${item}\")
    Set Suite Variable    ${ITEN_ELEMENT}

Validate the list of elements
    FOR    ${item}    IN    @{list_names}
        Set Item in Locator        ${item}
        Wait For Elements State    css=${ITEN_ELEMENT}   state=visible    timeout=30s
    END
    FOR    ${price}    IN    @{list_prices}
        Wait For Elements State    text=${price}   state=visible    timeout=30s
    END