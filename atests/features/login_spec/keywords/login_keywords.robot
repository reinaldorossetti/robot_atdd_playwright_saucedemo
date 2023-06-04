*** Settings ***

Resource     ../../../support/baseTests.robot
Variables    ../elements/login_page.yaml


*** Keywords ***
Perform the site authentication
    [Arguments]    ${USER_NAME}=${USER}    ${PW}=${PASSWORD}
    Fill Text    ${USER_INPUT}        ${USER_NAME}
    Fill Text    ${PASSWORD_INPUT}    ${PW}
    Click        ${LOGIN_BUTTON}      force=${True}

Perform the site authentication fail by user
    Fill Text    ${USER_INPUT}        ${INCORRECT_USER}
    Fill Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click        ${LOGIN_BUTTON}      force=${True}

Validate if the login was successful
    Wait For All Promises
    Wait For Elements State    text=Products   state=visible    timeout=30s
    Wait For Elements State    ${INVENTORY_LOCATOR}   state=visible    timeout=30s

Validate if the login was fail
    [Arguments]    ${ERROR_MESSAGE}=${ERROR_TEXT}
    Wait For Elements State    text=${ERROR_MESSAGE}   state=visible    timeout=30s
    Elements in Login Page Fail

Elements in Login Page Fail
    ${elements_img_error}=         Get Elements    css=${ERROR_IMG}
    ${img_error_count}=            Get Length    ${elements_img_error}
    Should Be Equal                "2"    "${img_error_count}"
    Wait For Elements State        ${LOGIN_BUTTON}     state=visible    timeout=15s

Access the page without authentication 
    [Arguments]    ${URL}
    New Context
    New Page    ${URL}
    Wait Until Network Is Idle    timeout=20s
