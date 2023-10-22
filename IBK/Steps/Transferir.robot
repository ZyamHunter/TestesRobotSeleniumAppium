*** Settings ***
Documentation   Backoffice - Bankeiro - Configurações / Gestão de bancos
Library         SeleniumLibrary    timeout=20
Library         Screenshot

*** Variables ***
#### OPÇÕES
${IBK_TRANSFERIR}                  xpath=//*[contains(text(), "Transferir")]
${TED_OPTION}                      //*[@id="rc-tabs-0-panel-1"]/div[1]/div[1]/div/div
${P2P_OPTION}                      xpath=//*[contains(text(), "Realizar transferência para mesma titularidade")]

${VALUE}                           1

${CAMPO_PESQUISA}                  //*[@id="rc-tabs-0-panel-2"]/div/div[2]/input

*** Keywords ***
Clicar em transferir
    Wait Until Element Is Visible     ${IBK_TRANSFERIR}
    Click Element                     ${IBK_TRANSFERIR}

Clicar na opção TED
    Wait Until Element Is Visible     ${TED_OPTION}
    Click Element                     ${TED_OPTION}

Clicar na opção P2P
    Wait Until Element Is Visible     ${P2P_OPTION}
    Click Element                     ${P2P_OPTION}

Clicar em novo dado bancário
    Wait Until Element Is Visible     xpath=//*[contains(text(), "Novo dado bancário")]
    Click Element                     xpath=//*[contains(text(), "Novo dado bancário")]
    Sleep    1s

Escolher tipo de conta pessoa física (Transferir)
    Wait Until Element Is Visible     xpath=/html/body/div[2]/div/div[2]/div/div[2]/div/div[2]/div/form/div[1]/label[1]/span[1]/input
    Click Element                     xpath=/html/body/div[2]/div/div[2]/div/div[2]/div/div[2]/div/form/div[1]/label[1]/span[1]/input
    
Escolher tipo de conta pessoa jurídica (Transferir)
    Wait Until Element Is Visible     xpath=/html/body/div[2]/div/div[2]/div/div[2]/div/div[2]/div/form/div[1]/label[2]/span[1]/input
    Click Element                     xpath=/html/body/div[2]/div/div[2]/div/div[2]/div/div[2]/div/form/div[1]/label[2]/span[1]/input

Digitar nome completo (transferir)
    [Arguments]    ${standard}

    IF  ${standard}
        Wait Until Element Is Visible     xpath=//input[@class="MuiInputBase-input MuiInput-input"]
        Input Text                        xpath=//input[@class="MuiInputBase-input MuiInput-input"]    ${SECOND_CONTACT_NAME}        
    ELSE
        Wait Until Element Is Visible     xpath=//input[@class="MuiInputBase-input MuiInput-input"]
        Input Text                        xpath=//input[@class="MuiInputBase-input MuiInput-input"]    ${FIRST_CONTACT_NAME}
    END

Digitar cpf do contato cadastrado
    [Arguments]    ${standard}

    IF  ${standard}
        Input Text                        xpath=//*[@class="advanced-form"]/form/div[3]/div/div/div/div/input    ${SECOND_CONTACT_CPF}        
    ELSE
        Input Text                        xpath=//*[@class="advanced-form"]/form/div[3]/div/div/div/div/input    ${FIRST_CONTACT_CPF}
    END

Clicar no ícone de favoritar contato cadastrado
    Wait Until Element Is Visible                xpath=//*[@class="contact-list-item__contacts__list__icons__star"]
    Click Element                                xpath=//*[@class="contact-list-item__contacts__list__icons__star"]

Clicar no ícone de excluir contato cadastrado
    Wait Until Element Is Visible                xpath=//*[@class="contact-list-item__contacts__list__icons__delete"]
    Click Element                                xpath=//*[@class="contact-list-item__contacts__list__icons__delete"]
    Sleep    2s
    Click Button    Deletar

Clicar no botão cadastrar (Transferir > Cadastro bancário)
    Sleep    0.5 seconds
    Click Button        Cadastrar

Clicar em contato já cadastrado
    Wait Until Element Is Visible    xpath=//*[contains(text(), "${FIRST_CONTACT_NAME}")]    5s
    Click Element                    xpath=//*[contains(text(), "${FIRST_CONTACT_NAME}")]

Digitar valor da transação
    Wait Until Element Is Visible    xpath=//input[@class="value-requested__currency-mask-input"]
    Input Text                       xpath=//input[@class="value-requested__currency-mask-input"]    ${VALUE}

Clicar no botão avançar (transferir)
    Click Button                     Avançar

Clicar no botão confirmar (transferir)
    Click Button                      Confirmar

Confirmar PIN (transferir)
    Wait Until Element Is Visible    xpath=//*[@class="confirmation-modal__number-grid__digit"]

    Click Element    xpath=//*[@class="confirmation-modal__number-grid"]/p[1]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid"]/p[2]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid"]/p[4]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid__digit"][5]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid__digit"][7]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid__digit"][8]

    Sleep    1s
    Click Element    xpath=//*[@class="confirmation-modal__button-container"]/div/button

Pesquisar usuário pelo CPF (Transferir)
    Wait Until Element Is Visible    ${CAMPO_PESQUISA}
    Input Text                       ${CAMPO_PESQUISA}    ${SECOND_CONTACT_CPF}

Voltar para a tela de contas (Transferir)
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Conta para transferência")]
    Click Element                    xpath=//*[contains(text(), "Conta para transferência")]

Verificar existência de conta criada P2P (Transferir)
    Page Should Contain    ${SECOND_CONTACT_NAME}

Verificar existência de conta criada TED (Transferir)
    Page Should Contain    ${SECOND_CONTACT_NAME}

Selecionar tipo conta corrente (TED)
    Click Element                    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div/div[2]/div/form/div[4]/label[1]/span[1]/input

Selecionar tipo conta poupança (TED)
    Click Element                    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div/div[2]/div/form/div[4]/label[2]/span[1]/input

Digitar banco (TED)
    Press Keys                       //*[@id="rc_select_0"]    ${SECOND_CONTACT_ACCOUNT_BANK}    ENTER

Digitar agência (TED)
    Input Text    xpath=//*[@class="ant-col ant-col-7"]/div/div/div/input    ${SECOND_CONTACT_AGENCY}

Digitar conta (TED)
    Input Text    xpath=//*[@class="ant-col ant-col-7"][2]/div/div/div/input    ${SECOND_CONTACT_ACCOUNT_NUMBER}

Digitar digito (TED)
    Input Text    xpath=//*[@class="ant-col ant-col-7"][3]/div/div/div/input    ${SECOND_CONTACT_ACCOUNT_DIGIT}

Verificar página de transferências
    Page Should Contain    Realize pagamentos por meio do TEF/P2P e TED

Verificar tipos de transferências
    Page Should Contain    TED

Verificar contato P2P excluído (Transferir)
    Run Keyword And Continue On Failure    Page Should Not Contain    ${SECOND_CONTACT_NAME}

Verificar contato TED excluído (Transferir)
    Run Keyword And Continue On Failure    Page Should Not Contain    ${SECOND_CONTACT_NAME}

Verificar comprovante de transação (Transferir)
    Wait Until Page Contains    Comprovante da transação
    Wait Until Page Contains    Comprovante da transação realizada


