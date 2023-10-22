*** Settings ***
Resource         home.robot

*** Test Cases ***
Login com sucesso
    [Tags]                            login_sucesso

    Iniciar sessão

    Preencher Login                   yam.carrasco@mblabs.com.br    Pass123123
    Aguardar load da página

Botão Parcerias

    Click Element    //*[@id="root"]/div/div/div/div[1]/div/div[2]/div/div/div[15]/div/div/a/span
    Aguardar load da página

Paginação

    Click Element    //button[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit" and @title="Próxima página"]
    Aguardar load da página
    Click Element    //button[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit" and @title="Página anterior"]
    Aguardar load da página

Adicionar parceiro

    Click Element    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary" and @type="button"]
    Aguardar load da página

Botão cancelar

    Click Element    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary"]
    Aguardar load da página

Adicionar parceiro

    Click Element    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary" and @type="button"]
    Aguardar load da página

Nome do parceiro adicionado

    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input"]    SKY TV

Link do parceiro adicionado

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[2]/view/div/div/div/input    https://skysky.com.br/index.php

Data inicial adicionada

    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiOutlinedInput-inputAdornedEnd"]    10/12/2022
    Sleep    1s

Data final adicionada

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[2]/div[2]/div/div/div/input    12/02/2023
    Sleep    1s

Descrição adicionada

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[3]/div[1]/div/div/div/input    Empresa Sky TV

Frase promocional adicionada

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[3]/div[2]/div/div/div/input    Venha ser sky e voe pelo mundo de sua casa sem sair do lugar!

Categoria adicionada

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[4]/div[1]/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[5]

Banner adicionada

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[4]/div[2]/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[6]

Botão salvar ao adicionar

    Click Element    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary"]
    Aguardar load da página
    Verificar notificação erro
    Verificar notificação de sucesso

Filtros

    Click Element                    //*[@id="panel1a-header"]

Filtrar por nome

    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input"]    SKY TV
    Click Element    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary" and @type="submit"]
    Aguardar load da página
    Verificar notificação erro
    Click Element    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary" and @type="button"]
    Aguardar load da página
    Verificar notificação erro

Detalhes do parceiro

    Click Element    //div[@class="users__details"]
    Aguardar load da página

Nome do parceiro editado
    
    Press Keys    //input[@class="MuiInputBase-input MuiOutlinedInput-input"]    HOME    SHIFT+END+BACKSPACE
    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input"]    SKY TV

Link do parceiro editado

    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[2]/view/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[2]/view/div/div/div/input    https://skysky.com.br/index.php

Data inicial editado

    Press Keys    //input[@class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiOutlinedInput-inputAdornedEnd"]    HOME    SHIFT+END+BACKSPACE
    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiOutlinedInput-inputAdornedEnd"]    002/11/2022
    Sleep    1s

Data final editado

    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[2]/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[2]/div[2]/div/div/div/input    008/04/2023
    Sleep    1s

Descrição editado

    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[3]/div[1]/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[3]/div[1]/div/div/div/input    Empresa Sky TV

Frase promocional editado

    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[3]/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[3]/div[2]/div/div/div/input    Venha ser sky e voe pelo mundo de sua casa sem sair do lugar!

Categoria editado

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[4]/div[1]/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[5]

Banner editado

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[4]/div[2]/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[6]

Botão salvar ao editar

    Click Element    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary"]
    Aguardar load da página
    Verificar notificação erro
    Verificar notificação de sucesso




*** Keywords ***

Aguardar load da página

    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]

Preencher Login
    [Arguments]                       ${uname}       ${pass}

    Wait Until Page Contains Element    //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[1]/div/div/img

    Input Text                        //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[3]/div/div/div/div/input    ${uname}
    Input Text                        //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[4]/div/div/div/div/input    ${pass}
    Click Element                     //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[5]/div/div/div/button

Verificar notificação erro

    Page Should Not Contain Element    //div[@class="ant-message-custom-content ant-message-error"]

Verificar notificação de sucesso

    Page Should Contain Element        //div[@class="ant-message-custom-content ant-message-success"]

