*** Settings ***
Documentation    Code factorisé
Metadata    Author    Khouloud
Library    SeleniumLibrary
Resource    ../ADD_TO_CART/Function/ADD_TO_CART_function.robot
Resource    ../STcnx1/Function/function.robot
Resource    ./ST_check_out_Function/ST_chech_out_function.robot

*** Test Cases ***
Se connecter
    ST_chech_out_function.Ouvrir URL
    Login User    ${valid_user}    ${passwordGeneral}

Remplir le panier
    ADD TO CART

Consulter le panier
    Go to panier

Checkout
    Remplir les champs  
