*** Settings ***
Resource    ../resources/user-resource.robot
Resource    ../resources/db-resource.robot
Resource    ../POMResources/LoginKeywords.robot
Force Tags      Regression

*** Variables ***
${Capture}      False
${BROWSER}      chrome

*** Keywords ***

Launch URL
    [Arguments]     ${url}
    Open Browser    ${url}  ${BROWSER}
    Maximize Browser Window
    ${title}=   Get Title
    RETURN  ${title}

Case Teardown
    Run Keyword And Ignore Error    Close All Browsers

*** Test Cases ***

Get Default Selenium Timers
    [Tags]  Misc
    ${speed}=   Get Selenium Speed
    Log To Console    ${speed}
    ${timeout}=     Get Selenium Timeout
    Log To Console    ${timeout}
    ${implicit}=      Get Selenium Implicit Wait
    Log To Console    ${implicit}
    [Teardown]  Case Teardown

Close Single Browser
    [Tags]  Misc
    ${return}=  Launch URL  http://127.0.0.1:5000/
    Should Be Equal As Strings    ${return}    Login
    Launch URL  https://www.google.com/
    Close Browser
    [Teardown]  Case Teardown

Close All Browsers
    [Tags]  Misc
    Launch URL  http://127.0.0.1:5000/
    Launch URL  https://www.google.com/
    Close All Browsers
    [Teardown]  Case Teardown
    
Manage iFrames
    [Tags]  Misc
    Launch URL  https://vinothqaacademy.com/iframe/
    Sleep    5s
    Select Frame    employeetable
    Current Frame Should Contain    Project Details
    Element Should Be Visible   id:addBtn
    Unselect Frame
    
    Select Frame    popuppage
    Current Frame Should Contain    Alert and PopUp
    Element Should Be Visible   alertbox
    Unselect Frame
    
    Select Frame    registeruser
    Sleep    1s
    #Current Frame Should Contain    Registration Form
    Element Should Be Visible   vfb-5
    Input Text    vfb-5    test
    Capture Element Screenshot      vfb-5
    Unselect Frame
    [Teardown]  Case Teardown

Manage Multiple Browser Tabs
    [Tags]  Misc
    Launch URL  https://demo.automationtesting.in/Windows.html
    Wait Until Element Is Enabled    xpath://*[@id="Tabbed"]/a/button
    Click Element   xpath://*[@id="Tabbed"]/a/button
    Switch Window   title=Selenium
    Click Link    xpath://*[@id="main_navbar"]/ul/li[5]/a
    Page Should Contain    Getting Help

    Switch Window   title=Frames & windows
    Page Should Contain    Automation Demo Site
    Click Link    xpath://*[@id="header"]/nav/div/div[2]/ul/li[1]/a
    Page Should Contain    Sign In

    Switch Window   title=Support | Selenium
    Click Link    xpath:/html/body/header/nav/a
    Page Should Contain    Getting Started
    [Teardown]  Case Teardown

Manage Multiple Browser Windows
    [Tags]  Misc
    Launch URL  https://demo.automationtesting.in/Windows.html
    Launch URL  https://www.google.com/
    Launch URL  https://www.bing.com/?cc=in
    
    Switch Browser    1
    Page Should Contain    Automation Demo Site
    ${1}=   Get Title
    Log To Console    ${1}

    Switch Browser    2
    Page Should Contain    Gmail
    ${2}=   Get Title
    Log To Console    ${2}

    Switch Browser    3
    Page Should Contain    Microsoft Bing
    ${3}=   Get Title
    Log To Console    ${3}

    Switch Browser    2
    Page Should Contain    Images

    Close All Browsers

Browser Go Keywords
    [Tags]  Misc
    Launch URL  https://www.google.com/

    ${url1}=    Get Location
    Log To Console    ${url1}
    Page Should Contain    Gmail

    Go To    https://www.bing.com/?cc=in
    ${url2}=    Get Location
    Log To Console    ${url2}
    Page Should Contain    Microsoft Bing

    Go Back
    ${url3}=    Get Location
    Log To Console    ${url3}
    Page Should Contain    Images

    [Teardown]  Case Teardown
    
