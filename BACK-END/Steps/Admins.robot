*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         FakerLibrary    locale=pt_BR
Library         JSONLibrary
Library         json
Library         OperatingSystem
Library         String
Library         DateTime

Documentation    Teste regressivo de criação de administrador

Metadata    Charset    UTF-8

*** Variables ***
${HOST_COIBAN}          https://backoffice-api.bank.hurb.com
${DEVICE_ID}            8a6649c5-3400-4f55-9942-19578ee7a442

${base}                 https://auth.bank.hurb.com/auth/realms/bankeiro-backoffice/protocol/openid-connect
${userName}             yam.carrasco@mblabs.com.br
${password}             Pass123123
#${CLIENT_ID}            50c8b493-f03c-403c-9c0c-9a03db91b4e1
${CLIENT_ID}            cb638dc7-0dd4-40cd-bdd1-04de85f84d54


${ADMIN_NAME}    yam
${ADMIN_EMAIL}    yam

*** Test Cases ***
Login
    Login no backoffice
    Rota ME
    Rota de relatórios

Rota Admin
    Filtrar administradores

Criar administrador
    [Documentation]    Teste regressivo de criação de administrador

    Administradores

*** Keywords ***
Login no backoffice
    Create Session  Auth BackOffice  ${base}
    ${headers_auth}=  Create Dictionary  Content-Type  application/x-www-form-urlencoded
    ${payload}=  Set Variable  username=${userName}&password=${password}&grant_type=password&client_id=${CLIENT_ID}
    ${response}=  POST On Session  Auth BackOffice  /token  data=${payload}  headers=${headers_auth}

    Should Be Equal As Strings  ${response.status_code}  200
    ${ACCESS_TOKEN}=  Get From Dictionary  ${response.json()}  access_token
    Set Suite Variable    ${ACCESS_TOKEN}    ${ACCESS_TOKEN}

Rota ME
    Create Session  BackOffice  ${HOST_COIBAN}
    ${HEADERS}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    tenantId=e7422b1f-24e4-4f6d-83c5-ecc0e30d4f2e
    
    ${response}=  GET On Session  BackOffice  /admin/me    headers=${HEADERS}
    Set Suite Variable    ${HEADERS}    ${HEADERS}
    Should Be Equal As Strings  ${response.status_code}  200

Rota de relatórios
    ${params}=    Create Dictionary    page=0    offset=0    orderBy=createdAt    sort=DESC
    ${endpoint}=    Set Variable    /account

    ${response}=  GET On Session  BackOffice  ${endpoint}    headers=${HEADERS}    params=${params}
    Should Be Equal As Strings  ${response.status_code}  200

Administradores
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

    ${response_create_admin}=  POST On Session  BackOffice  /admin    json=${BODY_CREATE_ADMIN}    headers=${HEADERS}
    Should Be Equal As Strings  ${response_create_admin.status_code}  200

    #Verificar administrador criado
    ${params}=    Create Dictionary    page=0    offset=0    orderBy=createdAt    sort=DESC
    ${response}=  GET On Session  BackOffice  /admin    headers=${HEADERS}    params=${params}
    Should Be Equal As Strings  ${response.status_code}  200
        
    ${json}=    Evaluate    json.loads('''${response.content}''')
    ${admin}=    Set Variable    ${json['rows'][0]}
    ${created_admin}=    Run Keyword And Return Status    Should Be Equal As Strings    ${admin['email']}    ${EMAIL}

    IF  ${created_admin}
        ${created_admin_response}=  GET On Session  BackOffice  /admin/${admin['id']}    headers=${HEADERS}
        Should Be Equal As Strings  ${created_admin_response.status_code}  200

        ${created_admin_email}=    Get From Dictionary    ${created_admin_response.json()}    email
        Run Keyword If    '${created_admin_email}' == '${EMAIL}'
        ...    Editar administrador Multitentati    ${admin['id']}
    END

Editar administrador Multitentati
    [Arguments]    ${id}

    ${EMAIL}=    FakerLibrary.Email
    ${NAME}=    FakerLibrary.Name
    # Id do grupo de permissões ADMIN e Operador de Fundo
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

    ${edit_admin_response}=    PUT On Session    BackOffice    /Admin/${id}    json=${BODY_EDIT_ADMIN}    headers=${HEADERS}
    Should Be Equal As Strings  ${edit_admin_response.status_code}  200

    #Verificar administrador editado
    ${params}=    Create Dictionary    page=0    offset=0    orderBy=createdAt    sort=DESC
    ${get_admins_response}=  GET On Session  BackOffice  /admin    headers=${HEADERS}    params=${params}
    Should Be Equal As Strings  ${get_admins_response.status_code}  200

    ${json}=    Evaluate    json.loads('''${get_admins_response.content}''')
    ${admin}=    Set Variable    ${json['rows'][0]}
    ${edited_admin_email}=    Run Keyword And Return Status    Should Be Equal As Strings    ${admin['email']}    ${EMAIL}

    IF  ${edited_admin_email}
        # Excluir
        Excluir administrador Multitentati    ${id}    ${EMAIL}
    END

Excluir administrador Multitentati
    [Arguments]    ${id}    ${email}

    ${delete_admin_response}=    DELETE On Session    BackOffice    /Admin/${id}    headers=${HEADERS}
    Should Be Equal As Strings  ${delete_admin_response.status_code}  204

    # Verificar se o administrador foi excluído
    ${params}=    Create Dictionary    page=0    offset=0    orderBy=createdAt    sort=DESC
    ${get_admins_response}=  GET On Session  BackOffice  /admin    headers=${HEADERS}    params=${params}
    Should Be Equal As Strings  ${get_admins_response.status_code}  200

    ${json}=    Evaluate    json.loads('''${get_admins_response.content}''')
    ${admin}=    Set Variable    ${json['rows'][0]}

    ${deleted_admin_email}=    Run Keyword And Return Status   Should Not Be Equal As Strings    ${admin['email']}    ${email}
    Run Keyword If    '${deleted_admin_email}' == 'False'    Fatal Error    ADMIN NÃO EXCLUÍDO

