*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         FakerLibrary    locale=pt_BR
Library         JSONLibrary
Library         json
Library         OperatingSystem
Library         String
Library         re
Library         unicodedata
Library         regex

Metadata    Charset    UTF-8

#### Falta testar o filtro dos administradores ####

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

Rota Admin
    Criar administrador Multitentati

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

Criar administrador Multitentati
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    tenantId=e7422b1f-24e4-4f6d-83c5-ecc0e30d4f2e

    #Criando administrador
    ${EMAIL}=    FakerLibrary.Email
    ${NAME}=    FakerLibrary.Name
    # Id do grupo de permissões ADMIN
    ${groupsId}=    Create List    cb7e477e-7b0a-4e88-92e1-996f596029ba
    # Id do Tenant COIBAN
    ${tenants}=    Create List    e7422b1f-24e4-4f6d-83c5-ecc0e30d4f2e
    ${BODY_CREATE_ADMIN}=    Create Dictionary
    ...    email=${EMAIL}
    ...    name=${NAME}
    ...    password=Pass123123
    ...    pin=124578
    ...    groupsId=${groupsId}
    ...    tenants=${tenants}

    ${response_create_admin}=  POST On Session  BackOffice  /admin    json=${BODY_CREATE_ADMIN}    headers=${headers}
    Should Be Equal As Strings  ${response_create_admin.status_code}  200

    #Verificar administrador criado
    ${params}=    Create Dictionary    page=0    offset=0    orderBy=createdAt    sort=DESC
    ${response}=  GET On Session  BackOffice  /admin    headers=${headers}    params=${params}
    Should Be Equal As Strings  ${response.status_code}  200
        
    ${json}=    Evaluate    json.loads('''${response.content}''')
    ${admin}=    Set Variable    ${json['rows'][0]}
    ${nome_sem_acento}=  remova_caracteres_especiais  ${admin['name']}
    Should Be Equal As Strings    ${nome_sem_acento}    ${NAME}
    ${created_admin}=    Run Keyword And Return Status    Should Be Equal As Strings    ${admin['email']}    ${EMAIL}

    IF  ${created_admin}
        ${created_admin_response}=  GET On Session  BackOffice  /admin/${admin['id']}    headers=${headers}
        Should Be Equal As Strings  ${created_admin_response.status_code}  200

        ${created_admin_email}=    Get From Dictionary    ${created_admin_response.json()}    email
        Run Keyword If    '${created_admin_email}' == '${EMAIL}'
        ...    Editar administrador Multitentati    ${admin['id']}    ${headers}
    END

Editar administrador Multitentati
    [Arguments]    ${id}    ${headers}

    ${EMAIL}=    FakerLibrary.Email
    ${NAME}=    FakerLibrary.Name
    # Id do grupo de permissões ADMIN
    ${groupsId}=    Create List    cb7e477e-7b0a-4e88-92e1-996f596029ba    82153c05-57d2-432c-bb47-f6073c6576ef
    # Id do Tenant COIBAN
    ${tenants}=    Create List    e7422b1f-24e4-4f6d-83c5-ecc0e30d4f2e
    ${BODY_EDIT_ADMIN}=    Create Dictionary
    ...    email=${EMAIL}
    ...    name=${NAME}
    ...    password=Pass444555
    ...    pin=124578
    ...    groupsId=${groupsId}
    ...    tenants=${tenants}

    ${edit_admin_response}=    PUT On Session    BackOffice    /Admin/${id}    json=${BODY_EDIT_ADMIN}    headers=${headers}
    Should Be Equal As Strings  ${edit_admin_response.status_code}  200

    #Verificar administrador editado
    ${params}=    Create Dictionary    page=0    offset=0    orderBy=createdAt    sort=DESC
    ${get_admins_response}=  GET On Session  BackOffice  /admin    headers=${headers}    params=${params}
    Should Be Equal As Strings  ${get_admins_response.status_code}  200

    ${json}=    Evaluate    json.loads('''${get_admins_response.content}''')
    ${admin}=    Set Variable    ${json['rows'][0]}
    Should Be Equal As Strings    ${admin['name']}    ${NAME}
    ${edited_admin_email}=    Run Keyword And Return Status    Should Be Equal As Strings    ${admin['email']}    ${EMAIL}

    IF  ${edited_admin_email}
        # Excluir
        ${delete_admin_response}=    DELETE On Session    BackOffice    /Admin/${id}    headers=${headers}
        Should Be Equal As Strings  ${delete_admin_response.status_code}  204
    END

Excluir administrador Multitentati

remova_caracteres_especiais
    [Arguments]    ${string}

    ${string_normalizada}=  Evaluate  unicodedata.normalize('NFKD', u"${string}").encode('ASCII', 'ignore')
    ${string_sem_acento}=  Evaluate  regex.sub(r'[^a-zA-Z0-9 .\\\'-]', '', "${string_normalizada}")
    [Return]  ${string_sem_acento}
