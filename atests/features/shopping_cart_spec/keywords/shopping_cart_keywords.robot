*** Settings ***

Resource     ../../../support/baseTests.robot
Variables    ../elements/shopping_cart_page.yaml

*** Variables ***
@{list_names}=

*** Keywords ***
Select Inventory Item by Name
    [Arguments]    ${name}
    Set Item in Locator    ${name}
    Scroll To Element    css=${ITEN_ELEMENT}
    Click                css=${ITEN_ELEMENT}    force=${True}
    Wait For All Promises
    Click                ${ADD_CART_BUTTON}
    Click                ${BACK_PRODUCTS_BUTTON}
    Append To List       ${list_names}     ${name}
    Set Suite Variable   @{list_names}

Validate in Cart
    Click    ${CART_BUTTON}   force=${True}
    Wait For All Promises
    FOR    ${item}    IN    @{list_names}
        Set Item in Locator    ${item}
        Log    ${ITEN_ELEMENT}    level=DEBUG
        Wait For Elements State    css=${ITEN_ELEMENT}   state=visible    timeout=30s
    END

Set Item in Locator
    [Arguments]    ${item}
    ${ITEN_ELEMENT}=   Set Variable  div.inventory_item_name:has-text(\"${item}\")
    Set Suite Variable    ${ITEN_ELEMENT}

