*** Settings ***
Resource         home.robot

*** Variables ***
## No Windows coloque barra dupla assim como mostra o exemplo abaixo!
#${ARQUIVO_EMPRESTIMO}    C:\\Users\\yamfo\\Downloads\\contract-template-20220922232949.html
${ARQUIVO_EMPRESTIMO}    C:\\Users\\yamfo\\Downloads\\contract-template-20220708184457.html

*** Test Cases ***
Login com sucesso
    [Tags]                            login_sucesso

    Set Selenium Speed    0.5 seconds

    Iniciar sessão

    Preencher Login                   yam.carrasco@mblabs.com.br    Pass123123

    Aguardar load da página

Botão emprestimo
    [Tags]                            button_existis

    Click Element                     xpath=//*[contains(text(), "Empréstimos")]
    Aguardar load da página

Paginação

    Click Element    //button[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit" and @title="Próxima página"]
    Aguardar load da página
    Click Element    //button[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit" and @title="Página anterior"]
    Aguardar load da página

Filtros

    Click Element                    //*[@id="panel1a-header"]

Filtrar por cpf ou cnpj

    Input Text          //*[@id="panel1a-content"]/div/div/form/div[1]/div[1]/div/div/div/div/input    566
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página

Filtrar por status pendente de garantia

    Click Element        //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    Click Element        //*[@id="menu-"]/div[3]/ul/li[1]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página

Filtrar por status pendente de assinatura do contrato

    Click Element       //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    Click Element        //*[@id="menu-"]/div[3]/ul/li[3]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página

Filtrar por status aprovado

    Click Element       //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    Click Element        //*[@id="menu-"]/div[3]/ul/li[4]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página

Filtrar por status reprovado

    Click Element       //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    Click Element        //*[@id="menu-"]/div[3]/ul/li[5]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página

Filtrar por data

    Click Element                    //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div

    Sleep     1s

    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[1]/input    10/09/2022
    Sleep    1s

    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[1]/input    ENTER
    Sleep     1s
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[3]/input    30/09/2022
    Sleep    1s
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[3]/input    ENTER
    
    Botão filtrar
    Sleep    1s
    Verificar notificação erro
    Aguardar load da página
    Limpar filtros
    Aguardar load da página

Filtrar por status em análise

    Click Element        //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    Click Element        //*[@id="menu-"]/div[3]/ul/li[2]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro

Filtrar para achar um contrato do Nori

    Input Text          //*[@id="panel1a-content"]/div/div/form/div[1]/div[1]/div/div/div/div/input    56624213078
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro

Download do contrato

    Click Element    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary" and @type="button"]
    Aguardar load da página
    Verificar notificação erro
    Sleep    2s

Upload do contrato

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/button

    Sleep                            1s

    Click Element                    //*[@id="rc_unique_0"]

    Choose File     id:upload-file-modal__upload-input     ${ARQUIVO_EMPRESTIMO}

    Aguardar load da página

    Verificar notificação erro
    Verificar notificação de sucesso

Configuracoes de emprestimo

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[3]/button
    Aguardar load da página
    Sleep    1s
    Click Element    xpath:/html/body/div[5]/div/div[2]/div/div[2]/div[3]/div/div/button
    Aguardar load da página

Detalhes do emprestimo

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[9]
    Aguardar load da página

Botão logs

    Click Button    Logs
    Aguardar load da página

Paginação do log

    Click Element    //button[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit" and @title="Próxima página"]
    Aguardar load da página
    Click Element    //button[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-colorInherit" and @title="Página anterior"]
    Aguardar load da página

Filtro logs

    Click Element    //*[@id="panel1a-header"]
    Sleep    1s

Filtrar log por nivel INFO

    Click Element       //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    Click Element    //*[@id="menu-"]/div[3]/ul/li[1]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página

Filtrar log por nivel ERROR

    Click Element       //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    Click Element    //*[@id="menu-"]/div[3]/ul/li[2]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página

Filtrar log por tipo emprestimo

    Click Element    //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[1]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página

Filtrar log por tipo emprestimo pre-aprovado

    Click Element    //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[2]
   Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página

Filtrar log por tipo webhook assinatura de contrato

    Click Element    //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/div
    Click Element    //*[@id="menu-"]/div[3]/ul/li[3]
    Botão filtrar
    Aguardar load da página
    Verificar notificação erro
    Limpar filtros
    Aguardar load da página

