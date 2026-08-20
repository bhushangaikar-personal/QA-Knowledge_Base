*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Suite Setup     Form Suite Setup
Suite Teardown  Close All Browsers
Force Tags      Regression

*** Variables ***
${URL}  http://127.0.0.1:5000/
${BROWSER}      chrome
${username}     admin
${password}     password123
${Capture}      True

*** Keywords ***

Form Suite Setup
    #Remove Files    ${CURDIR}/../output/*.png
    #Set Screenshot Directory    ${CURDIR}/../output
    Log To Console    Form

Case Setup
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
    #Set Selenium Speed    1seconds
    Input Text  username    ${username}
    Input Text    password    ${password}
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Click Button    Submit
    Set Selenium Timeout    1 second
    Wait Until Page Contains    Welcome, admin!

Case Teardown
    Click Element    xpath://a[@class='logout-btn']
    Run Keyword And Ignore Error       Close Browser

*** Test Cases ***

Manage check boxes
    [Tags]  Form
    [Setup]     Case Setup
    Select Checkbox    id:genderMale
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Select Checkbox    id:genderFemale
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Unselect Checkbox    id:genderMale
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Unselect Checkbox    id:genderFemale
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    [Teardown]      Case Teardown

Manage radio buttons
    [Tags]  Form
    [Setup]     Case Setup
    Select Radio Button    location    Pune
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Select Radio Button    location    Mumbai
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Select Radio Button    location    Navi Mumbai
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    [Teardown]      Case Teardown

Manage drop down list
    [Tags]  Form
    [Setup]     Case Setup
    Select From List By Value    color  Red
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Select From List By Value    color  Green
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Select From List By Value    color  Yellow
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Select From List By Index    color  1
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Select From List By Index    color  2
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Select From List By Index    color  3
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Select From List By Label    color  Red
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Select From List By Label    color  Green
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Select From List By Label    color  Yellow
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    [Teardown]      Case Teardown

Manage Text Boxes
    [Tags]  Form
    [Setup]     Case Setup
    Set Selenium Implicit Wait    10seconds
    Input Text    xpath://*[@id="firstName"]    Bhushan
    Input Text    xpath://*[@id="lastName"]    Gaikar
    Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    [Teardown]      Case Teardown

Manage Alert Box
    [Tags]  Form1
    [Setup]     Case Setup
    Click Element    xpath://*[@id="dashboardForm"]/div[6]/button
    #Page Should Contain    Are you sure?
    #Alert Should Be Present    Are you sure?
    Handle Alert    accept
    #Run Keyword If    "${Capture}" == "True"  Capture Page Screenshot
    Click Element    xpath://*[@id="dashboardForm"]/div[6]/button
    #Page Should Contain    Are you sure?
    #Alert Should Be Present    Are you sure?
    Handle Alert    dismiss
    Click Element    xpath://*[@id="dashboardForm"]/div[6]/button
    #Page Should Contain    Are you sure?
    #Alert Should Be Present    Are you sure?
    Handle Alert    leave
    Handle Alert    accept
    Element Should Be Enabled    xpath://a[@class='logout-btn']
    [Teardown]      Case Teardown