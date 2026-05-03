*** Settings ***
Documentation    Code factorisé
Library    SeleniumLibrary
Resource    ../../Delete_From_CART/Variables/Delete_From_CART_variables.robot
Resource    ../../STcnx1/Function/function.robot

*** Keywords ***
Remove From Cart
    Wait Until Element Is Enabled    ${Remove_Btn}
    Click Element    ${Remove_Btn}
    Wait Until Element Is Not Visible    ${Remove_Btn} 
    