Mouse Actions
    [Tags]  Misc
    Launch URL  https://swisnl.github.io/jQuery-contextMenu/demo.html

    # Right click/Open context menu
    Open Context Menu    xpath:/html/body/div/section/div/div/div/p/span
    Capture Page Screenshot
    Page Should Contain    Quit
    Capture Element Screenshot    xpath:/html/body/div/section/div/div/div/p/span

    # Double click
    Go To   https://testautomationpractice.blogspot.com
    Maximize Browser Window
    Double Click Element    xpath://*[@id="HTML10"]/div[1]/button
    ${value}=   Get Value    xpath://*[@id="field2"]
    Should Be Equal As Strings    ${value}    Hello World!
    Capture Element Screenshot    xpath://*[@id="field2"]

    #Drag and drop
    Page Should Contain    Drag me to my target
    Drag And Drop    id:draggable    id:droppable
    Capture Element Screenshot  id:droppable
    Page Should Contain    Dropped!
    [Teardown]  Case Teardown
    
Scrolling Page
    [Tags]  Misc
    Launch URL    https://www.countries-ofthe-world.com/flags-of-the-world.html
    Execute Javascript  window.scrollTo(0,1000)
    Close Browser
    Launch URL    https://www.countries-ofthe-world.com/flags-of-the-world.html
    Scroll Element Into View    xpath://*[@id="ct-list"]/table[1]/tbody/tr[86]/td[1]/img
    Launch URL    https://www.countries-ofthe-world.com/flags-of-the-world.html
    Execute Javascript  window.scrollTo(0,document.body.scrollHeight)
    Sleep    1s
    Execute Javascript  window.scrollTo(0,-document.body.scrollHeight)
    [Teardown]  Case Teardown

FOR loops
    [Tags]  Misc
    FOR    ${i}    IN RANGE    1    10  2
        Log To Console    ${i}
    END
    FOR    ${v}    IN   1   2   3   4   5
        Log To Console    ${v}
    END
    @{items}    Create List     2   4   6   8   10
    FOR    ${u}    IN   @{items}
        Log To Console    ${u}
    END
    @{names}    Create List     bhushan     gaikar      khanda      colony
    FOR    ${w}    IN   @{names}
        Log To Console    ${w}
    END
    @{ids}    Create List     smita     bhushan      gaikar   khanda      colony
    FOR    ${x}    IN   @{ids}
        Log To Console    ${x}
        Exit For Loop If    "${x}"=="bhushan"
    END
    @{items1}    Create List     3   5   7   9
    FOR    ${y}    IN   @{items1}
        Log To Console    ${y}
        Exit For Loop If    ${y}==7
    END
    @{items2}    Create List    11  22  33  44  55
    FOR    ${z}    IN   @{items2}
        Log To Console    ${z}
        Log To Console    Done
        Exit For Loop
        Log To Console    Skipped
    END

Count and Extract Links
    [Tags]  Misc
    Launch URL    https://www.google.com/
    ${AllLinksCount}=   Get Element Count    xpath://a
    Log To Console    ${AllLinksCount}

    @{LinkItems}    Create List
    FOR    ${i}    IN RANGE     1   ${AllLinksCount}+1
        Log    ${i}
        ${LinkText}=    Get Text    xpath:(//a)[${i}]
        Log To Console    ${LinkText}
    END

Working with HTML table
    [Tags]  Misc
    Launch URL    https://testautomationpractice.blogspot.com/
    #${rows}=   Get Element Count    BookTable
    #Log To Console    ${rows}
    #${cols}=   Get Element Count    BookTable
    #Log To Console    ${cols}

    ${value}=   Get Table Cell      BookTable     2    2
    Log To Console    ${value}

    Table Column Should Contain    BookTable    2    Amit
    Table Row Should Contain    BookTable    1    Subject
    Table Cell Should Contain    BookTable    5    4    3000

DB Connections
    [Tags]  Misc
    Connect Database
    Disconnect Database

DB operations
    [Tags]  Misc
    Connect Database
    Table Must Exist    users
    Execute Sql String      Delete from users;
    Check Row Count    select * from users    equal    0

    Execute Sql String      Insert into users values('Tom',15);
    Check Row Count     select age from users where name='Tom'      equal   1
    Check Row Count    select * from users    equal    1
    Check Row Count    select * from users    less than    2
    Check Row Count    select * from users    greater than    0

    Execute Sql String    Update users set age=16 where name='Tom';
    Check Row Count    select * from users    equal    1
    Check Row Count    select * from users    less than    2
    Check Row Count    select * from users    greater than    0
    
    ${query_result}=    Query    SELECT age, name FROM users WHERE name = 'Tom'    return_dict=True

    # The result is a list, so we access the first element [0]
    ${record}=    Set Variable    ${query_result}[0]

    # Assertions
    Should Be Equal As Strings    ${record}[name]       Tom
    Should Be Equal As Strings    ${record}[age]    16

    Disconnect Database

POM Keywords Test
    [Tags]    Misc
    Launch Browser
    Input Username    admin
    Input Password    password123
    Click Submit
    Page Should Contain    Welcome, admin!