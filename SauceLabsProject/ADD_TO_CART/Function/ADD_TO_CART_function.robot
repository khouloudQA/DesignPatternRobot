*** Settings ***
Documentation    Code factorisé 
Library     SeleniumLibrary
Library    Collections
Resource    ../../ADD_TO_CART/Variables/ADD_TO_CART_variables.robot
Resource    ../../ST_cnx1/Function/function.robot
*** Keywords ***
ADD TO CART
    Wait Until Element Is Visible    ${Add_To_CART}
    Click Button    ${Add_To_CART} 
     Wait Until Element Is Visible    ${xpath_nombre_Article} 
     ${nombre_articles_Affichés}    Get Text     ${xpath_nombre_Article} 
     Should Be Equal As Strings       ${nombre_articles_Affichés}     1
     
Filtrer from low to High
    Click Element    ${Filtre_Product}
    Select From List By Label    ${Filtre_Product}    Price (low to high) 
    # creer une liste vide pour stocker les prix des produits
    ${Prices}    Create List
    # Recupérer tous les elements contenant les prix des produits 
    ${elements}    Get WebElements    ${PRODUCT_Prices}
    # Boucle sur chaque element pour extraire le text (=le prix)
    FOR    ${element}    IN    @{elements}
    # Recuperer le text du prix de chaque element (ex: $29.99)
    ${text}    Get Text    ${element}
    # Convertir le text du prix en nombre, en retirant le symbole "$"
    ${price}    Convert To Number    ${text.replace("$", "")}
    
    # Ajouter le prix à la liste des prix 
    Append To List    ${Prices}    ${price}       

    END
    # creer une copie de la liste des prix pour pouvoir la trier 
    ${sorted_Prices}    Copy List    ${Prices}
    # Trier la liste des prix dans l'ordre croissant 
    Sort List    ${sorted_Prices}
    # compare la liste triée de la liste initiale pour vérifier qu'elles dont identiques 
    Lists Should Be Equal  ${Prices}    ${sorted_Prices}  
    # si le test est passé, log un message de succès      
    Log    "les produits sont triès par prix croissant"
        
   
