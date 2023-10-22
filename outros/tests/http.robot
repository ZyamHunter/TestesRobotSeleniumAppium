*** Settings ***
Library         ./Get_Tests_Status.py
Library         RequestsLibrary
Library         Collections

*** Test Cases ***
Teste
    ${path}    Set Variable    report\\output.xml
    ${msg}    Get Test Status    ${path}
    Curl    ${msg}

*** Keywords ***
Curl
    [Arguments]    ${msg}
    ${endpoint}  Set Variable    https://hooks.slack.com/services/T06JRN0TA/B04SYV89HKR
    ${headers}  Create Dictionary    Content-type=application/json
    ${json_data}  Create Dictionary    text=${msg}

    Create Session  Slack  ${endpoint}
    ${response}  POST On Session  Slack  /Y0i5tEuLhsZctaM1XgT0uR4k  headers=${headers}  json=${json_data}
    Should Be Equal As Strings  ${response.status_code}  200

