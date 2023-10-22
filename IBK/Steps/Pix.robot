*** Settings ***
Library         SeleniumLibrary    timeout=500
Library         Screenshot

*** Variables ***
#### OPÇÕES
${PIX}                                xpath=//*[contains(text(), "Pix")]
${TRANSFERIR}                         //*[@id="root"]/div/div/div[2]/div/div/div/div[3]/div[1]/div[2]/div
${COBRAR}                             xpath=//*[contains(text(), "Cobrar")]
${COPIA_E_COLA}                       xpath=//*[contains(text(), "Copia e cola")]
${LIMITES}                            xpath=//*[contains(text(), "Limites")]
${RANDOM_KEY_PIX}                     xpath=//*[contains(text(), "Criar chave")]
${OPTION_RANDOM_KEY_PIX}              xpath=//*[contains(text(), "Cadastrar uma chave aleatória Pix")]

${CONTACT_PIX}                        xpath=//*[contains(text(), "Messias Vieira")]
${INPUT_PIX}                          //*[@class="value-requested__currency-mask-input"]
${INPUT_PIX_COPIA_COLA}               //*[@class="generate-billet-amount__currency-mask-input"]
${CAMPO_CODE_PIX}                     //*[@class="ant-input payment-pix-key__textarea"]
${CODE_PIX}                           00020126390014BR.GOV.BCB.PIX0117zyamjob@gmail.com5204000053039865802BR5925Yam Ydo da Silva Fontalba6009SAO PAULO61080540900062070503***6304591A
${CODE_PIX_VALUE}                     00020126390014BR.GOV.BCB.PIX0117zyamjob@gmail.com52040000530398654040.015802BR5925Yam Ydo da Silva Fontalba6009SAO PAULO61080540900062070503***63040DA2

*** Keywords ***
Clicar em Pix
    Wait Until Element Is Visible    ${PIX}
    Click Element                    ${PIX}

Verificar área de gestão pix
    Page Should Contain    Realize pagamentos ou recebimentos por meio do Pix
    Page Should Contain    Criar chave
    Page Should Contain    Transferir
    Page Should Contain    Copia e Cola
    Page Should Contain    Cobrar
    Page Should Contain    Limites

Clicar em criar chave pix (GESTÃO PIX)
    Wait Until Element Is Visible    ${RANDOM_KEY_PIX}
    Click Element                    ${RANDOM_KEY_PIX}

Selecionar chave pix aleatória
    Wait Until Element Is Visible    ${OPTION_RANDOM_KEY_PIX}
    Click Element                    ${OPTION_RANDOM_KEY_PIX}

Clicar no botão avançar (PIX)
    Click Button    Avançar

Digitar PIN (PIX)
    Wait Until Element Is Visible    xpath=//*[@class="confirmation-modal__number-grid__digit"]

    Click Element    xpath=//*[@class="confirmation-modal__number-grid"]/p[1]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid"]/p[2]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid"]/p[4]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid__digit"][5]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid__digit"][7]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid__digit"][8]

    Sleep    1s
    Click Element    xpath=//*[@class="confirmation-modal__button-container"]/div/button

Verificar chave aleatória pix criada
    Page Should Contain    Chave aleatória

Clicar na opção de transferir PIX
    Wait Until Element Is Visible    ${TRANSFERIR}
    Click Element                    ${TRANSFERIR}

Clicar na opção de Cobrar PIX
    Wait Until Element Is Visible    ${COBRAR}
    Click Element                    ${COBRAR}

Clicar na opção de Copia e Cola PIX
    Wait Until Element Is Visible    ${COPIA_E_COLA}
    Click Element                    ${COPIA_E_COLA}

Clicar na opção de Limites PIX
    Wait Until Element Is Visible    ${LIMITES}
    Click Element                    ${LIMITES}

Clicar no contato salvo pix
    Wait Until Element Is Visible    ${CONTACT_PIX}
    Click Element                    ${CONTACT_PIX}

Inserir valor da transferência pix
    Wait Until Element Is Visible    ${INPUT_PIX}
    Input Text                       ${INPUT_PIX}    1

Verificar tela de confirmação pix
    Wait Until Page Contains    Transferir via Pix    5s
    Wait Until Page Contains    Data da transação    5s
    Wait Until Page Contains    Origem    5s
    Wait Until Page Contains    Destino    5s

Clicar no botão confirmar (PIX)
    Click Button    Confirmar

Digitar PIN (TRANSFERIR PIX)
    Wait Until Element Is Visible    xpath=//*[@class="confirmation-modal__number-grid__digit"]

    Click Element    xpath=//*[@class="confirmation-modal__number-grid"]/p[1]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid"]/p[2]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid"]/p[4]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid__digit"][5]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid__digit"][7]
    Click Element    xpath=//*[@class="confirmation-modal__number-grid__digit"][8]

    Sleep    1s
    Click Element    xpath=//*[@class="confirmation-modal__button-container"]/div/button

Verificar transferencia pix realizada
    Page Should Contain    Comprovante da transação
    Page Should Contain    Comprovante da transação realizada
    Page Should Contain    Identificador Pix
    Page Should Contain    Autenticação

Inserir código pix (COPIA E COLA)
    Wait Until Element Is Visible    ${CAMPO_CODE_PIX}
    Input Text                       ${CAMPO_CODE_PIX}    ${CODE_PIX}

Inserir código pix com valor (COPIA E COLA)
    Wait Until Element Is Visible    ${CAMPO_CODE_PIX}
    Input Text                       ${CAMPO_CODE_PIX}    ${CODE_PIX_VALUE}

Clicar no botão continuar (PIX)
    Click Button    Continuar

Digitar valor da transação pix (COPIA E COLA)
    Wait Until Element Is Visible    ${INPUT_PIX_COPIA_COLA}
    Input Text            ${INPUT_PIX_COPIA_COLA}    1

Verificar página de confirmação (PIX COPIA E COLA)
    Page Should Contain        Pix Copia e Cola
    Page Should Contain        Valor da transferência









