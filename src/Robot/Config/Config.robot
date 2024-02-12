*** Settings ***
Library     RequestsLibrary
Library     ../../Helpers/Get_Envs.py


*** Keywords ***
Criar conexão
    ${ENVS}    Get Enviroment Variables
    Set Global Variable    ${ENVS}    ${ENVS}

    Create Session
    ...    alias=JSON API
    ...    url=${ENVS['BASE_API']}
    ...    disable_warnings=1
    ...    max_retries=3

Encerrar conexão
    Delete All Sessions
