*** Settings ***

Resource     ../../../support/baseTests.robot
Variables    ../elements/login_page.yaml


*** Keywords ***
Perform the site authentication
    Fill Text    ${USER_INPUT}        ${USER}
    Fill Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click        ${LOGIN_BUTTON}      force=${True}

Validate if the login was successful
    Wait For All Promises
    Wait For Elements State    text=Products   state=visible    timeout=30s
    Wait For Elements State    ${INVENTORY_LOCATOR}   state=visible    timeout=30s