*** Settings ***
Documentation    A resource file with reusuable variable and keywords
Library          SeleniumLibrary


*** Variables ***
${browser}              chrome
${url}                  https://naveenautomationlabs.com/opencart/
${E-mail}               TestPerson2@gmail.com
${invalid_Password}     TestPerson2
${valid_Password}       TestPerson2.123
${error_message}        Warning: No match for E-Mail Address and/or Password.
${Successfully_added_message}   Sucess:You have added

*** Keywords ***
Open the browser with the demo url
    Open Browser                ${url}  ${browser}
    Maximize Browser Window

Close Browser Session
    Close Browser

