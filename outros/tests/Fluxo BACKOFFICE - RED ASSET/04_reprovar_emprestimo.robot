*** Settings ***
Resource         home.robot

*** Test Cases ***
Login com sucesso
    [Tags]                            login_sucesso

    Set Selenium Speed    1 second

    Iniciar sessão

    Preencher Login                   yam.carrasco@mblabs.com.br    Pass123123

    Aguardar load da página

Botão emprestimo
    [Tags]                            button_existis

    Click Element                     //*[@id="root"]/div/div/div/div[1]/div/div[2]/div/div/div[10]/div/div[1]/a/span
    Aguardar load da página

Filtros

    Click Element                    //*[@id="panel1a-header"]

Filtrar por status em análise

    Click Element        //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    Click Element        //*[@id="menu-"]/div[3]/ul/li[2]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro

Detalhes do emprestimo

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[9]
    Aguardar load da página

Reprovar emprestimo

    ## Botão reprovar
    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[3]/div[2]/button
    Sleep    1s
    ## Botão confirmar
    Click Element    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div[2]/div/button
    Aguardar load da página
    Verificar notificação de sucesso
    Verificar notificação erro

    Close Browser

*** Keywords ***

Preencher Login
    [Arguments]                       ${uname}       ${pass}

    Wait Until Page Contains Element    //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[1]/div/div/img

    Input Text                        //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[3]/div/div/div/div/input    ${uname}
    Input Text                        //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[4]/div/div/div/div/input    ${pass}
    Click Element                     //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[5]/div/div/div/button

Aguardar load da página

    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]
                   
Verificar notificação erro

    Page Should Not Contain Element    //div[@class="ant-message-custom-content ant-message-error"]

Verificar notificação de sucesso

    Page Should Contain Element        //div[@class="ant-message-custom-content ant-message-success"]

Botão filtrar

    Click Element                     //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary" and @type="submit"]