Filtrar log por data

    Click Element                    //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div

    Sleep     1s

    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[1]/input    10/09/2022
    Sleep    1s

    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[1]/input    ENTER
    Sleep     1s
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[3]/input    30/09/2022
    Sleep    1s
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[3]/input    ENTER
    
    Botão filtrar
    Sleep    1s
    Verificar notificação erro
    Aguardar load da página
    Limpar filtros
    Aguardar load da página



Detalhes do log

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[6]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[5]
    Sleep    2s

Fechar detalhes do log

    Click Button    Fechar
    Sleep    1s

Histórico de status

    Click Button    Histórico de status
    Aguardar load da página

Botão emitente

    Click Button    Emitente
    Aguardar load da página

Emitente banco

    Click Element    //div[@class="ant-select ant-select-borderless issuers-tab__select ant-select-single ant-select-allow-clear ant-select-show-arrow ant-select-show-search"]
    Sleep    2s

Emitente conta
    
    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[1]/div[2]/div/div/div/input
    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[1]/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE  
    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input"]    3350

Emitente agencia
    
    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[1]/div[3]/div/div/div/input
    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[1]/div[3]/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[1]/div[3]/div/div/div/input    230871

Salvar alterações do emitente

    Click Button    Salvar
    Aguardar load da página
    Sleep    1s
    Verificar notificação erro

Botão garantias

    Click Button    Garantias
    Aguardar load da página

Editar garantias

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[1]/div[2]/div[2]/div/div/div/div/div/div[1]/div[5]
    Sleep    1s
    Click Element    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[3]/div/div[1]/button
    Sleep    1s

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[1]/div[2]/div[2]/div/div/div/div/div/div[1]/div[5]
    Sleep    1s
    Click Element    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/fieldset/div[2]/label[5]
    Click Element    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[3]/div/div[2]/button

    Aguardar load da página
    Verificar notificação erro

Botão avalista/terceiro garantidor

    Click Button    Avalista/Terceiro garantidor
    Aguardar load da página

Adicionar avalista

    ## Botão Adicionar
    Click Button    Adicionar
    Sleep    2s
    ## Botão Fechar
    Click Button    Fechar
    Sleep    2s
    ## Botão Adicionar
    Click Button    Adicionar
    Sleep    2s
    ## Razão Social
    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input"]    MB-LABS
    ## Escolha do Tipo
    Click Element    //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    ## Option Avalista
    Click Element    //*[@id="menu-"]/div[3]/ul/li[1]
    ## Endereço eletrônico
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[2]/div[1]/div/div/div/input    yam.carrasco@mblabs.com.br
    ## CPF ou CNPJ
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/div/div/div/input    06718676365
    ## CEP
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[3]/div[1]/div/div/div/input    64600184
    Aguardar load da página
    Verificar notificação erro
    ## Número do endereço
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[4]/div[3]/div/div/div/input    3030
    ## Complemento
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[5]/div/div/div/div/input    Portão cinza
    ## Botão confirmar
    Click Button    Confirmar
    Aguardar load da página
    Verificar notificação erro


Adicionar terceiro garantidor

    ## Botão Adicionar
    Click Button    Adicionar
    Sleep    2s
    ## Botão Fechar
    Click Button    Fechar
    Sleep    2s
    ## Botão Adicionar
    Click Button    Adicionar
    Sleep    2s
    ## Razão Social
    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input"]    FAPEPI NACIONAL
    ## Escolha do Tipo
    Click Element    //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    ## Option Terceiro garantidor
    Click Element    //*[@id="menu-"]/div[3]/ul/li[2]
    ## Endereço eletrônico
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[2]/div[1]/div/div/div/input    yam.carrasco@mblabs.com.br
    ## CPF ou CNPJ
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/div/div/div/input    31949208125
    ## CEP
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[3]/div[1]/div/div/div/input    60745650
    Aguardar load da página
    Verificar notificação erro
    ## Número do endereço
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[4]/div[3]/div/div/div/input    3030
    ## Complemento
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[5]/div/div/div/div/input    Portão cinza
    ## Botão confirmar
    Click Button    Confirmar
    Aguardar load da página
    Verificar notificação erro
    
Excluir avalista/terceiro garantidor

    ## Botão excluir
    Click Element    //div[@class="MuiDataGrid-cell MuiDataGrid-cell--withRenderer MuiDataGrid-cell--textCenter"]
    Sleep    2s
    ## Botão cancelar
    Click Button    Cancelar
    Sleep    2s
    ## Botão excluir
    Click Element    //div[@class="MuiDataGrid-cell MuiDataGrid-cell--withRenderer MuiDataGrid-cell--textCenter"]
    Sleep    2s
    ## Botão confirmar
    Click Button    Confirmar
    Aguardar load da página
    Verificar notificação erro

