*** Settings ***
Library         SeleniumLibrary    timeout=20
Library         Screenshot

*** Variables ***
#### OPÇÕES
${IBK_RECEBER}                      xpath=//*[contains(text(), "Receber")]
${OPTION_BOLETO}                    xpath=//*[contains(text(), "Gerar um boleto de depósito")]
${OPTION_QR_CODE_PIX}               xpath=//*[contains(text(), "recebe via Pix com um QR Code")]

${BILLING_AMOUNT}                   //*[@class="generate-billet-amount__currency-mask-input"]
${BOLETO_VALUE}                     3000

*** Keywords ***
Clicar em RECEBER
    Wait Until Element Is Visible    ${IBK_RECEBER}
    Click Element                    ${IBK_RECEBER}

Clicar na opção de Gerar Boleto
    Wait Until Element Is Visible    ${OPTION_BOLETO}
    Click Element                    ${OPTION_BOLETO}

Inserir valor da cobrança (RECEBER)
    Wait Until Element Is Visible    ${BILLING_AMOUNT}
    Input Text                       ${BILLING_AMOUNT}    ${BOLETO_VALUE}

Clicar em Criar boleto
    Click Button                     Criar boleto

Verificar se o boleto foi gerado
    Wait Until Page Contains         Não altere o código de barras ou pague o boleto em duplicidade
    Page Should Contain              O boleto estará disponivel para pagamento em até 5 minutos
    Page Should Contain              Após o pagamento, o dinheiro estará disponível na sua conta em até 3 dias úteis

Pegar código do boleto gerado
    ${BOLETO_CODE}=       Get Text                 //*[@class="generate-billet-confirmation__billet-code"]
    Log To Console    ${BOLETO_CODE}

Clicar na opção de Gerar QR Code Pix
    Wait Until Element Is Visible    ${OPTION_QR_CODE_PIX}
    Click Element                    ${OPTION_QR_CODE_PIX}

Clicar no botão Continuar (GERAR QR CODE PIX)
    Click Button                                   Continuar

Clicar em não definir valor da cobrança (GERAR QR CODE PIX)
    Click Element                                  xpath=//*[contains(text(), "Não especificar um valor")]

Verificar descrição da cobrança QR code pix
    Page Should Contain    Quem for te pagar vai ver essas informações quando ler o QR code
    Page Should Contain    Chave Pix

Clicar no botão para gerar o QR code pix
    Click Button    Gerar QR Code

Verificar QR code pix gerado
    Page Should Contain    Quem for te pagar precisa abrir o app em que vai fazer a transferência e ler o QR Code

Copiar código QR code Pix
    Click Button    Copiar

Salvar código QR code pix
    Click Button    Salvar

Verificar tipos de cobranças (RECEBER)
    Page Should Contain        Receber
    Page Should Contain        Realize cobranças por meio do boleto ou QR Code Pix


