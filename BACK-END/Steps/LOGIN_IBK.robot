*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         FakerLibrary    locale=pt_BR


*** Variables ***
${HOST_APP}          https://app-api.bankeiro.coiban.com.br
${DEVICE_ID}          8a6649c5-3400-4f55-9942-19578ee7a442
${CELLPHONE}          11997833936

${BASE_URL}    https://auth.bankeiro.coiban.com.br/auth/realms/bankeiro-app/protocol/openid-connect

${USER_NAME}    messias
${pASSWORD}    Pass123123
${GRANT_TYPE}    password
${CLIENT_ID}    31d1f52c-9954-4514-86e0-d3368b6c17e7

${1}    refresh_token
${2}    31d1f52c-9954-4514-86e0-d3368b6c17e7
${3}    

*** Test Cases ***
Login bem sucedido
    # Configurações iniciais
    Create Session  Auth  ${BASE_URL}
    ${headers1}=  Create Dictionary  Content-Type  application/x-www-form-urlencoded
    ${payload}=  Set Variable  username=messias&password=Pass123123&grant_type=password&client_id=31d1f52c-9954-4514-86e0-d3368b6c17e7
    ${response}=  POST On Session  Auth  /token  data=${payload}  headers=${headers1}

    # Verifica o código de resposta e a mensagem de retorno
    Should Be Equal As Strings  ${response.status_code}  200
    ${access_token1}=  Get From Dictionary  ${response.json()}  access_token
    ${refresh_token1}=    Get From Dictionary    ${response.json()}  refresh_token  

    ${HEADERS}=    Create Dictionary
    ...    Authorization=Bearer ${access_token1}
    ...    device-id=${DEVICE_ID}

    ${OBJECT}=    Create Dictionary
    ...    deviceId=${DEVICE_ID}
    ...    appVersion=1.1.0
    ...    deviceOSVersion=10
    ...    model=Edge
    ...    plataform=Windows

    &{BODY}=    Create Dictionary
    ...    deviceInfo=${OBJECT}
    ...    publickKey=LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUFvaU9Wek9QdXNoc0FidE9yZ2ZXNQplSEgxd3Y5dFlBNUF2RlNiRWM4eEZTRDZEUjg2S0hGem0xR1BaMHR5TVNaKzBuVi9HVWx5Z0xhSFRoQ1JKblpMCk9NK2RNQnVSczhOSkhCWlBUU2F2eElvK2g5YzVPSnlWM2cvMmpUREczRlFkL21qYVd4Rk5JT1BmakVJbklraXIKVGhzdmp6Y1p5MWdvVHY0OC9jdWVaaDVRUTVLVForTlgrWURPVWhha1hHNGhTZXRTeW1KUjMvTkpKVmxzM3B1UgpMT2sxY3JlN1hQdmxnZDRoTGJKWk9oeFlaR1NyeGFZWExSYWpGS2lFVjFtWC9OcmtDR1I1UEx2UU9RaFlEQjdrCmlXOTRwclljcFAyeGUzcDhGN1BzVWdPcWN6M21Rb0V0ZjBPYVhaUzl5ODk3SG1xN2hKY3dqMDIrUHR6bEdrZEcKT1FJREFRQUIKLS0tLS1FTkQgUFVCTElDIEtFWS0tLS0t
    ...    sendEmail=false

    Create Session    APP    ${HOST_APP}
    #Run Keyword And Ignore Error      Rota ME    APP    ${access_token1}

    ${response3}=  POST On Session  APP  /v2/device/register-device  json=${BODY}  headers=${HEADERS}

    # Token
    #${data}=    Set Variable    grant_type=${1}&client_id=${2}&refresh_token=${refresh_token1}
    #${response4}=  POST On Session  Auth  /token  data=${data}  headers=${headers1}

    #${access_token2}=  Get From Dictionary  ${response4.json()}  access_token
    #${refresh_token2}=    Get From Dictionary    ${response4.json()}  refresh_token

    ${H_TOKEN}=    Create Dictionary
    ...    Authorization=Bearer ${access_token1}
    ...    device-id=${DEVICE_ID}

    ${H_BODY}=    Create Dictionary
    ...    token=112233

    ${rrs}=    POST On Session  APP  /device/validate-token  data=${H_BODY}  headers=${H_TOKEN}

    # Rota ME
    ${response5}=  GET On Session  APP  /user/me  headers=${H_TOKEN}

    ${H_HOME}=    Create Dictionary
    ...    Authorization=Bearer ${access_token1}
    ...    device-id=${DEVICE_ID}
    ...    payment-account-id=ba76ad7b-f890-47a9-b79d-a6c48696abaf

    # Rota Home
    ${response6}=  GET On Session  APP  /v3/home  headers=${H_HOME}

    # Rota transferir
    ${response7}=  GET On Session  APP  /favored-contact  headers=${H_HOME}

    ${response8}=  GET On Session  APP  /settings/remote-config  headers=${H_HOME}

    ${response9}=  GET On Session  APP  /bank  headers=${H_HOME}

