*** Settings ***
Library    RequestsLibrary
*** Variables ***
${BASE_URL}   https://petstore.swagger.io/v2
${USERNAME}   api_key  
${PASSWORD}   khouloudKadhi 
${PET_ID}     12345
${PET_NAME}   Ichek
${PET_STATUS}    available
*** Keywords ***
Create a session
    ${auth} =     Create List    ${USERNAME}    ${PASSWORD}
    Create Session  petstore  ${BASE_URL}    auth=${auth}
*** Test Cases ***
Create Pet (POST)
    [Documentation]  Créer un nouvel animal via POST avec authentification Basic  
    ### on utilise dictionnaire lorsque je veux utiliser plusieurs valeurs en mme temps 
    ${payload}=  Create Dictionary  id=${PET_ID}  name=${PET_NAME}  status=${PET_STATUS}
    ### id   |  name  | status
    ### 12345| Ichek  | 200

    ${response}=  POST  ${BASE_URL}/pet  json=${payload}
    Should Be Equal As Numbers  ${response.status_code}  200
    Should Contain  ${response.json()['name']}  ${PET_NAME}
Get Pet (GET)
    [Documentation]  Récupérer l'animal créé via GET avec authentification Basic
    ${auth} =     Create List    ${USERNAME}    ${PASSWORD}
    Create a session
    ${response}=  GET  ${BASE_URL}/pet/${PET_ID}
    Should Be Equal As Numbers  ${response.status_code}  200
    Should Contain  ${response.json()['name']}  ${PET_NAME}
Delete Pet (DELETE)
    [Documentation]  Supprimer l'animal via DELETE avec authentification Basic
    ${auth} =     Create List    ${USERNAME}    ${PASSWORD}
    Create a session
    ${response}=  DELETE  ${BASE_URL}/pet/${PET_ID}
    Should Be Equal As Numbers  ${response.status_code}  200
    Should Contain  ${response.json()['message']}  ${PET_ID}
Get Pet After Deletion (GET)
    [Documentation]  Vérifier que l'animal a bien été supprimé après suppression avec authentification Basic
    ${auth} =     Create List    ${USERNAME}    ${PASSWORD}
    Create a session
    ${response}=  GET  ${BASE_URL}/pet/${PET_ID}
    Should Be Equal As Numbers  ${response.status_code}    404