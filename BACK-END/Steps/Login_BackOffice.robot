*** Settings ***
Library         RequestsLibrary
Library         Collections

*** Variables ***
${HOST_COIBAN}          https://backoffice-api.bankeiro.coiban.com.br
${DEVICE_ID}            8a6649c5-3400-4f55-9942-19578ee7a442

${base}                 https://auth.bankeiro.coiban.com.br/auth/realms/bankeiro-backoffice/protocol/openid-connect
${userName}             yam.carrasco@mblabs.com.br
${password}             Pass123123
${CLIENT_ID}            50c8b493-f03c-403c-9c0c-9a03db91b4e1

*** Test Cases ***
Login
    Login no backoffice
    Rota ME
    Rota de relatórios

*** Keywords ***
Login no backoffice
    # Configurações iniciais
    Create Session  BackOffice  ${base}
    ${headers}=  Create Dictionary  Content-Type  application/x-www-form-urlencoded
    ${payload}=  Set Variable  username=${userName}&password=${password}&grant_type=password&client_id=${CLIENT_ID}
    ${response}=  POST On Session  BackOffice  /token  data=${payload}  headers=${headers}

    # Verifica o código de resposta e a mensagem de retorno
    Should Be Equal As Strings  ${response.status_code}  200
    ${ACCESS_TOKEN}=  Get From Dictionary  ${response.json()}  access_token

    Set Suite Variable    ${ACCESS_TOKEN}    ${ACCESS_TOKEN}

Rota ME
    Create Session  BackOffice  ${HOST_COIBAN}
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    tenantId=e7422b1f-24e4-4f6d-83c5-ecc0e30d4f2e
    
    ${response}=  GET On Session  BackOffice  /admin/me    headers=${headers}

    Should Be Equal As Strings  ${response.status_code}  200

Rota de relatórios
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    tenantId=e7422b1f-24e4-4f6d-83c5-ecc0e30d4f2e

    ${params}=    Create Dictionary    page=0    offset=0    orderBy=createdAt    sort=DESC
    ${endpoint}=    Set Variable    /account

    ${response}=  GET On Session  BackOffice  ${endpoint}    headers=${headers}    params=${params}
    Should Be Equal As Strings  ${response.status_code}  200

