*** Settings ***
Documentation       Validating Cart
Library             SeleniumLibrary
Library             Collections
Test Setup          Open the browser with the demo url
Test Teardown       Close Browser Session
Resource            Resource.robot

*** Test Cases ***
Adding products to the cart
    Fill the login form     ${E-mail}       ${Valid_Password}
    Select the product and add to cart    MacBook
    Wait until the element is located on the page      ${Successmessage_locator}

*** Keywords ***
Fill the login form
    [Arguments]       ${Email}       ${password}
    Click Element     css:.caret
    Click Link        Login
    Input Text        input-email     ${Email}
    Input Password    input-password  ${password}
    Click Button      css:input[value='Login']
Select the product and add to cart
    [Arguments]             ${product}
    Click Link              xpath://a[text()='Desktops']
    Click Link              xpath://a[text()='Show All Desktops']
    ${Product_Elements}=     Get WebElements      css:div[class='caption'] a
    ${index}=           Set Variable            1
    FOR    ${Product_Element}   IN      @{Product_Elements}
        Exit For loop If     '${product}' == '${Product_Element.text}'
            ${index}=   Evaluate    ${index} + 1
    END
    Click Element    xpath:(//span[contains(text(),'Add to Cart')])[${index}]

