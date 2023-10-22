*** Settings ***
Resource         home.robot

Test Setup       Iniciar sessão
Test Teardown    Encerra sessão

*** Test Cases ***
Login com sucesso
    [Tags]                            login_sucesso

    Preencher Login                   yam.carrasco@mblabs.com.br    Pass123123

    Pagina Inicial

    Verificar Login                   https://admin.beta.bankeiro.com/usuarios/relatorio?page=0

Login inválido
    Preencher Login                   Matheus        kshakjk

    Verificar Login                   https://admin.beta.bankeiro.com/

    Sleep                             2s

*** Keywords ***
Preencher Login
    [Arguments]                       ${uname}       ${pass}

    Wait Until Page Contains Element    //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[1]/div/div/img

    Input Text                        //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[3]/div/div/div/div/input    ${uname}
    Input Text                        //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[4]/div/div/div/div/input    ${pass}
    Click Element                     //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[5]/div/div/div/button

Verificar Login
    [Arguments]                       ${url_access}

    ${url_login}=                     Get Location    
    Should Contain                    ${url_login}    ${url_access}

Pagina Inicial

    Wait Until Page Contains Element      //*[@id="root"]/div/div/div/div[1]/div/div[1]/div/a/img
    Wait Until Page Does Not Contain Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/img