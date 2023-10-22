*** Settings ***
Resource         home.robot

*** Variables ***
## No Windows coloque barra dupla assim como mostra o exemplo abaixo!
${FILE}         C:\\Users\\yamfo\\Downloads\\pre-aprovado.csv

*** Test Cases ***
Login com sucesso
    [Tags]                            login_sucesso

    Iniciar sessão

    Preencher Login                   yam.carrasco@mblabs.com.br    Pass123123

    Pagina Inicial

Botão pre-aprovado
    [Tags]                            button_existis

    Click Element                     //*[@id="root"]/div/div/div/div[1]/div/div[2]/div/div/div[10]/div/div[2]
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