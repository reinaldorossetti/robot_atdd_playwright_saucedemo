*** Settings ***

Resource     ../../../support/baseTests.robot
Variables    ../elements/shopping_cart_page.yaml
Library    String

*** Keywords ***
Setting the Data for Testing
    @{list_names}=    Create List
    @{list_prices}=    Create List
    Set Test Variable     @{list_names}
    Set Test Variable     @{list_prices}

Select Inventory Item by Name
    [Arguments]    ${names}
    @{list_names}=   Split String    ${names}    ,

    FOR    ${item_name}    IN    @{list_names}
        Set Item in Locator        ${item_name}
        Scroll To Element    css=${ITEN_ELEMENT}
        Click                css=${ITEN_ELEMENT}    force=${True}
        Wait For All Promises
        Click                ${ADD_CART_BUTTON}
        ${price_text}=       Get Text    ${PRICE_DIV}
        Click                ${BACK_PRODUCTS_BUTTON}
        Wait For All Promises
        Append To List       ${list_prices}     ${price_text}
    END
    Set Test Variable     @{list_names}
    Set Test Variable     @{list_prices}

Select the option to view the items in your cart
    Click    ${CART_BUTTON}   force=${True}
    Wait For All Promises

Remove item from cart
    [Arguments]    ${names}
    @{list_names_remove}=   Split String    ${names}    ,

    FOR    ${item_name}    IN    @{list_names_remove}
        Set Item Delete in Locator    ${item_name}
        Click    ${ITEN_ELEMENT}    force=True
        ${INDEX}=        Get Index From List    ${list_names}    ${item_name}
        Remove From List     ${list_names}     ${INDEX}
        Remove From List     ${list_prices}    ${INDEX}
    END
    Wait For All Promises
    Run Keyword And Ignore Error   Wait Until Network Is Idle

Validate in Cart
    Validate the list of elements
    Wait For Elements State         ${CHECKOUT_BUTTON}   state=visible    timeout=30s
    Wait For Elements State         ${CONTINUE_SHOPPING_BUTTON}   state=visible    timeout=30s
    ${elements_delete}=             Get Elements    ${DELETE_BUTTON}:has-text(\"Remove\")
    ${elements_cart_quantity}=      Get Elements    ${QUATITY_ITEM_TEXT}
    ${delete_count}=                Get Length    ${elements_delete}
    ${cart_quantity_count}=         Get Length    ${elements_delete}
    ${list_count}=                  Get Length    ${list_names}
    Should Be Equal       ${list_count}    ${cart_quantity_count}
    Should Be Equal       ${list_count}    ${delete_count}

Validate empty itens in Cart
    Set Browser Timeout    3s
    Validate in Cart

Set Item in Locator
    [Arguments]    ${item}
    ${ITEN_ELEMENT}=   Set Variable  div.inventory_item_name:has-text(\"${item.strip()}\")
    Set Suite Variable    ${ITEN_ELEMENT}

Set Item Delete in Locator
    [Arguments]    ${item}
    ${ITEN_ELEMENT}=   Set Variable  xpath=//div[text()="${item.strip()}"]/ancestor::div[@class="cart_item_label"]/descendant::button[text()="Remove"]
    Set Suite Variable    ${ITEN_ELEMENT}

Validate the list of elements
    ${list_count}=                  Get Length    ${list_names}
    Log To Console    "list: @{list_names}, ${list_count}"
    IF    ${list_count}>0
        FOR    ${item}    IN    @{list_names}
            Set Item in Locator        ${item}
            Wait For Elements State    css=${ITEN_ELEMENT}   state=visible    timeout=30s
        END
        FOR    ${price}    IN    @{list_prices}
            Wait For Elements State    text=${price}   state=visible    timeout=30s
        END
    END