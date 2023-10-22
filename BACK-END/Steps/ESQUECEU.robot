*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         FakerLibrary    locale=pt_BR


*** Variables ***
#${HOST_COIBAN}          https://app-api.bankeiro.coiban.com.br
${HOST_COIBAN}          https://api.beta.bankeiro.com
${DEVICE_ID}          8a6649c5-3400-4f55-9942-19578ee7a442

*** Test Cases ***
Esqueceu a senha?
    [Tags]    Troca de senha sem estar logado
    Esqueceu a senha
    Trocar senha

Esqueceu o login?
    [Tags]    Recuperar login
    Esqueceu o login

*** Keywords ***
Esqueceu a senha
    Create Session    Esqueceu a senha    ${HOST_COIBAN}

    ${HEADERS}=    Create Dictionary
    ...    device-id=${DEVICE_ID}

    ${BODY}    Create Dictionary
    ...    taxIdentifier=43170826832

    ${response}=  POST On Session  Esqueceu a senha  /user/recovery-password  json=${BODY}  headers=${headers}
    Should Be Equal As Strings  ${response.status_code}  200

Trocar senha
    Create Session    Trocar a senha    ${HOST_COIBAN}

    ${HEADERS}=    Create Dictionary
    ...    device-id=${DEVICE_ID}

    ${BODY}    Create Dictionary
    ...    password=Pass123123
    ...    taxIdentifier=43170826832
    ...    token=112233

    ${response}=  POST On Session  Esqueceu a senha  /user/change-password  json=${BODY}  headers=${headers}
    Should Be Equal As Strings  ${response.status_code}  204
    
Esqueceu o login
    Create Session    Esqueceu o login    ${HOST_COIBAN}

    ${HEADERS}=    Create Dictionary
    ...    device-id=${DEVICE_ID}

    ${BODY}    Create Dictionary
    ...    taxIdentifier=43170826832

    ${response}=  POST On Session  Esqueceu o login  /user/recovery-login  json=${BODY}  headers=${headers}
    Should Be Equal As Strings  ${response.status_code}  200