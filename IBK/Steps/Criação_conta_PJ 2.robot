*** Settings ***
Library         SeleniumLibrary    timeout=500
Library         FakerLibrary    locale=pt_BR
Library    ScreenCapLibrary    screenshot_directory=videos


*** Variables ***

${COMPANY_CNPJ}
${COMPANY}
${COMPANY_EMAIL}
#${COMPANY_CELLPHONE}    89981242943
${COMPANY_CELLPHONE}    19997970455
${COMPANY_MONTHLY_INVOICING}    200000
${COMPANY_OPENING_DATE}    17/03/2000

${REPRESENTATIVE_NAME}                FakerLibrary.name
${REPRESENTATIVE_CPF}                 FakerLibrary.cpf
${REPRESENTATIVE_MOTHER_NAME}    Maria Rita de Sousa
${REPRESENTATIVE_BIRTHDAY}    22/04/1999
${REPRESENTATIVE_CELLPHONE}    89981242943
${REPRESENTATIVE_EMAIL}    yam.carrasco@mblabs.com.br
${CÓDIGO_SMS}    112233
${USER_PASSWORD}    Pass123123
${POSTAL_CODE}    64600174
${HOUSE_NUMBER}    324
${REPRESENTATIVE_DOCUMENT}     C:\\Users\\yamfo\\Downloads\\CPF 819.942.440-03.jpg
${REPRESENTATIVE_PHOTO}         C:\\Users\\yamfo\\Downloads\\CPF 819.942.440-03.jpg

*** Test Cases ***

Abrir navegador
    #Start Video Recording    name=PJ
    Open Browser    https://ibk.homolog.redscd.com.br/    chrome
    #Open Browser    https://ibk.stg.bankeiro.inovanti.com.br/    chrome
    #Open Browser    https://ibk.bank.hurb.com/    chrome
    #Open Browser    https://ibk.bankeiro.esiga.com.br/    chrome

    Maximize Browser Window

Clicar na opção de criar conta
    #Start Video Recording    name=PJ
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[2]/div[2]/div/div/form/div/div/div[3]/button[3]    30s
    Click Element                    //*[@id="root"]/div/div/div[2]/div[2]/div/div/form/div/div/div[3]/button[3]

Escolher tipo de conta de pessoa física
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div/div[1]/div[2]/div[2]    10s
    Click Element    //*[@id="root"]/div/div/div[1]/div/div[1]/div[2]/div[2]
    Click Button    Continuar

Digitar cnpj
    ${COMPANY_CNPJ}    FakerLibrary.Cnpj
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[1]/div/div/div/input
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[1]/div/div/div/input    ${COMPANY_CNPJ}

Digitar razão social
    ${COMPANY}    FakerLibrary.Company
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[2]/div/div/div/input    ${COMPANY}

Digitar nome fantasia
    ${COMPANY}    FakerLibrary.Company
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[3]/div/div/div/input    ${COMPANY}

Digitar email
    ${COMPANY_EMAIL}    FakerLibrary.Company Email
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[4]/div[1]/div/div/div/input    ${COMPANY_EMAIL}

Digitar número de telefone
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[4]/div[2]/div/div/div/input    ${COMPANY_CELLPHONE}

Digitar faturamento mensal
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[5]/div[1]/div/div/div/input    ${COMPANY_MONTHLY_INVOICING}

Digitar data de abertura da empresa
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[5]/div[2]/div/div/div/input    ${COMPANY_OPENING_DATE}

Digitar ramo de atividade
    Click Element    //*[@id="mui-2"]
    Wait Until Page Contains Element   xpath=//*[@id="mui-2-option-3"]
    Click Element    xpath=//*[@id="mui-2-option-3"]

Digitar categoria da empresa
    Click Element    //*[@id="mui-4"]
    Wait Until Page Contains Element   xpath=//*[@id="mui-4-option-5"]
    Click Element    xpath=//*[@id="mui-4-option-5"]

Digitar CNAE
    ${OTHER}    Set Variable    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[7]/div[2]/div/div/div/input    
    ${HURB}    Set Variable    xpath=//*[@id="rc-tabs-0-panel-1"]/div/div/form/div[6]/div[2]/div/div/div/input

    Input Text    ${HURB}    29107
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]
    Input Text    ${HURB}    0
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]
    Input Text    ${HURB}    1
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]

Clicar em Inscrição isenta
    ${HURB}    Set Variable    xpath=//*[@id="rc-tabs-0-panel-1"]/div/div/form/div[7]/div[2]/div/label/span[1]/span[1]/input
    ${OTHER}    set variable    xpath=//*[@id="rc-tabs-0-panel-1"]/div/div/form/div[8]/div[2]/div/label/span[1]/span[1]/input
    Click Element    ${HURB}

#Selecionar código de estatística fianceira
    #Click Element    //*[@id="mui-6"]
    #Wait Until Element Is Visible   xpath=//*[contains(text(), "SETOR PRIVADO RURAL")]
    #Click Element    xpath=//*[contains(text(), "SETOR PRIVADO RURAL")]

Clicar no botão
    Click Button    Continuar

Digitar código sms
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-2"]/div/div[2]/form/div/div[2]/div/div/div/input    500s
    Sleep    1s
    Input Text                       //*[@id="rc-tabs-0-panel-2"]/div/div[2]/form/div/div[2]/div/div/div/input    ${CÓDIGO_SMS}

