*** Settings ***
Library         SeleniumLibrary    timeout=500
Library         FakerLibrary    locale=pt-br

*** Variables ***
${TITLE}                              Novo Dispositivo!
${BODY}                               Sua conta foi conectada em um novo dispositivo
${CELLPHONE}                          C:\\Users\\yamfo\\Downloads\\push_csv_cellphone_template.csv
${CPF}                                C:\\Users\\yamfo\\Downloads\\push_csv_tax_identifier_template.csv

*** Keywords ***
Clicar no botão adicionar - PUSH NOTIFICATIONS
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/a/div/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/a/div/button

Clicar no botão Download do template CPF
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div/div[1]/a
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div/div[1]/a

Clicar no botão Download do template telefone
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div/div[2]/a
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div/div[2]/a

Clicar no botão PUSH NOTIFICATIONS
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Push Notifications")]
    Click Element                    xpath=//*[contains(text(), "Push Notifications")]

Upload de arquivo csv telefone
    Wait Until Page Contains Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div/label/input
    Choose File                      //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div/label/input    ${CELLPHONE}

Upload de arquivo csv cpf
    Wait Until Page Contains Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div/label/input
    Choose File                      //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div/label/input    ${CPF}

Clicar no botão salvar para adicionar notificação
    Click Button                     Adicionar

Digitar título da notificação
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[2]/div[2]/div/div/div/div/input
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[2]/div[2]/div/div/div/div/input    ${TITLE}

Digitar mensagem da notificação
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[2]/div[3]/div/div/div/div/textarea
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[2]/div[3]/div/div/div/div/textarea    ${BODY}


