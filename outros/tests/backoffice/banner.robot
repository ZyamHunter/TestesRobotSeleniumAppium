*** Settings ***
Resource         home.robot

*** Variables ***
## No Windows coloque barra dupla assim como mostra o exemplo abaixo!
${IMAGEM}    C:\\Users\\yamfo\\Downloads\\SKYY.jpg

*** Test Cases ***
Login com sucesso
    [Tags]                            login_sucesso

    Iniciar sessão

    #Set Selenium Speed    0.5 seconds

    Preencher Login                   yam.carrasco@mblabs.com.br    Pass123123
    Aguardar load da página

    Sleep    3s

Botão Banner

    Click Element    //*[@id="root"]/div/div/div/div[1]/div/div[2]/div/div/div[6]/div/div[3]/a/span
    Aguardar load da página
    Verificar notificação erro

#Paginação

#Click Element    //button[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit" and @title="Próxima página"]
#Aguardar load da página
#Verificar notificação erro
#Click Element    //button[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit" and @title="Página anterior"]
#Aguardar load da página
#Verificar notificação erro

Filtros
    
    Click Element    //*[@id="panel1a-header"]

Filtrar por tipo com link web

    Click Element    //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    Click Element    //*[@id="menu-"]/div[3]/ul/li[1]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página
    Verificar notificação erro

Filtrar por tipo sem link web

    Click Element    //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    Click Element    //*[@id="menu-"]/div[3]/ul/li[2]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página
    Verificar notificação erro

Filtrar por página home

    Click Element    //*[@id="panel1a-content"]/div/div/form/div[1]/div[4]/div/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[1]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página
    Verificar notificação erro

Filtrar por página parceiro

    Click Element    //*[@id="panel1a-content"]/div/div/form/div[1]/div[4]/div/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[2]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página
    Verificar notificação erro

Filtrar por data

    Click Element                    //div[@class="ant-picker ant-picker-range ant-picker-middle"]

    Sleep     1s

    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[5]/div/div/label/div/div[1]/input    10/09/2022
    Sleep    1s

    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[5]/div/div/label/div/div[1]/input    ENTER
    Sleep     1s
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[5]/div/div/label/div/div[3]/input    30/09/2022
    Sleep    1s
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[5]/div/div/label/div/div[3]/input    ENTER
    
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página
    Verificar notificação erro

Adicionar banner 1

    Click Button    Adicionar
    Aguardar load da página
    Sleep    1s

Cancelar adição de banner

    Click Button    Cancelar
    Aguardar load da página
    Verificar notificação erro

    ## Adicionando novamente
    Click Button    Adicionar
    Aguardar load da página
    Sleep    1s

Adicionar título

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[1]/div/div/div/input    SKY TV

Adicionar descrição

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[2]/div/div/div/input    Empresa Sky TV

Adicionar tipo com link web

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[2]/div[1]/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[1]

Adicionar link

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[2]/div[2]/div/div/div/input    https://skysky.com.br/index.php

Adicionar página home

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[3]/div[1]/div/div/div/div
    Sleep    1s
    Double Click Element    //*[@id="menu-"]/div[3]/ul/li[1]

Adicionar imagem

    Choose File    //input[@class="push-notification-details__csv__label__input"]    ${IMAGEM}
    Aguardar load da página
    Sleep    1s

Adicionar data inicial

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[4]/div[1]/div/div/div/input    20/03/2023

Adicionar data final

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[4]/div[2]/div/div/div/input    12/12/2023

Salvar banner adicionado

    Click Button    Adicionar
    Aguardar load da página
    Verificar notificação de sucesso
    Verificar notificação erro
    Sleep    2s

Filtros

    Click Element    //*[@id="panel1a-header"]

Filtrar por título
    
    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input"]    teste
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página
    Verificar notificação erro

Remover banner

    Click Element    xpath=//div[@class="users__remove"]
    Aguardar load da página
    #Verificar notificação de sucesso
    #Verificar notificação erro

Adicionar banner 2

    Click Button    Adicionar
    Aguardar load da página
    Sleep    1s

Adicionar título

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[1]/div/div/div/input    SKY TV

Adicionar descrição

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[2]/div/div/div/input    Empresa Sky TV

Adicionar tipo sem link web

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[2]/div[1]/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[2]

Adicionar página parceiro

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[3]/div[1]/div/div/div/div
    Sleep    1s
    Double Click Element    //*[@id="menu-"]/div[3]/ul/li[2]

Adicionar imagem

    Choose File    //input[@class="push-notification-details__csv__label__input"]    ${IMAGEM}
    Aguardar load da página
    Sleep    1s

Adicionar data inicial

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[4]/div[1]/div/div/div/input    20/04/2023

Adicionar data final

    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[4]/div[2]/div/div/div/input    10/10/2023

Salvar banner adicionado

    Click Button    Adicionar
    Aguardar load da página
    Verificar notificação de sucesso
    Verificar notificação erro

Filtros

    Wait Until Element Is Visible    //*[@id="panel1a-header"]
    Click Element    //*[@id="panel1a-header"]

Filtrar por descrição

    Input Text    //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/input    Empresa Sky TV
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página
    Verificar notificação erro

Detalhes do banner

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[9]/div
    Aguardar load da página
    Verificar notificação erro

Adicionar título

    #Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[1]/div/div/div/input    Coca cola
    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[1]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    Coca cola

Adicionar descrição

    #Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[2]/div/div/div/input    Empresa Cola Cola
    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    Empresa Cola Cola

Adicionar tipo sem link web

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[2]/div[1]/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[2]

Apagar texto de link

    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[2]/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE

Adicionar página parceiro

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[3]/div[1]/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[2]

Adicionar imagem

    Choose File    //input[@class="push-notification-details__csv__label__input"]    ${IMAGEM}
    Aguardar load da página
    Sleep    1s

Salvar banner editado

    Click Button    Salvar
    Aguardar load da página
    Verificar notificação de sucesso
    Verificar notificação erro

    Sleep    1s

    Close Browser

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

Botão filtrar

    Click Button    Filtrar

Limpar filtros

    Click Button    Limpar filtros

