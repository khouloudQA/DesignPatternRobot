*** Settings ***
Documentation    Code factorisé 
Library     SeleniumLibrary
# ../ => repartoire parent
Resource    ../Variables/variables.robot
*** Keywords ***
Ouvrir URL
    Open Browser    ${url}     ${browser}    options=add_argument("--incognito")
    
Login User
    [Arguments]    ${userName}    ${password}
    Wait Until Element Is Visible   ${champUserName}  
    Input Text    ${champUserName}    ${userName}
    Input Text    ${champPassword}  ${Password} 
    Click Element    ${login}    