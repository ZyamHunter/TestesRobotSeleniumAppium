*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         FakerLibrary    locale=pt_BR


*** Variables ***
${HOST_ALFA}          https://app-api.bankeiro.coiban.com.br
${SESSION_NAME}       Criação de conta
${DEVICE_ID}          8a6649c5-3400-4f55-9942-19578ee7a442
${CELLPHONE}          89981242943

${ALIAS}   API_serverest

${APP_COIBAN}    https://auth.bankeiro.coiban.com.br/auth/realms/bankeiro-app/protocol/openid-connect

${username}    messias
${password}    Pass123123

${1}    refresh_token
${2}    31d1f52c-9954-4514-86e0-d3368b6c17e7
${3}    
${USER_PHOTO}         C:\\Users\\yamfo\\Downloads\\CPF 80525582045.png
${USER_DOCUMENT}     C:\\Users\\yamfo\\Downloads\\CPF 80525582045.png

*** Test Cases ***
Criar conta
    Create Session  ${SESSION_NAME}  ${HOST_ALFA}

    Rota settings    ${SESSION_NAME}
    Rota email    ${SESSION_NAME}
    Rota documentos    ${SESSION_NAME}
    Rota telefone    ${SESSION_NAME}
    Rota dispositivo    ${SESSION_NAME}
    Rota token    ${SESSION_NAME}
    Rota login    ${SESSION_NAME}
    Rota criar conta    ${SESSION_NAME}

Exemplo de Requisição POST com Autenticação Básica
    # Configurações iniciais
    Create Session  exemplo  https://exemplo.com/api
    ${username}=  Set Variable  meu_usuario
    ${password}=  Set Variable  minha_senha
    ${auth}=  Create List  ${username}  ${password}
    ${headers}=  Create Dictionary  Content-Type  application/json
    ${payload}=  Create Dictionary  name  meu_nome  email  meu_email
    
    # Faz a requisição POST com autenticação básica
    ${response}=  POST On Session  exemplo  /users  json=${payload}  auth=${auth}  headers=${headers}

    # Verifica o código de resposta e a mensagem de retorno
    Should Be Equal As Strings  ${response.status_code}  201
    ${response_json}=  Set Variable  ${response.json()}
    Should Be Equal As Strings  ${response_json['message']}  User created successfully!

Exemplo de Requisição POST com Dados Dinâmicos
    # Configurações iniciais
    Create Session  exemplo  https://exemplo.com/api
    ${headers}=  Create Dictionary  Content-Type  application/json
    ${data}=  Create Dictionary
    
    # Define o conjunto de dados de entrada
    ${inputs}=  Create Dictionary  name=meu_nome  email=meu_email  age=25  gender=male

    # Adiciona os dados de entrada ao dicionário "data"
    ${data}=  Set Variable  ${data}.$update(${inputs})

    # Faz a requisição POST com os dados dinâmicos
    ${response}=  POST On Session  exemplo  /users  json=${data}  headers=${headers}

    # Verifica o código de resposta e a mensagem de retorno
    Should Be Equal As Strings  ${response.status_code}  201
    ${response_json}=  Set Variable  ${response.json()}
    Should Be Equal As Strings  ${response_json['message']}  User created successfully!

Enviar
    ${endpoint}  Set Variable    https://hooks.slack.com/services/T06JRN0TA/B04SYV89HKR

    #${report_path}    Set Variable    C:\\Users\\yamfo\\Downloads\\A.pdf
    #${data}    Create Dictionary    file=@${report_path}
    ${headers}    Create Dictionary    Content-type=application/json
    ${json_data}    Create Dictionary    text=Teste automatizado usando robot!!!

    Create Session    OII    ${endpoint}
    ${response}    POST On Session    OII    /Y0i5tEuLhsZctaM1XgT0uR4k    headers=${headers}    json=${json_data}
    Should Be Equal As Strings    ${response.status_code}    200