Primeiro Login
    # Configurações iniciais
    Create Session  Auth  ${BASE_URL}
    ${headers1}=  Create Dictionary  Content-Type  application/x-www-form-urlencoded
    ${payload}=  Set Variable  username=messias&password=Pass123123&grant_type=password&client_id=31d1f52c-9954-4514-86e0-d3368b6c17e7
    ${response}=  POST On Session  Auth  /token  data=${payload}  headers=${headers1}

    # Verifica o código de resposta e a mensagem de retorno
    Should Be Equal As Strings  ${response.status_code}  200
    ${access_token1}=  Get From Dictionary  ${response.json()}  access_token
    ${refresh_token1}=    Get From Dictionary    ${response.json()}  refresh_token  

    ${HEADERS}=    Create Dictionary
    ...    Authorization=Bearer ${access_token1}
    ...    device-id=${DEVICE_ID}

    ${OBJECT}=    Create Dictionary
    ...    deviceId=${DEVICE_ID}
    ...    appVersion=1.1.0
    ...    deviceOSVersion=10
    ...    model=Edge
    ...    plataform=Windows

    &{BODY}=    Create Dictionary
    ...    deviceInfo=${OBJECT}
    ...    publickKey=LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUFvaU9Wek9QdXNoc0FidE9yZ2ZXNQplSEgxd3Y5dFlBNUF2RlNiRWM4eEZTRDZEUjg2S0hGem0xR1BaMHR5TVNaKzBuVi9HVWx5Z0xhSFRoQ1JKblpMCk9NK2RNQnVSczhOSkhCWlBUU2F2eElvK2g5YzVPSnlWM2cvMmpUREczRlFkL21qYVd4Rk5JT1BmakVJbklraXIKVGhzdmp6Y1p5MWdvVHY0OC9jdWVaaDVRUTVLVForTlgrWURPVWhha1hHNGhTZXRTeW1KUjMvTkpKVmxzM3B1UgpMT2sxY3JlN1hQdmxnZDRoTGJKWk9oeFlaR1NyeGFZWExSYWpGS2lFVjFtWC9OcmtDR1I1UEx2UU9RaFlEQjdrCmlXOTRwclljcFAyeGUzcDhGN1BzVWdPcWN6M21Rb0V0ZjBPYVhaUzl5ODk3SG1xN2hKY3dqMDIrUHR6bEdrZEcKT1FJREFRQUIKLS0tLS1FTkQgUFVCTElDIEtFWS0tLS0t
    ...    sendEmail=false

    Create Session    APP    ${HOST_APP}
    Run Keyword And Ignore Error      Rota ME    APP    ${access_token1}

    ${response3}=  POST On Session  APP  /v2/device/register-device  json=${BODY}  headers=${HEADERS}

    # Token
    #${data}=    Set Variable    grant_type=${1}&client_id=${2}&refresh_token=${refresh_token1}
    #${response4}=  POST On Session  Auth  /token  data=${data}  headers=${headers1}

    #${access_token2}=  Get From Dictionary  ${response4.json()}  access_token
    #${refresh_token2}=    Get From Dictionary    ${response4.json()}  refresh_token

    ${H_TOKEN}=    Create Dictionary
    ...    Authorization=Bearer ${access_token1}
    ...    device-id=${DEVICE_ID}

    ${H_BODY}=    Create Dictionary
    ...    token=112233

    ${rrs}=    POST On Session  APP  /device/validate-token  data=${H_BODY}  headers=${H_TOKEN}

    # Rota ME
    ${response5}=  GET On Session  APP  /user/me  headers=${H_TOKEN}

    ${H_HOME}=    Create Dictionary
    ...    Authorization=Bearer ${access_token1}
    ...    device-id=${DEVICE_ID}
    ...    payment-account-id=ba76ad7b-f890-47a9-b79d-a6c48696abaf

    # Rota Home
    ${response6}=  GET On Session  APP  /v3/home  headers=${H_HOME}

    # Rota transferir
    ${response7}=  GET On Session  APP  /favored-contact  headers=${H_HOME}

    ${response8}=  GET On Session  APP  /settings/remote-config  headers=${H_HOME}

    ${response9}=  GET On Session  APP  /bank  headers=${H_HOME}

*** Keywords ***
Rota ME
    [Arguments]    ${SESSION}    ${ACCESS_TOKEN}
    ${H_TOKEN}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    device-id=${DEVICE_ID}

    # Rota ME
    ${response5}=  GET On Session  ${SESSION}  /user/me  headers=${H_TOKEN}