*** Settings ***
Resource         home.robot

*** Variables ***
## No Windows coloque barra dupla assim como mostra o exemplo abaixo!
${GARANTIAS}    C:\\Users\\yamfo\\Downloads\\Documento.pdf
${ERROR}

*** Test Cases ***
Login com sucesso
    [Tags]                            login_sucesso

    Iniciar sessão

    Aguardar load da página

    Set Selenium Speed    1 second

    Preencher Login                   messias2    Pass123123

    Click Element    //*[@id="root"]/div/div/div[2]/div[2]/div/div/form/div/div/div[2]/div[3]/div/div/button

    Aguardar load da página

    Confirmar sms 1° login            112233

    Wait Until Page Contains Element    //*[@id="root"]/div/div/div[2]/div/div/div/div/div[1]/div[3]/div/div/div/button    30s

Botão simular empréstimo

    Click Element    //*[@id="root"]/div/div/div[2]/div/div/div/div/div[1]/div[3]/div/div/div/button
    Aguardar load da página

Vantagens

    Click Element    //*[@id="root"]/div/div/div[2]/div/div/div/div[3]/div[2]/div/div/button
    Aguardar load da página

Dados da simulação

    ## Botão voltar
    Click Element    //*[@id="root"]/div/div/div[2]/div/div/div/div[3]/div[2]/div/div[1]/div/button
    Aguardar load da página
    ## Avançar de vantagens
    Click Element    //*[@id="root"]/div/div/div[2]/div/div/div/div[3]/div[2]/div/div/button
    Aguardar load da página
    ## Valor do empréstimo
    Press Keys    //*[@id="rc-tabs-0-panel-2"]/div/div[1]/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    //*[@id="rc-tabs-0-panel-2"]/div/div[1]/div/input    8700000
    ## Data da primeira parcela
    Press Keys    //*[@id="rc-tabs-0-panel-2"]/div/div[2]/div/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    //*[@id="rc-tabs-0-panel-2"]/div/div[2]/div/div/div/div/input    20/11/2022
    ## Seleção do número de parcelas
    Click Element    //*[@id="rc-tabs-0-panel-2"]/div/div[3]/div/div/label[4]/span[1]/input
    ## Botão avançar
    Click Element    //*[@id="root"]/div/div/div[2]/div/div/div/div[3]/div[2]/div/div[2]/button
    Aguardar load da página

Autorizações

    ## Botão voltar
    Click Element    //*[@id="root"]/div/div/div[2]/div/div/div/div[3]/div[2]/div/div[1]/div/button
    Aguardar load da página

    ## Botão avançar de dados da simulação
    Click Element    //*[@id="root"]/div/div/div[2]/div/div/div/div[3]/div[2]/div/div[2]/button
    Aguardar load da página

    ## Checkbox
    Click Element    //*[@id="rc-tabs-0-panel-3"]/div/div[2]/div[1]/div/label/span[1]/span[1]/input
    Click Element    //*[@id="rc-tabs-0-panel-3"]/div/div[2]/div[2]/div/label/span[1]/span[1]/input
    Click Element    //*[@id="rc-tabs-0-panel-3"]/div/div[2]/div[3]/div/label/span[1]/span[1]/input

    ## Botão avançar
    Click Element    //*[@id="root"]/div/div/div[2]/div/div/div/div[3]/div[2]/div/div[2]/button
    Aguardar load da página

Confirmação

    Click Element    //*[@id="rc_select_0"]
    Input Text    //*[@id="rc_select_0"]    77 - Banco Inter S.A.
    Press Keys    //*[@id="rc_select_0"]    ENTER

    Input Text    //*[@id="rc-tabs-0-panel-4"]/div/div/div[4]/div[2]/div[1]/div/div/div/input    3350
    Input Text    //*[@id="rc-tabs-0-panel-4"]/div/div/div[4]/div[2]/div[2]/div/div/div/input    23087
    Input Text    //*[@id="rc-tabs-0-panel-4"]/div/div/div[4]/div[2]/div[3]/div/div/div/input    1
    ## checkbox
    Click Element    //*[@id="rc-tabs-0-panel-4"]/div/div/label/span[1]/input
    ## Botão confirmar empréstimo
    Click Element    //*[@id="root"]/div/div/div[2]/div/div/div/div[3]/div[2]/div/div[2]/button
    Aguardar load da página

Garantias

    ## Enviar garantia
    Choose File    //*[@id="file-upload-warranty"]    ${GARANTIAS}
    Aguardar load da página
    ## Botão avançar
    Click Element    //*[@id="root"]/div/div/div[2]/div/div/div/div[3]/div[2]/div/div[2]/button
    Aguardar load da página
    Verificar notificação de erro
    Verificar notificação de sucesso

    Sleep    5s

    Close Browser

*** Keywords ***
Preencher Login
    [Arguments]                       ${uname}       ${pass}

    Input Text                        //input[@class="MuiInputBase-input MuiOutlinedInput-input" and @type="text"]    ${uname}
    Input Text                        //input[@class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiOutlinedInput-inputAdornedEnd" and @type="password"]    ${pass}

Aguardar load da página

    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]

Verificar Login
    [Arguments]                       ${url_access}

    ${url_login}=                     Get Location    
    Should Contain                    ${url_login}    ${url_access}

Confirmar sms 1° login
    [Arguments]                       ${codigo}

    Aguardar load da página

    Input Text                        //*[@id="root"]/div/div/div/div[2]/div/div/div/div/div/input        ${codigo}
    Click Element                     //*[@id="root"]/div/div/div/div[3]/div[1]/div/button
    Aguardar load da página
    
Verificar notificação de erro

     ${ERROR}=    Page Should Not Contain Element    //div[@class="ant-message-custom-content ant-message-error"]

Verificar notificação de sucesso

    Page Should Contain Element        //div[@class="ant-message-custom-content ant-message-success"]


