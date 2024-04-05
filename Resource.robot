*** Settings ***
Documentation    A resource file with reusuable variable and keywords
Library          SeleniumLibrary


*** Variables ***
${browser}              chrome
${url}                  https://naveenautomationlabs.com/opencart/
${E-mail}               TestPerson2@gmail.com
${invalid_Password}     TestPerson2
${valid_Password}       TestPerson2.123
${errormessage_locator}      xpath://div[@class='alert alert-danger alert-dismissible']
${error_message}        Warning: No match for E-Mail Address and/or Password.
${Successmessage_locator}    xpath://div[@class='alert alert-success alert-dismissible']
${Successfully_added_message}   Success:You have added

*** Keywords ***
Open the browser with the demo url
    Open Browser                ${url}  ${browser}
    Maximize Browser Window

Close Browser Session
    Close Browser

Wait until the element is located on the page
    [Arguments]                                 ${element}
    Wait Until Element is visible               ${element}