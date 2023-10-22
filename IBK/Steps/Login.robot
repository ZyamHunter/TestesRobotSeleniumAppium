*** Settings ***
Library         SeleniumLibrary    timeout=20s

*** Variables ***
${BROWSER}                              chrome

${LOGO_IMAGE}                           xpath: //*[@testid="home_Logo"]

${FIELD_USER}                           xpath: //*[@testid="login_AdvancedInput_username"]
${FIELD_PASSWORD}                       xpath: //*[@testid="login_AdvancedInput_password"]
${FIELD_CODE}                           xpath: //*[@testid="request-sms_SmsCode_code"]
${BUTTON_CONFIRM_SMS}                   xpath: //*[@testid="request-sms_SmsCode_Submit"]
${ENTER_BUTTON}                         xpath: //*[@testid="login_Button_Submit"]

*** Keywords ***
Abrir navegador
    Open Browser    ${IBK}    ${BROWSER} 
    Maximize Browser Window

Preencher campo usuário
    Wait Until Element Is Visible     ${FIELD_USER}
    Input Text                        ${FIELD_USER}    ${USER_LOGIN}

Preencher campo senha
    Input Text                        ${FIELD_PASSWORD}    ${USER_PASSWORD}

Clicar no botão entrar (Login)
    Click Button                      ${ENTER_BUTTON}

Verificar login
    Wait Until Element Is Visible        ${LOGO_IMAGE}    30s

Digitar código (Login)
    Wait Until Element Is Visible     ${FIELD_CODE} 
    Sleep    5s
    Input Text                        ${FIELD_CODE}      ${USER_CODE}
    
Clicar no botão para confirmar sms (Login)
    Wait Until Element Is Visible     ${BUTTON_CONFIRM_SMS}
    Click Element                     ${BUTTON_CONFIRM_SMS}