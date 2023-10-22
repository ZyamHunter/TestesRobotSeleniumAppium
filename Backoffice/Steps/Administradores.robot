*** Settings ***
Library         SeleniumLibrary    timeout=500
Library         DateTime

*** Variables ***
${ADMIN_NAME}                        Admin teste
${ADMIN_EDIT_NAME}                   ADMINISTRADOR TESTE
${ADMIN_EMAIL}                       roberto.carlos@gmail.com

*** Keywords ***
Clicar em administradores
    Click Element                     xpath=//*[contains(text(), "Administradores")]              

Clicar no botão adicionar
    Click Button                      Adicionar

Preencher nome completo
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[1]/div[1]/div/div/div/input    ${ADMIN_NAME}

Preencher email
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[1]/div[2]/div/div/div/input
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[1]/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${ADMIN_EMAIL}

Preencher pin
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[1]/div[3]/div/div/div/input
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[1]/div[3]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    124578

Selecionar permissão
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[2]/div/div/div/div
    Wait Until Page Contains Element   xpath=//*[@id="mui-1-option-1"]
    Click Element    xpath=//*[@id="mui-1-option-1"]

Preencher senha
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[3]/div[1]/div/div/div/input    Pass123123

Preencher senha novamente
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[3]/div[2]/div/div/div/input    Pass123123

Adicionar administrador
    Click Button    Adicionar
    #Click Element                     xpath=//*[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary"]

Verificar administrador criado
    Wait Until Page Contains Element    //div[@class="ant-message-custom-content ant-message-success"]    2s
    Page Should Contain Element        //div[@class="ant-message-custom-content ant-message-success"]

    Wait Until Element Is Visible    //div[@data-rowindex="0" and @data-colindex="0" and @data-value="${ADMIN_NAME}"]

    Page Should Contain Element    //div[@data-rowindex="0" and @data-colindex="0" and @data-value="${ADMIN_NAME}"]
    Page Should Contain Element    //div[@data-rowindex="0" and @data-colindex="1" and @data-value="${ADMIN_EMAIL}"]

####Pegando a data de hoje e convertendo para formato yyyy-mm-dd
    ${TODAY}    Get Current Date    result_format=%Y-%m-%d

    ####Formatando para ficar no formato dd-mm-yyyy
    ${TODAY}    Convert Date    ${TODAY}   result_format=%d-%m-%Y

    #Page Should Contain Element    //div[@data-rowindex="0" and @data-colindex="2" and @data-value="${ADMIN_EMAIL}"]

Verificar administrador editado
    Wait Until Page Contains Element    //div[@class="ant-message-custom-content ant-message-success"]    2s
    Page Should Contain Element        //div[@class="ant-message-custom-content ant-message-success"]

    Wait Until Element Is Visible    //div[@data-rowindex="0" and @data-colindex="0" and @data-value="${ADMIN_EDIT_NAME}"]

    Page Should Contain Element    //div[@data-rowindex="0" and @data-colindex="0" and @data-value="${ADMIN_EDIT_NAME}"]
    Page Should Contain Element    //div[@data-rowindex="0" and @data-colindex="1" and @data-value="${ADMIN_EMAIL}"]

Verificar administrador
    Wait Until Page Contains Element    //div[@class="ant-message-custom-content ant-message-success"]    2s
    Page Should Contain Element        //div[@class="ant-message-custom-content ant-message-success"]

Clicar em detalhes
    Wait Until Page Contains Element    xpath=//*[@class="users__details"]
    Click Element                    xpath=//*[@class="users__details"]

Editar nome completo do administrador
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[1]/div[1]/div/div/div/input
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[1]/div[1]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${ADMIN_EDIT_NAME}

Clicar em salvar
    Click Button                      Salvar

Clicar no botão remover
    Click Button                      Remover
    Wait Until Page Contains Element    xpath=//*[contains(text(), "Confirmar")]
    Click Button                      Confirmar

Filtrar administrador por usuário
    Wait Until Element Is Visible     //*[@id="panel1a-content"]/div/div/form/div[1]/div[1]/div/div/div/div/input
    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[1]/div/div/div/div/input    ${ADMIN_EDIT_NAME}

Filtrar administrador por email
    Wait Until Element Is Visible     //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/input
    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/input    ${ADMIN_EMAIL}

Filtrar administrador por data
    Wait Until Element Is Visible     //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div
    Click Element                     //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div
    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[1]/input    01/11/2022
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[1]/input    ENTER
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[3]/input    30/11/2022
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[3]/input    ENTER
