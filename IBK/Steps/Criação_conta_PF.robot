*** Settings ***
Library         SeleniumLibrary    timeout=500
Library         FakerLibrary    locale=pt_BR
Library         ScreenCapLibrary

*** Variables ***

${USER_NAME}                FakerLibrary.name
${USER_CPF}                 FakerLibrary.cpf
${USER_MOTHER_NAME}    Maria Rita de Sousa
${USER_BIRTHDAY}    22/04/2000
${USER_EMAIL}    yam.carrasco@mblabs.com.br
${CÓDIGO_SMS}    112233
${USER_CELLPHONE}    19997970455
${USER_PASSWORD}    Pass123123
${POSTAL_CODE}    64600174
${HOUSE_NUMBER}    324
${USER_DOCUMENT}     C:\\Users\\yamfo\\Downloads\\CPF 819.942.440-03.jpg
${USER_PHOTO}         C:\\Users\\yamfo\\Downloads\\CPF 819.942.440-03.jpg

*** Keywords ***

Abrir navegador
    #Open Browser    https://ibk.homolog.redscd.com.br/    chrome
    #Open Browser    https://ibk.stg.bankeiro.inovanti.com.br/    chrome
    #Open Browser    https://ibk.bankeiro.deltaglobalbank.com.br/    chrome
    #Open Browser    https://ibk.stg.bankeiro.wohpag.com/    chrome
    #Open Browser    https://ibk.bank.hurb.com/    chrome
    #Open Browser    https://ibk.bankeiro.esiga.com.br/    chrome

    Close All Browsers

    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    #Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}

    Go To    https://ibk.bankeiro.esiga.com.br/
    
Clicar na opção de criar conta
    #Start Video Recording    name=PF
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[2]/div[2]/div/div/form/div/div/div[3]/button[3]    30s
    Click Element                    //*[@id="root"]/div/div/div[2]/div[2]/div/div/form/div/div/div[3]/button[3]

Escolher tipo de conta de pessoa física
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div/div[1]/div[2]/div[1]    10s
    Click Element    //*[@id="root"]/div/div/div[1]/div/div[1]/div[2]/div[1]
    Click Button    Continuar

Digitar CPF
    ${USER_CPF}                 FakerLibrary.Cpf
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[1]/div/div/div/input    ${USER_CPF}
    LOG    ${USER_CPF}

Digitar Nome completo
    ${USER_NAME}                FakerLibrary.Name
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[2]/div/div/div/input    ${USER_NAME}

Digitar Nome da mãe
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[3]/div/div/div/input    ${USER_MOTHER_NAME}

Digitar Email
    ${USER_EMAIL}                FakerLibrary.Email
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[4]/div/div/div/input    ${USER_EMAIL}

Digitar número de celular
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[5]/div[1]/div/div/div/input    ${USER_CELLPHONE}

Digitar data de nascimento
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[5]/div[2]/div/div/div/input    ${USER_BIRTHDAY}

Selecionar gênero
    Click Element    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[6]/div[1]/div/div/div/div
    Wait Until Page Contains Element   //*[@id="menu-"]/div[3]/ul/li[3]
    Click Element    //*[@id="menu-"]/div[3]/ul/li[3]

Selecionar ramo de atuação
    Click Element    //*[@id="mui-2"]
    Wait Until Element Is Visible   xpath=//*[contains(text(), "FÍSICO")]
    Click Element    xpath=//*[contains(text(), "FÍSICO")]

Selecionar código de estatística fianceira
    Click Element    //*[@id="mui-4"]
    Wait Until Element Is Visible   xpath=//*[contains(text(), "SETOR PRIVADO RURAL")]
    Click Element    xpath=//*[contains(text(), "SETOR PRIVADO RURAL")]

Confirmar primeiros passos
    #Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[9]/div/button
    #Click Element    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[9]/div/button
    Click Button    Continuar

Digitar código sms
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-2"]/div/div[2]/form/div/div[2]/div/div/div/input
    Input Text                       //*[@id="rc-tabs-0-panel-2"]/div/div[2]/form/div/div[2]/div/div/div/input    ${CÓDIGO_SMS}

Clicar no botão confirmar
    #Wait Until Element Is Visible     //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button
    Sleep    1s
    Click Element                        //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button

Clicar em aceitar termos de uso
    Wait Until Element Is Visible     //*[@id="rc-tabs-0-panel-4"]/div/div/div/label/span[1]/span[1]    20s
    Click Element                     //*[@id="rc-tabs-0-panel-4"]/div/div/div/label/span[1]/span[1]

Clicar no botão continuar
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button
    Click Element                     //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button

Politica de privacidade
    Wait Until Page Contains    Aceitar Política de Privacidade
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-13"]/div/div/div/label/span[1]/span[1]
    Click Element    //*[@id="rc-tabs-0-panel-13"]/div/div/div/label/span[1]/span[1]/input
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button
    Click Element    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button

Digitar usuário para login
    ${USER_CPF}                 FakerLibrary.cpf
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-3"]/div/div/form/div[1]/div/div/div/input    20s
    Input Text    //*[@id="rc-tabs-0-panel-3"]/div/div/form/div[1]/div/div/div/input    T${USER_CPF}

Digitar senha de acesso
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-3"]/div/div/form/div[2]/div[1]/div/div/input
    Input Text    //*[@id="rc-tabs-0-panel-3"]/div/div/form/div[2]/div[1]/div/div/input    ${USER_PASSWORD}

Clicar no botão Continuar 1
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button
    Click Element                    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button

Digitar CEP
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-5"]/div/div[1]/div/div/div/input
    Input Text                       //*[@id="rc-tabs-0-panel-5"]/div/div[1]/div/div/div/input    ${POSTAL_CODE}

Digitar número
    Sleep    1s
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-5"]/div/div[4]/div[1]/div/div/div/div/input
    Input Text                       //*[@id="rc-tabs-0-panel-5"]/div/div[4]/div[1]/div/div/div/div/input    ${HOUSE_NUMBER}

Clicar no botão Confirmar 1
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button
    Click Element                    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button

Clicar em documentos
    Wait Until Element Is Visible    //*[@id="rc-tabs-0-panel-6"]/div[1]/div[1]
    Click Element    //*[@id="rc-tabs-0-panel-6"]/div[1]/div[1]
    Sleep    1s
    Choose File    //*[@id="file-cnh"]    ${USER_DOCUMENT}
    Sleep    1s
    Click Button    Confirmar

Clicar em selfie
    Click Element    //*[@id="rc-tabs-0-panel-6"]/div[2]/div[1]
    Sleep    1s
    Choose File    //*[@id="user-photo-file"]    ${USER_PHOTO}
    Sleep    1
    Click Button    Confirmar
    Sleep    1s

Clicar em continuar 2

    #Click Element    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button
    Click Element    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]    500s
    Sleep    1s

Digitar PIN
    Click Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[1]
    Click Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[2]
    Click Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[4]
    Click Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[5]
    Click Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[7]
    Click Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[8]

    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button
    Click Element    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]

    ${pin_error}=    Run Keyword And Return Status    Page Should Not Contain Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[1]

    WHILE  ${pin_error} != True
        Sleep    1s
        Click Element    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/button
        Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]

        ${error}=    Run Keyword And Return Status    Page Should Not Contain Element    //*[@id="rc-tabs-0-panel-7"]/div/div/div[3]/p[1]

        Run Keyword If    '${error}' == 'True'    Exit For Loop
    END
    
    

    #Stop Video Recording
    #Close Browser