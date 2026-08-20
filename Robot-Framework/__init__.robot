*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Suite Setup    Global Setup
Suite Teardown    Global Teardown

*** Variables ***

*** Keywords ***

Global Setup
    Run Keyword And Ignore Error        Remove Files    ${CURDIR}/../output/*.png
    Set Screenshot Directory    ${CURDIR}/../output

Global Teardown
    Run Keyword And Ignore Error    Close All Browsers