*** Keywords ***
Rota settings
    [Arguments]    ${session}

    ${response}=    GET On Session    ${session}    /onboarding/settings
    Should Be Equal As Strings  ${response.status_code}  200

Rota documentos
    [Arguments]    ${session}
    ${CPF}    FakerLibrary.Cpf
    Set Suite Variable    ${CPF}    ${CPF}

    ${response}=    GET On Session    ${session}    /onboarding/validate-document?value    params=value=${CPF}
    Should Be Equal As Strings  ${response.status_code}  200

Rota email
    [Arguments]    ${session}

    ${response}=    GET On Session    ${session}    /onboarding/validate-email?value    params=value=yam.carrasco@mblabs.com.br
    Should Be Equal As Strings  ${response.status_code}  200

Rota telefone
    [Arguments]    ${session}

    ${response}=    GET On Session    ${session}    /onboarding/validate-cellphone?value    params=value=${CELLPHONE}
    Should Be Equal As Strings  ${response.status_code}  200

Rota dispositivo
    [Arguments]    ${session}

    ${OBJECT}=    Create Dictionary
    ...    deviceId=${DEVICE_ID}
    ...    cellphone=55${CELLPHONE}
    ...    deviceType=0
    ...    model=Chrome
    ...    manufacturer=
    ...    carrier=

    &{BODY}=    Create Dictionary
    ...    deviceInfo=${OBJECT}
    ...    publickKey=""
    ...    sendEmail=false

    ${response}=  POST On Session  ${session}  /onboarding/register-device  json=${BODY}
    Should Be Equal As Strings  ${response.status_code}  204

Rota token
    [Arguments]    ${session}

    ${BODY_TOKEN}=    Create Dictionary
    ...    code=112233
    ...    cellphone=55${CELLPHONE}

    ${HEADERS}=    Create Dictionary
    ...    device-id=${DEVICE_ID}

    ${response}=  POST On Session  ${session}  /onboarding/validate-token  json=${BODY_TOKEN}    headers=${HEADERS}
    Should Be Equal As Strings  ${response.status_code}  204

Rota login
    [Arguments]    ${session}

    ${response}=  GET On Session  ${session}  /onboarding/validate-login?value    params=value=T${CPF}
    Should Be Equal As Strings  ${response.status_code}  200

