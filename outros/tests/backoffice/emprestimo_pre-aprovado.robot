*** Settings ***
Resource         home.robot

*** Variables ***
## No Windows coloque barra dupla assim como mostra o exemplo abaixo!
${FILE}         C:\\Users\\yamfo\\Downloads\\Pre.csv

*** Test Cases ***
Login com sucesso
    [Tags]                            login_sucesso

    #Set Selenium Speed    1 second

    Iniciar sessão

    Preencher Login                   yam.carrasco@mblabs.com.br    Pass123123

    Pagina Inicial

Botão pre-aprovado
    [Tags]                            button_existis

    Scroll Element Into View    xpath=//*[contains(text(), "Empréstimos Pré-aprovados")]
    Click Element                     xpath=//*[contains(text(), "Empréstimos Pré-aprovados")]
    Aguardar load da página

Paginação
    [Tags]                            pagination

    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div[3]/div/div[2]/div/div[2]/button[2]
    Aguardar load da página

    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div[3]/div/div[2]/div/div[2]/button[1]
    Aguardar load da página

Filtro por data
    [Tags]                           filter_data

    Click Element                    //*[@id="panel1a-header"]
    Click Element                    //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div

    Sleep     1s

    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[1]/input    15/10/2022
    Sleep    1s

    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[1]/input    ENTER
    Sleep     1s
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[3]/input    18/10/2022
    Sleep    1s
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[3]/input    ENTER
    
    Botão filtrar
    Sleep    1s
    Verificar notificação de erro
    Aguardar load da página

Filtro por cpf/cnpj
    [Tags]                            filter_cpf/cnpj

    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[1]/div/div/div/div/input    566
    Sleep                             1s
    Botão filtrar
    Sleep                             1s
    Verificar notificação de erro   
    Limpar filtros
    Aguardar load da página

Filtro por status disponível
    [Tags]                            filter_status

    Click Element                     //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/div
    Sleep                             1s
    Click Element                     //*[@id="menu-"]/div[3]/ul/li[1]
    Botão filtrar
    Sleep                             1s
    Verificar notificação de erro
    Aguardar load da página

Filtro por status aceito

    Click Element                     //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/div
    Sleep    1s
    Click Element                     //*[@id="menu-"]/div[3]/ul/li[2]
    Botão filtrar
    Sleep                             1s
    Verificar notificação de erro
    Aguardar load da página

Filtro por status recusado

    Click Element                     //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/div
    Sleep                             1s
    Click Element                     //*[@id="menu-"]/div[3]/ul/li[3]
    Botão filtrar
    Sleep                             2s
    Verificar notificação de erro
    Aguardar load da página
    Limpar filtros
    Aguardar load da página

Enviar via CSV

    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/button

    Sleep                            1s

    Click Element                    //*[@id="rc_unique_0"]

    Choose File     id:upload-file-modal__upload-input     ${FILE}

    Aguardar load da página
    
    Sleep            2s

    Click Element    xpath:/html/body/div[4]/div/div[2]/div/div[2]/div[3]/div/div[2]/button

    Aguardar load da página
    Verificar notificação de sucesso

Detalhes do pre-aprovado
    [Tags]                            see_details

    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[12]
    Encerra sessão

*** Keywords ***
Preencher Login
    [Arguments]                       ${uname}       ${pass}

    Wait Until Page Contains Element    //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[1]/div/div/img

    Input Text                        //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[3]/div/div/div/div/input    ${uname}
    Input Text                        //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[4]/div/div/div/div/input    ${pass}
    Click Element                     //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[5]/div/div/div/button

Pagina Inicial

    Wait Until Page Contains Element      //*[@id="root"]/div/div/div/div[1]/div/div[1]/div/a/img
    Wait Until Page Does Not Contain Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/img

Aguardar load da página

    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]

Botão filtrar

    Click Element                      //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary"]
Verificar notificação de erro

    Page Should Not Contain Element    //div[@class="ant-message-custom-content ant-message-error"]

Verificar notificação de sucesso

    Page Should Contain Element        //div[@class="ant-message-custom-content ant-message-success"]

Limpar filtros

    Click Button                       //*[@id="panel1a-content"]/div/div/form/div[2]/div[1]/div/button         