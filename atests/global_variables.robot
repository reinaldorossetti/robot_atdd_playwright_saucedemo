*** Settings ***
Library        Browser
Library        Collections
Library        FakerLibrary
Library        String

*** Variables ***

${URL_SITE}              https://www.saucedemo.com/
${PATH_FEATURES}         ${EXECDIR}/atests/features
${LOG_LEVEL}             DEBUG
${DIC_EMPTY}
${HEADLESS_FLAG}         ${False}
${BROWSER}               chromium