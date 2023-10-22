*** Settings ***
Library         SeleniumLibrary    timeout=500

*** Variables ***
${FERIADO_NOME}                       DIA DO CARRASCO
${FERIADO_DATA}                       22/12/2023
${NOME_FERIADO_EDIÇÃO}                DIA DO FONTALBA
${DATA_FERIADO_EDIÇÃO}                30/10/2023

*** Keywords ***
Clicar no botão Feriados
    Wait Until Element Is Visible     xpath=//*[contains(text(), "Feriados")]
    Click Element                     xpath=//*[contains(text(), "Feriados")]

Clicar no botão adicionar (Feriados)
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div/a/div/button
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div/a/div/button

Digitar nome do feriado
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[1]/div/div/div/div/input
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[1]/div/div/div/div/input    ${FERIADO_NOME}

Digitar data do feriado
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[1]/div[2]/div/div/div/div/input    HOME    SHIFT+END+BACKSPACE    2${FERIADO_DATA}

Clicar no botão adicionar (FERIADOS > ADICIONAR FERIADO)
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/form/div[2]/div/div/div/button

Filtrar feriados pelo nome
    Wait Until Element Is Visible     //*[@id="panel1a-content"]/div/div/form/div[1]/div[1]/div/div/div/div/input
    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[1]/div/div/div/div/input    ${FERIADO_NOME}

Filtrar feriados pela data
    Wait Until Element Is Visible     //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/input
    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/input    ${DATA_FERIADO_EDIÇÃO}

Clicar no ícone de editar (FERIADOS)
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[3]/div/button
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[3]/div/button

Editar nome do feriado
    Wait Until Element Is Visible     xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/form/div[1]/div[1]/div/div/div/div/input
    Press Keys                        xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/form/div[1]/div[1]/div/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${NOME_FERIADO_EDIÇÃO}

Editar data do feriado
    Press Keys                        xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/form/div[1]/div[2]/div/div/div/div/input    HOME    SHIFT+END+BACKSPACE    0${DATA_FERIADO_EDIÇÃO}

Clicar no botão de salvar (EDIÇÃO DE FERIADO)
    Click Element                     xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/form/div[2]/div/div/div/button

Clicar no ícone de remover (FERIADOS)
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[4]/div/button
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[4]/div/button


    