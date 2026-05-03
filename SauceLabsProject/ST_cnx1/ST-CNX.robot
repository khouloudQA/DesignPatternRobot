*** Settings ***
Documentation    Code factorisé 
Metadata    Author    Khouloud
Library     SeleniumLibrary
# ./ => Repartoire courant
Resource    ./Function/function.robot
*** Test Cases ***
 #Nom du cas de Test 1
Se connecter avec invalid user locked
    [Tags]    invalid path
    Ouvrir URL
    Login User    ${invalid_user_locked}    ${passwordGeneral}     
# Nom du cas de Test 2 
Se connecter avec Error user
    [Tags]    invalid path
    Login User    ${Error_user}    ${passwordGeneral}       

# Nom du cas de Test 3
Se connecter avec user valid
    [Tags]    valid path
    Login User    ${valid_user}    ${passwordGeneral} 