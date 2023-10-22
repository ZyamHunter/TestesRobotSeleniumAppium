*** Settings ***
Library         SeleniumLibrary    timeout=500
Library         FakerLibrary    locale=pt-br

*** Variables ***
${NAME}                    TESTE

*** Keywords ***
Clicar no botão adicionar - grupo de permissões
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div/a/div/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div/a/div/button

Clicar no ícone de detalhes - grupo de permissões
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[3]/div/a/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[3]/div/a/button

Digitar nome do grupo de permissões
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/input
    Press Keys                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${NAME}

Clicar em permissão do tipo de conta
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div/div[1]/div[2]/div/button[1]

Selecionar permissão do tipo conta
    Wait Until Page Contains Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div/div[2]/div[2]/div[1]/div/label/span[1]/input
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div/div[2]/div[2]/div[1]/div/label/span[1]/input

Clicar em permissão do tipo detalhes da conta
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div/div[1]/div[2]/div/button[2]

Selecionar permissão do tipo detalhes da conta
    Wait Until Page Contains Element    xpath=//*[contains(text(), "Atualizar nome")]  
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div/div[2]/div[2]/div[1]/div/label/span[1]/input

Clicar no botão Salvar para adicionar a permissão
    Click Button                     Salvar

Clicar no botão de grupo de permissões
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Grupo de permissões")]  
    Click Element                    xpath=//*[contains(text(), "Grupo de permissões")]  

Marcar mais um item do tipo conta
    Wait Until Page Contains Element    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div/div[2]/div[2]/div[2]/div/label/span[1]/input
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div/div[2]/div[2]/div[2]/div/label/span[1]/input

Marcar mais um item do tipo detalhes da conta
    Wait Until Page Contains Element    xpath=//*[contains(text(), "Atualizar email")]  
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[5]/div/div[2]/div[2]/div[2]/div/label/span[1]/input

Clicar no botão remover - grupo de permissões
    Sleep    1s
    Click Button                    Remover
    Sleep    1s

    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div[2]/div/button
    Click Element                    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div[2]/div/button

Filtrar por grupo de permissão
    Wait Until Element Is Visible    //*[@id="panel1a-content"]/div/div/form/div[1]/div[1]/div/div/div/div/input
    Input Text                       //*[@id="panel1a-content"]/div/div/form/div[1]/div[1]/div/div/div/div/input    ${NAME}

Filtrar grupo de permissão por data
    Click Element                     //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/label/div
    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/label/div/div[1]/input    18/11/2022
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/label/div/div[1]/input    ENTER
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/label/div/div[3]/input    30/12/2022
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/label/div/div[3]/input    ENTER

