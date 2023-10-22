*** Settings ***
Library         SeleniumLibrary    timeout=500

*** Variables ***
${FIRST_DATE}    10/11/2022
${LAST_DATE}     10/12/2022

*** Keywords ***
Clicar no botão de transações em usuários
    Click Element                     xpath=//*[contains(text(), "Transações")]              

Clicar no botão de exportar transações
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/button

Abrir filtro de tipo de transação
    Wait Until Element Is Visible    //*[@id="panel1a-content"]/div/div/form/div[1]/div[5]/div/div/div/div/div
    Click Element                    //*[@id="panel1a-content"]/div/div/form/div[1]/div[5]/div/div/div/div/div

Filtrar por transferência em Transações
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Transferência")] 
    Click Element                    xpath=//*[contains(text(), "Transferência")] 

Filtrar por Boleto em transações
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Boleto")] 
    Click Element                    xpath=//*[contains(text(), "Boleto")] 

Filtrar transações por data
    Wait Until Element Is Visible    //*[@id="panel1a-content"]/div/div/form/div[1]/div[6]/div/div/label/div
    Click Element                    //*[@id="panel1a-content"]/div/div/form/div[1]/div[6]/div/div/label/div

    Input Text                       //*[@id="panel1a-content"]/div/div/form/div[1]/div[6]/div/div/label/div/div[1]/input    ${FIRST_DATE}
    Press Keys                       //*[@id="panel1a-content"]/div/div/form/div[1]/div[6]/div/div/label/div/div[1]/input    ENTER
    Input Text                       //*[@id="panel1a-content"]/div/div/form/div[1]/div[6]/div/div/label/div/div[3]/input    ${LAST_DATE}
    Press Keys                       //*[@id="panel1a-content"]/div/div/form/div[1]/div[6]/div/div/label/div/div[3]/input    ENTER

Clicar em alguma transação
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[9]/div/a/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[9]/div/a/button

Verificar detalhes da transação
    Wait Until Page Contains Element    xpath=//*[contains(text(), "Detalhes da transação")]    5s
    Sleep    1s

