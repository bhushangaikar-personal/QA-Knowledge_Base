*** Settings ***
Resource        ../resources/api-resource.robot
Force Tags      Regression

*** Variables ***

*** Keywords ***

*** Test Cases ***

GET API
    [Tags]    API
    # Call our custom keyword below and capture the parsed JSON list
    ${get_response}=    Get All Posts
    Status Should Be    200    ${get_response}
    Request Should Be Successful   ${get_response}

POST API
    [Tags]    API
    ${post_response}=    Create New Post    title=Robot Framework API    body=Automating with RequestsLibrary    userId=1
    Status Should Be     201    ${post_response}
    Request Should Be Successful   ${post_response}

PUT API
    [Tags]    API
    ${put_response}=     Update Existing Post    id=1    title=Updated Title    body=Updated Body    userId=1
    Status Should Be     200    ${put_response}
    Request Should Be Successful   ${put_response}

DELETE API
    [Tags]    API
    ${delete_response}=  Delete Post By Id       id=1
    Status Should Be     200    ${delete_response}
    Request Should Be Successful   ${delete_response}

