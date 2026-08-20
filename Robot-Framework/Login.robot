*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
#Resource        ../resources/user-resource.robot
Suite Setup     Login Suite Setup
Suite Teardown  Close All Browsers
Force Tags      Regression

*** Variables ***
${URL}  http://127.0.0.1:5000/
${BROWSER}  chrome
${Capture}      True

*** Keywords ***

Login Suite Setup
    #Remove Files    ${CURDIR}/../output/*.png
    #Set Screenshot Directory    ${CURDIR}/../output
    Log To Console    Login

Case Setup
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
    #${origspeed}=   Get Selenium Speed
    #Log To Console    ${origspeed}
    #Set Selenium Speed    10 milliseconds
    #${newspeed}=   Get Selenium Speed
    #Log To Console    ${newspeed}

Case Teardown
    Run Keyword And Ignore Error       Close Browser

Login With Credentials
    [Arguments]     ${username}     ${password}
    Input Text  username    ${username}
    Input Text    password    ${password}
    Run Keyword If    "${Capture}" == "True"    Capture Page Screenshot
    Click Button    Submit

*** Test Cases ***

Successful Login Test
    [Tags]  Login
    [Setup]     Case Setup
    Login With Credentials  admin   password123
    Run Keyword If    "${Capture}" == "True"    Capture Page Screenshot     Login1.png
    #Sleep    1
    Page Should Contain    Welcome, admin
    [Teardown]      Case Teardown

Unsuccessful Login with wrong password
    [Tags]  Login
    [Setup]     Case Setup
    Login With Credentials  admin   password
    Run Keyword If    "${Capture}" == "True"    Capture Page Screenshot
    Page Should Contain    Invalid username or password. Please try again.
    Page Should Not Contain    Welcome, admin
    [Teardown]      Case Teardown

Unsuccessful Login with wrong username
    [Tags]  Login
    [Setup]     Case Setup
    Login With Credentials  bhushan   password123
    Run Keyword If    "${Capture}" == "True"    Capture Page Screenshot
    Page Should Contain    Invalid username or password. Please try again.
    Page Should Not Contain    Welcome, admin
    [Teardown]      Case Teardown

Unsuccessful Login with wrong username & password
    [Tags]  Login
    [Setup]     Case Setup
    Login With Credentials  bhushan   password
    Run Keyword If    "${Capture}" == "True"    Capture Page Screenshot
    Page Should Contain    Invalid username or password. Please try again.
    Page Should Not Contain    Welcome, admin
    [Teardown]      Case Teardown

Successful Logout Test
    [Tags]  Login
    [Setup]     Case Setup
    Login With Credentials  admin   password123
    Run Keyword If    "${Capture}" == "True"    Capture Page Screenshot
    Page Should Contain    Welcome, admin
    Click Element    xpath://a[@class='logout-btn']
    Page Should Contain    Login
    Page Should Contain    Submit
    [Teardown]      Case Teardown
    
Validate Title
    [Tags]  Login
    [Setup]     Case Setup
    Run Keyword If    "${Capture}" == "True"    Capture Page Screenshot
    Title Should Be    Login
    [Teardown]      Case Teardown

LoginTestWithCSV using ${username} and ${password}
    [Tags]  donotrun
    Log To Console    Nothing to run


