*** Settings ***
Library         RequestsLibrary
Library         Collections

*** Test Cases ***
Administradores
    Log    Oi

Logs de usuários
    Log    Oi

Gestão de bancos

*** Keywords ***
Curl
    ${report_path}    Set Variable    C:\\Users\\yamfo\\Downloads\\A.pdf
    ${endpoint}  Set Variable    https://hooks.slack.com/services/T06JRN0TA/B04SYV89HKR
    ${headers}  Create Dictionary    Content-type=application/json
    ${json_data}  Create Dictionary    text=Todos os testes passaram!

    Create Session  Slack  ${endpoint}
    ${response}  POST On Session  Slack  /Y0i5tEuLhsZctaM1XgT0uR4k  headers=${headers}  json=${json_data}
    Should Be Equal As Strings  ${response.status_code}  200

Curl falha
    ${report_path}    Set Variable    C:\\Users\\yamfo\\Downloads\\A.pdf
    ${endpoint}  Set Variable    https://hooks.slack.com/services/T06JRN0TA/B04SYV89HKR
    ${headers}  Create Dictionary    Content-type=application/json
    ${json_data}  Create Dictionary    text=Algum teste falhou!

    Create Session  Slack  ${endpoint}
    ${response}  POST On Session  Slack  /Y0i5tEuLhsZctaM1XgT0uR4k  headers=${headers}  json=${json_data}
    Should Be Equal As Strings  ${response.status_code}  200