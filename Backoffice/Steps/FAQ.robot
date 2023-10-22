*** Settings ***
Library         SeleniumLibrary    timeout=500

*** Variables ***
${FIRST_DATE}    10/11/2022
${LAST_DATE}     10/12/2022
${TITLE_1}         Tópico de teste automatizado para usuários logados! HI HI
${TITLE_2}         Tópico de teste automatizado para usuários não logados! HI HI
${TITLE_EDITED}    Tópico de teste automatizado editado! HI HI
${QUESTION_TITLE}    Questão TESTE
${BODY_TITLE}        Questão TESTE

*** Keywords ***
Clicar no botão FAQ na abba de configurações
    Wait Until Element Is Visible    xpath=//*[contains(text(), "FAQ")]    
    Click Element                    xpath=//*[contains(text(), "FAQ")]    

Clicar no botão adicionar (Configurações / FAQ)
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/a/div/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/a/div/button

Inserir nome do tópico para usuários logados (FAQ / Tópico de FAQ)
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/a/div/button
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/a/div/button    ${TITLE_1}

Inserir nome do tópico para usuários não logados (FAQ / Tópico de FAQ)
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/a/div/button
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/a/div/button    ${TITLE_2}

Clicar em usuários logados (FAQ / Tópico de FAQ)
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[2]/div/div/fieldset/div[2]/label[1]/span[1]/span[1]/input

Clicar em usuários não logados (FAQ / Tópico de FAQ)
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[2]/div/div/fieldset/div[2]/label[2]/span[1]/span[1]/input

Clicar no botão adicionar (FAQ / Tópico de FAQ)
    Click Button                     Adicionar

Editar título da postagem (FAQ)
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/a/div/button
    Press Keys                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/a/div/button    HOME    SHIFT+END+BACKSPACE    ${TITLE_EDITED}

Verificar edição da postagem (FAQ)
    Page Should Not Contain          ${TITLE_1}
    Page Should Contain              ${TITLE_EDITED}

Alterar a ordem de algum tópico
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[5]/div/button[1]
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[5]/div/button[1]

Clicar no ícone de excluir tópico
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[8]/div/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[8]/div/button

Clicar no ícone de questão (FAQ)
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[6]/div/a/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[6]/div/a/button

Clicar no ícone de adicionar (FAQ / TÓPICO / QUESTÃO)
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div[1]/div/a/div/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div[1]/div/a/div/button

Inserir título da questão do tópico
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[1]/div/div/div/div/input
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[1]/div/div/div/div/input    ${QUESTION_TITLE}

Inserir mensagem da questão do tópico
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[2]/div/div/div/div/textarea











