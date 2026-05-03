*** Settings ***
Documentation    Code factorisé 
Metadata    Author    Khouloud
Library     SeleniumLibrary
Resource    ./Function/ADD_TO_CART_function.robot
Resource    .././ST_cnx1/Function/function.robot
*** Test Cases ***
Se connecter
    Ouvrir URL
    Login User    ${valid_user}    ${passwordGeneral} 

Add To Cart
    
    ADD TO CART
Filtrer From low to High
    Filtrer from low to High
