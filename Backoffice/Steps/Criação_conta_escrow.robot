*** Settings ***
Library         SeleniumLibrary    timeout=500
Library         FakerLibrary    locale=pt-br

*** Variables ***
${COMPANY}                             
${COMPANY_EMAIL}                       yam.carrasco@mblabs.com.br
${COMPANY_CNPJ}
${COMPANY_OPENING_DATE}                22/04/1999
${CEP}                                 64600174
${NUMBER}                              234
${COMPANY_STATE_REGISTRATION}          23327282
${COMPANY_MONTHLY_INVOICING}           200000
${CNAE}                                2910701
${REPRESENTATIVE_CELLPHONE}            89981242943
${REPRESENTATIVE_MOTHER_NAME}          Maria Rita de Sousa
${REPRESENTATIVE_NAME}                 FakerLibrary.name
${REPRESENTATIVE_CNPJ}                 FakerLibrary.cnpj

*** Keywords ***
Clicar em criação de conta
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Criação de conta")]   
    Click Element                    xpath=//*[contains(text(), "Criação de conta")]   

Digitar nome da empresa
    ${COMPANY}    FakerLibrary.Company
    ${lastName}    FakerLibrary.Suffix
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[1]/div/div/div/div/input    ${COMPANY}    ${lastName}

Digitar nome fantasia
    ${COMPANY}    FakerLibrary.Company
    ${lastName}    FakerLibrary.Suffix
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[2]/div/div/div/div/input    ${COMPANY}    ${lastName}

Digitar cnpj
    ${COMPANY_CNPJ}    FakerLibrary.Cnpj
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[3]/div/div/div/div/input    ${COMPANY_CNPJ}

Digitar email
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[4]/div[1]/div/div/div/div/input    ${COMPANY_EMAIL}

Digitar telefone
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[4]/div[2]/div/div/div/div/input    ${REPRESENTATIVE_CELLPHONE}

Digitar data de abertura
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[4]/div[3]/div/div/div/div/input    ${COMPANY_OPENING_DATE}

Digitar CEP
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[6]/div[1]/div/div/div/div/input    ${CEP}
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]

Digitar número do estabelecimento
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[6]/div[3]/div/div/div/div/input    ${NUMBER}

Seleção do ramo de atuação
    Wait Until Element Is Visible    //*[@id="mui-2"]
    Click Element                    //*[@id="mui-2"]
    Wait Until Element Is Visible    //*[@id="mui-2-option-4"]
    Click Element                    //*[@id="mui-2-option-4"]

Seleção do tipo de empresa
    Click Element                    //*[@id="mui-4"]
    Wait Until Element Is Visible    //*[@id="mui-4-option-2"]
    Click Element                    //*[@id="mui-4-option-2"]

Digitar inscrição estadual
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[10]/div[2]/div/div/div/div/input    ${COMPANY_STATE_REGISTRATION}

Digitar CNAE
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[10]/div[3]/div/div/div/div/input    ${CNAE}

Digitar renda mensal
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[10]/div[4]/div/div/div/div/input    ${COMPANY_MONTHLY_INVOICING}

Seleção do fundo
    Click Element                    //*[@id="mui-6"]
    Wait Until Element Is Visible    //*[@id="mui-6-option-2"]
    Click Element                    //*[@id="mui-6-option-2"]

    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[12]/div[2]/div/div/div/div/div
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[12]/div[2]/div/div/div/div/div
    Wait Until Element Is Visible    //*[@id="menu-"]/div[3]/ul/li
    Click Element                    //*[@id="menu-"]/div[3]/ul/li
    Double Click Element             //*[@id="root"]

Digitar nome do representante
    ${REPRESENTATIVE_NAME}    FakerLibrary.Name
    ${lastName}               FakerLibrary.Last Name

    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[14]/div[1]/div/div/div/div/input
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[14]/div[1]/div/div/div/div/input
    Input Text                       //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[14]/div[1]/div/div/div/div/input    ${REPRESENTATIVE_NAME}    ${lastName}

Digitar nome da mãe do representante
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[14]/div[2]/div/div/div/div/input    ${REPRESENTATIVE_MOTHER_NAME}

Seleção do tipo de representante
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[15]/div[1]/div/div/div/div
    Wait Until Element Is Visible    //*[@id="menu-"]/div[3]/ul/li[2]
    Click Element                    //*[@id="menu-"]/div[3]/ul/li[2]

Digitar CNPJ do representante
    ${REPRESENTATIVE_CNPJ}    FakerLibrary.Cnpj
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[15]/div[2]/div/div/div/div/input
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[15]/div[2]/div/div/div/div/input
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[15]/div[2]/div/div/div/div/input    ${REPRESENTATIVE_CNPJ}

Digitar email do representante
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[15]/div[3]/div/div/div/div/input    ${COMPANY_EMAIL}

Digitar telefone do representante
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[16]/div[1]/div/div/div/div/input    ${REPRESENTATIVE_CELLPHONE}

Digitar porcentagem do representante
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[16]/div[2]/div/div/div/div/input    ${NUMBER}

Digitar data de nascimento do representante
    Input Text                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[16]/div[3]/div/div/div/div/input    ${COMPANY_OPENING_DATE}

Clicar no botão
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[19]/div/div/div/div/button



