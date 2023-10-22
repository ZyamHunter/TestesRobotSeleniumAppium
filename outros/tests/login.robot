*** Settings ***
Resource         home.robot

Test Setup       Iniciar sessão
Test Teardown    Encerra sessão

*** Test Cases ***
Login com sucesso
    [Tags]                            login_sucesso
    Preencher Login                   Matheus123    Pass123123

    Sleep                             5s

    Verificar Login                   https://ibk.beta.bankeiro.com/solicitar-sms

    Confirmar sms 1° login            112233

    Sleep                             2s

    Pagina Inicial                    https://ibk.beta.bankeiro.com/inicio

Login inválido
    Preencher Login                   ""        ""

    Wait Until Page Contains Element    //div[@class="ant-message-custom-content ant-message-error"]

    Verificar Login                   https://ibk.beta.bankeiro.com/

    Sleep                             2s

*** Keywords ***
Preencher Login
    [Arguments]                       ${userName}       ${pass}

    Wait Until Page Contains Element    //*[@id="root"]/div/div/div[2]/div[2]/div/div/form/div/div/div[2]/div[1]/div/div/div/div/input

    Input Text                        //*[@id="root"]/div/div/div[2]/div[2]/div/div/form/div/div/div[2]/div[1]/div/div/div/div/input    ${userName}
    Input Text                        //*[@id="root"]/div/div/div[2]/div[2]/div/div/form/div/div/div[2]/div[2]/div/div/div/div/input    ${pass}
    Click Element                     //*[@id="root"]/div/div/div[2]/div[2]/div/div/form/div/div/div[2]/div[3]/div/div/button

Verificar Login
    [Arguments]                       ${url_access}

    ${url_login}=                     Get Location    
    Should Contain                    ${url_login}    ${url_access}

Confirmar sms 1° login
    [Arguments]                       ${codigo}

    Wait Until Page Contains Element    //*[@id="root"]/div/div/div/div[2]/div/div/div/div/div/input

    Input Text                        //*[@id="root"]/div/div/div/div[2]/div/div/div/div/div/input        ${codigo}
    Click Element                     //*[@id="root"]/div/div/div/div[3]/div[1]/div/button

Pagina Inicial
    [Arguments]                       ${url_access}

    Wait Until Page Contains Element      //*[@id="root"]/div/div/div[2]/div/div/div/div/div[1]/div[1]/div/div[1]/p
    Wait Until Page Does Not Contain Element    //*[@id="root"]/div/div/div[2]/div[1]/div/img

    ${url_home}=                      Get Location
    Should Contain                    ${url_home}    ${url_access}


