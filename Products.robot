*** Settings ***
Documentation       Test suite to validate the product-related actions
Library             SeleniumLibrary
Library             Collections
Test Setup          Open the browser with the demo url
Test Teardown       Close Browser Session
Resource            Resource.robot

*** Test Cases ***
Verifying the products
    Fill the login form     ${E-mail}       ${Valid_Password}
    Verify the product list in the desktop page

*** Keywords ***
Fill the login form
    [Arguments]       ${Email}       ${password}
    Click Element     css:.caret
    Click Link        Login
    Input Text        input-email     ${Email}
    Input Password    input-password  ${password}
    Click Button      css:input[value='Login']

Verify the product list in the desktop page
    Click Link              xpath://a[text()='Desktops']
    Click Link              xpath://a[text()='Show All Desktops']
    # Define expected list of product names
    @{expected_list}         Create List     Apple Cinema 30"    Canon EOS 5D    HP LP3065      HTC Touch HD    iPhone  iPod Classic    MacBook     MacBook Air     Palm Treo Pro       Product 8       Samsung SyncMaster 941BW        Sony VAIO

    #Get actual list of product names from the webpage
    ${Product_Elements}         Get WebElements         css:div[class='caption'] a

    #Create an empty list to store actual product names
    @{actual_list}           Create List

    # Iterate through each product element, fetch its text, and add it to the actual list
    FOR     ${Product_Element}  IN      @{Product_Elements}
        ${Product_Name}=     Get Text   ${Product_Element}
        Log     Fetched product names: ${Product_Name}
        Append To List       ${actual_list}     ${Product_Name}
    END
    Lists should be Equal          ${expected_list}      ${actual_list}