Editar avalista/terceiro garantidor

    Click Element    //div[@class="MuiDataGrid-cell MuiDataGrid-cell--withRenderer MuiDataGrid-cell--textCenter MuiDataGrid-withBorder"]
    Sleep    2s
    ## Razão Social
    Press Keys    //input[@class="MuiInputBase-input MuiOutlinedInput-input"]    HOME    SHIFT+END+BACKSPACE
    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input"]    FAPEPI
    ## Escolha do Tipo
    Click Element    //div[@class="MuiSelect-root MuiSelect-select MuiSelect-selectMenu MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input"]
    ## Option avalista
    Click Element    //*[@id="menu-"]/div[3]/ul/li[1]
    ## Endereço eletrônico
    Press Keys    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[2]/div[1]/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[2]/div[1]/div/div/div/input    yam.carrasco@mblabs.com.br
    ## CPF ou CNPJ
    Press Keys    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/div/div/div/input    31949208125
    ## CEP
    Press Keys    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[3]/div[1]/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[3]/div[1]/div/div/div/input    60745650
    Aguardar load da página
    Verificar notificação erro
    ## Número do endereço
    Press Keys    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[4]/div[3]/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[4]/div[3]/div/div/div/input    3030
    ## Complemento
    Press Keys    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[5]/div/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[5]/div/div/div/div/input    Portão cinza
    ## Botão confirmar
    Click Button    Confirmar
    Aguardar load da página
    Verificar notificação erro

Características da operação

    ## Botão características da operação
    Click Button    Características da operação
    Aguardar load da página

Adicionar data de emissão do contrato

    ## input para digitar
    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiOutlinedInput-inputAdornedEnd"]    20/09/2022
    Press Keys    //input[@class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiOutlinedInput-inputAdornedEnd"]    ENTER

Data de vencimento inicial

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[3]/div[2]/div/div/div/input
    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[3]/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Sleep    1s
    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[3]/div[2]/div/div/div/input    015092022   
    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[3]/div[2]/div/div/div/input    ENTER 

Data de vencimento final

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[3]/div[3]/div/div/div/input
    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[3]/div[3]/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Sleep    1s
    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[3]/div[3]/div/div/div/input    020112022   
    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[3]/div[3]/div/div/div/input    ENTER

Prazo de operação

    Click Element    //input[@class="MuiInputBase-input MuiOutlinedInput-input" and @type="number"]
    Press Keys    //input[@class="MuiInputBase-input MuiOutlinedInput-input" and @type="number"]    HOME    SHIFT+END+BACKSPACE
    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input" and @type="number"]    4
    Press Keys    //input[@class="MuiInputBase-input MuiOutlinedInput-input" and @type="number"]    ENTER

Tarfia de liquidação

    Click Element    //input[@class="MuiInputBase-input MuiOutlinedInput-input" and @type="text"]
    Press Keys    //input[@class="MuiInputBase-input MuiOutlinedInput-input" and @type="text"]    HOME    SHIFT+END+BACKSPACE
    Input Text    //input[@class="MuiInputBase-input MuiOutlinedInput-input" and @type="text"]    33
    Press Keys    //input[@class="MuiInputBase-input MuiOutlinedInput-input" and @type="text"]    ENTER

Número de parcelas de carência

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[4]/div[3]/div/div/div/input
    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[4]/div[3]/div/div/div/input    HOME    SHIFT+END+BACKSPACE
    Input Text    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[4]/div[3]/div/div/div/input    2
    Press Keys    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[4]/div[3]/div/div/div/input    ENTER

Botão salvar

    Click Button    Salvar
    Aguardar load da página
    Verificar notificação erro

Aprovar empréstimo

    ## Botão aprovar
    Click Button    Aprovar empréstimo
    Sleep    1s
    ## Botão cancelar dentro do modal
    Click Button    Cancelar
    Sleep    1s
    ## Botão aprovar novamente
    Click Button    Aprovar empréstimo
    Sleep    2s
    ## Botão confirmar
    Click Button    Confirmar
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

    Click Button                     Filtrar

Limpar filtros

    Click Button                     Limpar filtros

Botão salvar

    Click Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div[2]/div/button