Filtrar administradores    
    # NOME
    ${params}=    Create Dictionary    page=0    name=${ADMIN_NAME}    offset=0    orderBy=createdAt    sort=DESC
    ${get_admins_response}=  GET On Session  BackOffice  /admin    headers=${HEADERS}    params=${params}
    Should Be Equal As Strings  ${get_admins_response.status_code}  200

    ${json}=    Evaluate    json.loads('''${get_admins_response.content}''')
    ${admin}=    Set Variable    ${json['rows'][0]}
    Should Contain    ${admin['name'].lower()}    ${ADMIN_NAME.lower()}
    Set Suite Variable    ${ADMIN}    ${ADMIN}

    Filtrar admin por email

    Filtrar admin por data

    Filtrar por nome e email

    Filtrar admin por nome e data

    Filtrar admin por email e data

Filtrar admin por email
    ${params}=    Create Dictionary    page=0    email=${ADMIN_EMAIL}    offset=0    orderBy=createdAt    sort=DESC
    ${get_admins_response}=  GET On Session  BackOffice  /admin    headers=${headers}    params=${params}
    Should Be Equal As Strings  ${get_admins_response.status_code}  200

    ${json}=    Evaluate    json.loads('''${get_admins_response.content}''')
    ${result}=    Set Variable    ${json['rows'][0]}
    Should Contain    ${result['email'].lower()}    ${ADMIN_EMAIL.lower()}

Filtrar admin por data
    ${init_date}    Set Variable    ${ADMIN['createdAt']}
    ${end_date}    Get Current Date    result_format=%Y-%m-%dT%H:%M:%S.%fZ
    ${admin_creation_date}    Convert To String    ${init_date},${end_date}
    
    ${params}=    Create Dictionary    page=0    dateRange=${admin_creation_date}    offset=0    orderBy=createdAt    sort=DESC
    ${get_admins_response}=  GET On Session  BackOffice  /admin    headers=${headers}    params=${params}
    Should Be Equal As Strings  ${get_admins_response.status_code}  200

    ${json}=    Evaluate    json.loads('''${get_admins_response.content}''')
    ${result}=    Set Variable    ${json['rows'][0]}

    Run Keyword If    '${result['createdAt']}' >= '${init_date}' and '${result['createdAt']}' <= '${end_date}'
    ...    Log    A data está dentro do intervalo
    ...    ELSE
    ...    Fatal Error    A data não está dentro do intervalo

Filtrar por nome e email
    ${params}=    Create Dictionary    page=0    name=${ADMIN_NAME}    email=${ADMIN_EMAIL}    offset=0    orderBy=createdAt    sort=DESC
    ${get_admins_response}=  GET On Session  BackOffice  /admin    headers=${headers}    params=${params}
    Should Be Equal As Strings  ${get_admins_response.status_code}  200

    ${json}=    Evaluate    json.loads('''${get_admins_response.content}''')
    ${result}=    Set Variable    ${json['rows'][0]}
    Should Contain    ${result['name'].lower()}    ${ADMIN_NAME.lower()}
    Should Contain    ${result['email'].lower()}    ${ADMIN_EMAIL.lower()}

Filtrar admin por nome e data
    ${init_date}    Set Variable    ${ADMIN['createdAt']}
    ${end_date}    Get Current Date    result_format=%Y-%m-%dT%H:%M:%S.%fZ
    ${admin_creation_date}    Set Variable    ${init_date},${end_date}

    ${params}=    Create Dictionary    page=0    name=${ADMIN_NAME}    dateRange=${admin_creation_date}    offset=0    orderBy=createdAt    sort=DESC
    ${get_admins_response}=  GET On Session  BackOffice  /admin    headers=${headers}    params=${params}
    Should Be Equal As Strings  ${get_admins_response.status_code}  200

    ${json}=    Evaluate    json.loads('''${get_admins_response.content}''')
    ${result}=    Set Variable    ${json['rows'][0]}
    Should Contain    ${result['name'].lower()}    ${ADMIN_NAME.lower()}

    Run Keyword If    '${result['createdAt']}' >= '${init_date}' and '${result['createdAt']}' <= '${end_date}'
    ...    Log    A data está dentro do intervalo
    ...    ELSE
    ...    Fatal Error    A data não está dentro do intervalo

Filtrar admin por email e data
    ${init_date}    Set Variable    ${ADMIN['createdAt']}
    ${end_date}    Get Current Date    result_format=%Y-%m-%dT%H:%M:%S.%fZ
    ${admin_creation_date}    Convert To String    ${init_date},${end_date}
    
    ${params}=    Create Dictionary    page=0    email=${ADMIN_EMAIL}    dateRange=${admin_creation_date}    offset=0    orderBy=createdAt    sort=DESC
    ${get_admins_response}=  GET On Session  BackOffice  /admin    headers=${headers}    params=${params}
    Should Be Equal As Strings  ${get_admins_response.status_code}  200

    ${json}=    Evaluate    json.loads('''${get_admins_response.content}''')
    ${result}=    Set Variable    ${json['rows'][0]}
    Should Contain    ${result['email'].lower()}    ${ADMIN_EMAIL.lower()}

    Run Keyword If    '${result['createdAt']}' >= '${init_date}' and '${result['createdAt']}' <= '${end_date}'
    ...    Log    A data está dentro do intervalo
    ...    ELSE
    ...    Fatal Error    A data não está dentro do intervalo