*** Settings ***
Resource         home.robot
Library           FakerLibrary

*** Variables ***
## No Windows coloque barra dupla assim como mostra o exemplo abaixo!
${CNH}    C:\\Users\\yamfo\\Downloads\\coca.jpg
${SELFIE}    C:\\Users\\yamfo\\Downloads\\coca.jpg
${NAME}    FakerLibrary.Name

${CNPJ}    66.865.449/0001-20

*** Test Cases ***

Abri navegador

    Iniciar sessão

Escolher tipo de conta

    Wait Until Page Contains Element    xpath=//*[@class="login__container__form__inner__link-text"]
    Click Button    Criar conta
    Click Element    xpath=//*[@class="account-type__content__type"]
    Click Button    Continuar

Criar conta - primeiros passos

    # input CPF

    Wait Until Page Contains Element    //*[@id="rc-tabs-1-panel-1"]/div/div/form/div[1]/div/div/div/input
    Input Text    //*[@id="rc-tabs-1-panel-1"]/div/div/form/div[1]/div/div/div/input    

    # input nome completo

    # input nome da mãe

    # input de email

    # input de celular

    # ramo de atuação

    # genênro

    # código de estatística financeira

Credenciais

    Input Text    //*[@id="rc-tabs-2-panel-3"]/div/div/form/div[1]/div/div/div/input    ${NAME}
    Input Text    //*[@id="rc-tabs-2-panel-3"]/div/div/form/div[2]/div[1]/div/div/input    Pass123123
    Click Button    Continuar
    Aguardar load da página

SMS

    Input Text    //*[@id="root"]/div/div/div/div[2]/div/div/div/div/div/input    112233
    Click Button    Entrar
    Aguardar load da página

Endereço

    Input Text    //*[@id="rc-tabs-3-panel-5"]/div/div[1]/div/div/div/input    64600184
    Aguardar load da página
    Input Text    //*[@id="rc-tabs-3-panel-5"]/div/div[4]/div[1]/div/div/div/div/input    23
    Click Button    Continuar

Documentos

    Click Element    //*[@id="rc-tabs-3-panel-6"]/div[1]/div[1]/div/div/p[2]
    Wait Until Page Contains Element    //*[@id="file-cnh"]
    Choose File    //*[@id="file-cnh"]    ${CNH}
    Wait Until Page Contains Element    xpath=//*[contains(text(), "Confirmar")]
    Click Button    Confirmar

    Click Element    //*[@id="rc-tabs-3-panel-6"]/div[2]/div[1]/div/div/p[2]
    Sleep    1s
    Choose File    //*[@id="user-photo-file"]    ${SELFIE}
    Sleep    1
    Click Button    Confirmar
    Sleep    1s

    Click Button    Continuar
    Aguardar load da página

    #Continuar de novo
    Click Button    Continuar
    Aguardar load da página
    Sleep    1s

PIN

    Click Element    xpath=//*[contains(text(), "1")]
    Click Element    xpath=//*[contains(text(), "2")]
    Click Element    xpath=//*[contains(text(), "4")]
    Click Element    xpath=//*[contains(text(), "5")]
    Click Element    xpath=//*[contains(text(), "7")]
    Click Element    xpath=//*[contains(text(), "8")]
    
    Click Button    Continuar
    Aguardar load da página

*** Keywords ***

Aguardar load da página

    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]
                   
    
