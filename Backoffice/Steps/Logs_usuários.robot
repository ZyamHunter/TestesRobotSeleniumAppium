*** Settings ***
Library         SeleniumLibrary    timeout=500

*** Variables ***
${FIRST_DATE}    10/11/2022
${LAST_DATE}     10/12/2022

*** Keywords ***
Clicar no botão Logs dos usuários
    Click Element                     xpath=//*[contains(text(), "Logs dos usuários")]              

Abrir filtro de nível em logs dos usuários
    Wait Until Element Is Visible    //*[@id="panel1a-content"]/div/div/form/div[1]/div[4]/div/div/div/div/div
    Click Element                    //*[@id="panel1a-content"]/div/div/form/div[1]/div[4]/div/div/div/div/div

Filtrar por nível info em logs dos usuários
    Wait Until Element Is Visible    //*[@id="menu-"]/div[3]/ul/li[1]
    Click Element                    //*[@id="menu-"]/div[3]/ul/li[1]

Filtrar por nível error em logs dos usuários
    Wait Until Element Is Visible    //*[@id="menu-"]/div[3]/ul/li[2]
    Click Element                    //*[@id="menu-"]/div[3]/ul/li[2]

Filtrar por data em logs dos usuários
    Wait Until Element Is Visible    //*[@id="panel1a-content"]/div/div/form/div[1]/div[5]/div/div/label/div
    Click Element                    //*[@id="panel1a-content"]/div/div/form/div[1]/div[5]/div/div/label/div

    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[5]/div/div/label/div/div[1]/input    ${FIRST_DATE}
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[5]/div/div/label/div/div[1]/input    ENTER

    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[5]/div/div/label/div/div[3]/input    ${LAST_DATE}
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[5]/div/div/label/div/div[3]/input    ENTER

Abrir filtro de ação em logs dos usuários
    Wait Until Element Is Visible    //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/div/div/div
    Click Element                    //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/div/div/div

Filtrar por auth_failed em logs dos usuários
    Wait Until Element Is Visible    xpath=//*[contains(text(), "auth_failed")]
    Click Element                    xpath=//*[contains(text(), "auth_failed")]

Clicar no ícone de detalhes de log de usuário
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[7]/div/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[7]/div/button

Visualizar detalhes do log de usuário
    Wait Until Element Is Visible    xpath=//*[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary" and @type="button"]
    Sleep    1s

Fechar detalhes de log de usuário
    Click Element                    xpath=//*[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary" and @type="button"]
    Sleep    1s

