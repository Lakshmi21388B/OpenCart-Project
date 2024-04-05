*** Settings ***
Documentation       Validating the Login functionality
Library             SeleniumLibrary
Library             Collections
Test Setup          Open the browser with the demo url
Test Teardown       Close Browser Session
Resource            Resource.robot

*** Test Cases ***
Validating Unsuccessful login
    Fill the login form     ${E-mail}       ${invalid_Password}
    Wait until the element is located on the page       ${errormessage_locator}
    Verify if the error message displayed is correct    ${errormessage_locator}       ${error_message}

*** Keywords ***
Fill the login form
    [Arguments]       ${Email}       ${password}
    Click Element     css:.caret
    Click Link        Login
    Input Text        input-email     ${Email}
    Input Password    input-password  ${password}
    Click Button      css:input[value='Login']

Verify if the error message displayed is correct
   [Arguments]                   ${element}     ${message}
   Element Text Should Be        ${element}     ${message}