Rota criar conta
    [Arguments]    ${session}
    ${NAME}    FakerLibrary.Name

    ${settings}=    Create List

    ${BODY_CA_ACCOUNT}=    Create Dictionary
    ...    termsOfUse=https://bankeiro-coibank-prod-public.s3.sa-east-1.amazonaws.com/templates/Termo+de+Uso.html
    ...    privacyPolicy=https://bankeiro-coibank-prod-public.s3.sa-east-1.amazonaws.com/templates/Poll%C3%ADtica+de+Privacidade.html
    ...    type=1
    ...    name=${NAME}
    ...    taxIdentifier=${CPF}
    ...    email=yam.carrasco@mblabs.com.br
    ...    cellphone=55${CELLPHONE}
    ...    bornAt=22/04/2000
    ...    motherName=Maria Rita de Sousa
    ...    groupType=null
    ...    settings=${settings}

    ${BODY_CA}=    Create Dictionary
    ...    login=T${CPF}
    ...    password=Pass123123
    ...    name=${NAME}
    ...    cellphone=55${CELLPHONE}
    ...    account=${BODY_CA_ACCOUNT}

    ${HEADERS}=    Create Dictionary    Content-Type  application/json
    ...    device-id=${DEVICE_ID}

    ${response}=  POST On Session  ${session}  /v2/onboarding/create-account    headers=${HEADERS}  json=${BODY_CA}    
    Should Be Equal As Strings  ${response.status_code}  200

    Create Session    TOKEN    ${APP_COIBAN}
    ${headers1}=  Create Dictionary  Content-Type  application/x-www-form-urlencoded
    ${payload}=  Set Variable  username=T${CPF}&password=Pass123123&grant_type=password&client_id=31d1f52c-9954-4514-86e0-d3368b6c17e7
    ${response_token}=    POST On Session    TOKEN    /token    data=${payload}    headers=${headers1}

    Should Be Equal As Strings  ${response_token.status_code}  200
    ${access_token}=  Get From Dictionary  ${response_token.json()}  access_token

    ${HEADERS_TOKEN}=    Create Dictionary
    ...    Authorization=Bearer ${access_token}
    ...    device-id=${DEVICE_ID}

    ${ADDRESS_BODY}=    Create Dictionary
    ...    addressNumber=566
    ...    alias=Casa
    ...    city=Picos
    ...    complement=Portão Prata
    ...    country=BR
    ...    neighborhood=Canto da Varzea
    ...    state=PI
    ...    street=Rua Emir Maia Martins
    ...    zipCode=64600174

    # Endereço
    ${address_response}=    POST On Session    ${session}    /v2/onboarding/address    data=${ADDRESS_BODY}    headers=${HEADERS_TOKEN}
    Should Be Equal As Strings  ${address_response.status_code}  200

    #############################################################################################
    ${params_self}=    Create Dictionary    extension=png    type=4
    ${get_document_url}    GET On Session    ${session}    /onboarding/document-url    params=${params_self}    headers=${HEADERS_TOKEN}
    Should Be Equal As Strings  ${get_document_url.status_code}  200

    ${json}=    Evaluate    json.loads('''${get_document_url.content}''')
    ${bucket_self}=    Set Variable    ${json['bucket']}
    ${url_self}    Set Variable    ${json['url']}

    ${put_self}    PUT    ${url_self}

    #### Save self
    ${documentFrontSelf}    Create Dictionary
    ...    bucket=${bucket_self}
    ...    type=4

    ${payload_self}    Create Dictionary
    ...    documentFront=${documentFrontSelf}

    ${self_response}=    PUT On Session    ${session}    /onboarding/v2/save-document    json=${payload_self}    headers=${HEADERS_TOKEN}
    Should Be Equal As Strings  ${self_response.status_code}  200

    #### CNH
    ${params_cnh}=    Create Dictionary    extension=png    type=3
    ${get_document_url2}    GET On Session    ${session}    /onboarding/document-url    params=${params_cnh}    headers=${HEADERS_TOKEN}
    Should Be Equal As Strings  ${get_document_url2.status_code}  200

    ${json_cnh}=    Evaluate    json.loads('''${get_document_url2.content}''')
    ${bucket_document}=    Set Variable    ${json_cnh['bucket']}
    ${url_document}    Set Variable    ${json_cnh['url']}

    ${put_document}    PUT    ${url_document}    


    ${documentFronTCNH}    Create Dictionary
    ...    bucket=${bucket_document}
    ...    type=3

    ${payload_cnh}    Create Dictionary
    ...    documentFront=${documentFronTCNH}

    ${self_response}=    PUT On Session    ${session}    /onboarding/v2/save-document    json=${payload_cnh}    headers=${HEADERS_TOKEN}
    Should Be Equal As Strings  ${self_response.status_code}  200

    ################################################################################################
    # PIN
    ${BODY_PIN}    Create Dictionary
    ...    token=124578
    ...    type=2

    ${pin_response}=    POST On Session    ${session}    /onboarding/pin    json=${BODY_PIN}    headers=${HEADERS_TOKEN}
    Should Be Equal As Strings  ${pin_response.status_code}  204

Rota ME
    [Arguments]    ${SESSION}    ${ACCESS_TOKEN}
    ${H_TOKEN}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    device-id=${DEVICE_ID}

    # Rota ME
    ${response5}=  GET On Session  ${SESSION}  /user/me  headers=${H_TOKEN}
