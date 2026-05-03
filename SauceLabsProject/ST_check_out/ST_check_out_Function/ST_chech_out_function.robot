*** Settings ***
Documentation    Code factorisé
Library    SeleniumLibrary
Resource    ../../ADD_TO_CART/Function/ADD_TO_CART_function.robot
Resource    ../../ADD_TO_CART/Variables/ADD_TO_CART_variables.robot
Resource    ../ST_check_out_Variables/ST_check_out_variables.robot

*** Keywords ***
Ouvrir URL
    Open Browser    ${url}    ${browser}    options=add_argument("--incognito")

Go to panier
    Click Element    ${xpath_nombre_Article}
    Element Should Be Visible    ${Page_Title}
    Click Element    ${Btn_Checkout}
    Wait Until Element Is Visible    ${Checkout_Text}

Remplir les champs
    Wait Until Element Is Visible    ${First_Name}
    Input Text    ${First_Name}    ${Name_one}
    Input Text    ${Last_Name}    ${Name_Two}
    Input Text    ${Postal_Code}    ${Code}
    Click Element    ${Btn_Continue}
    Element Should Be Visible    ${Success_Checkout}