*** Settings ***
Documentation    Code factorisé
Metadata    Author    Khouloud
Library    SeleniumLibrary
Resource    ../Delete_From_CART/Function/Delete_From_CART_function.robot
Resource    ../ADD_TO_CART/Function/ADD_TO_CART_function.robot
Resource    ../STcnx1/Function/function.robot

*** Test Cases ***
Se connecter
    Ouvrir URL
    Login User    ${valid_user}    ${passwordGeneral}

Delete from cart
    ADD TO CART
    Remove From Cart
    