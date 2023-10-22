*** Settings ***
Library         SeleniumLibrary    timeout=500
Library         FakerLibrary    locale=pt-br

*** Variables ***
${COMPANY}
${COMPANY_CNPJ}
${COMPANY_EMAIL}
${CEP}                               64600174
${NUMBER}                            345
${CONTRACT}                          C:\\Users\\yamfo\\Downloads\\CONTRATO.html

*** Keywords ***
Clicar no botão de administrador de fundo
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Administrador de Fundo")]              
    Click Element                    xpath=//*[contains(text(), "Administrador de Fundo")]       

Clicar no botão adicionar - administrador de fundo
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div/a/div/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div/a/div/button

Digitar razão social - administrador de fundo
    ${COMPANY}    FakerLibrary.Company
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[4]/div/div[1]/div/div/div/input
    Press Keys                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[4]/div/div[1]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${COMPANY}

Digitar email - administrador de fundo
    ${COMPANY_EMAIL}    FakerLibrary.Email
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[4]/div/div[2]/div/div/div/input
    Press Keys                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[4]/div/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${COMPANY_EMAIL}

Digitar cnpj - administrador de fundo
    ${COMPANY_CNPJ}    FakerLibrary.Cnpj
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[4]/div/div[3]/div/div/div/input
    Press Keys                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[4]/div/div[3]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${COMPANY_CNPJ}

Digitar CEP - administrador de fundo
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[7]/div[1]/div/div/div/div/input
    Press Keys                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[7]/div[1]/div/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${CEP}

Digitar número da casa - administrador de fundo
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[8]/div[2]/div/div/div/div/input
    Press Keys                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[8]/div[2]/div/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${NUMBER}

Adicionar contrato no administrador de fundo
    Choose File    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[16]/div[1]/div/input    ${CONTRACT}
    Wait Until Page Contains Element    xpath=//*[contains(text(), "CONTRATO.html")]       

Clicar no botão para adicionar administrador de fundo
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[15]/div/div/div/button

Clicar no ícone de detalhes - administrador de fundo
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[4]/div/a/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[4]/div/a/button

Clicar no botão salvar - administrador de fundo
    Click Button    Salvar

    ### Voltando para a tela de administradores de fundo
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Administrador de Fundo")]              
    Click Element                    xpath=//*[contains(text(), "Administrador de Fundo")]  

Clicar no botão remover - administrador de fundo
    Click Button    Remover