Clicar no botão confirmar
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button
    Click Element                        //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button

Digitar cpf/cnpj do representante
    ${REPRESENTATIVE_CPF}    FakerLibrary.Cpf
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[1]/div/div/div/input
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[1]/div/div/div/input    ${REPRESENTATIVE_CPF}

Digitar nome completo do representante
    ${REPRESENTATIVE_NAME}    FakerLibrary.Name
    ${lastName}    FakerLibrary.Last Name
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[2]/div/div/div/input    ${REPRESENTATIVE_NAME}    ${lastName}

Digitar nome da mãe
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[3]/div/div/div/input    ${REPRESENTATIVE_MOTHER_NAME}

Digitar email
    ${REPRESENTATIVE_EMAIL}    FakerLibrary.Email
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[4]/div/div/div/input    ${REPRESENTATIVE_EMAIL}

Digitar celular
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[5]/div[1]/div/div/div/input    ${REPRESENTATIVE_CELLPHONE}

Digitar data de nascimento
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[5]/div[2]/div/div/div/input    ${REPRESENTATIVE_BIRTHDAY}

Selecionar tipo de representante
    Click Element    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[6]/div[1]/div/div/div/div
    Wait Until Element Is Visible  //*[@id="menu-"]/div[3]/ul/li[1]
    Click Element    //*[@id="menu-"]/div[3]/ul/li[1]

Digitar porcentagem do representante
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[6]/div[2]/div/div/div/input    90

Digitar CEP
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[7]/div[1]/div[1]/div/div/div/input
    Input Text                       //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[7]/div[1]/div[1]/div/div/div/input    ${POSTAL_CODE}
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]

Digitar número
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[7]/div[3]/div[1]/div/div/div/div/input
    Input Text                       //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[7]/div[3]/div[1]/div/div/div/div/input    ${HOUSE_NUMBER}

Clicar no botão confirmar
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[8]/div[1]/button
    Click Element    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[8]/div[1]/button
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]

Clicar em aceitar termos de uso
    Wait Until Element Is Visible     //*[@id="rc-tabs-0-panel-4"]/div/div/div/label/span[1]/span[1]
    Click Element                     //*[@id="rc-tabs-0-panel-4"]/div/div/div/label/span[1]/span[1]

Clicar no botão continuar
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button
    Click Element                     //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button

Digitar usuário para login
    ${COMPANY_CNPJ}                 FakerLibrary.Cpf
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-3"]/div/div/form/div[1]/div/div/div/input
    Input Text    //*[@id="rc-tabs-0-panel-3"]/div/div/form/div[1]/div/div/div/input    T${COMPANY_CNPJ}

Digitar senha de acesso
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-3"]/div/div/form/div[2]/div[1]/div/div/input
    Input Text    //*[@id="rc-tabs-0-panel-3"]/div/div/form/div[2]/div[1]/div/div/input    ${USER_PASSWORD}

Clicar no botão Continuar 1
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button
    Click Element                    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button

Digitar CEP
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-5"]/div/div[1]/div/div/div/input
    Input Text                       //*[@id="rc-tabs-0-panel-5"]/div/div[1]/div/div/div/input    ${POSTAL_CODE}
    Sleep    1s

Digitar número
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-5"]/div/div[4]/div[1]/div/div/div/div/input
    Input Text                       //*[@id="rc-tabs-0-panel-5"]/div/div[4]/div[1]/div/div/div/div/input    ${HOUSE_NUMBER}

Clicar no botão Confirmar 1
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button
    Click Element                    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button

#Clicar em Comprovante da situação cadastral
    #Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-6"]/div[1]/div[1]
    #Click Element    //*[@id="rc-tabs-0-panel-6"]/div[1]/div[1]
    #Sleep    1s
    #Choose File    //*[@id="user-photo-file"]    ${REPRESENTATIVE_DOCUMENT}
    #Sleep    1s
    #Click Button    Confirmar

Clicar em documentos
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-6"]/div[1]/div[1]
    Click Element    //*[@id="rc-tabs-0-panel-6"]/div[1]/div[1]
    Sleep    1s
    Choose File    //*[@id="file-cnh"]    ${REPRESENTATIVE_DOCUMENT}
    Sleep    1s
    Click Button    Confirmar

Clicar em selfie
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-6"]/div[2]/div[1]
    Click Element    //*[@id="rc-tabs-0-panel-6"]/div[2]/div[1]
    Sleep    1s
    Choose File    //*[@id="user-photo-file"]    ${REPRESENTATIVE_PHOTO}
    Sleep    1
    Click Button    Confirmar
    Sleep    1s

Clicar em continuar 2
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button
    Click Element    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]

Confirmar representantes existentes
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div/div[3]/div[2]/div/button
    Click Element    //*[@id="root"]/div/div/div[1]/div/div[3]/div[2]/div/button
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]
    Sleep    1s

Digitar PIN
    Sleep    1s
    Click Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[1]
    Click Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[2]
    Click Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[4]
    Click Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[5]
    Click Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[7]
    Click Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[8]
    
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button
    Click Element    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]
    
    Sleep    1s
    #Stop Video Recording
    #Close Browser