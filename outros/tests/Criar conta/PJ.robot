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

Criar conta - primeiros passos

    Wait Until Page Contains Element    xpath=//*[@class="login__container__form__inner__link-text"]
    Click Button    Criar conta
    Click Element    xpath=//*[@class="account-type__content__type"]
    Click Button    Continuar

    #CNPJ
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[1]/div/div/div/input    ${CNPJ}  
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[2]/div/div/div/input    Empresa de Pãoes LTDA
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[3]/div/div/div/input    Empresa de Pãoes LTDA
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[4]/div[1]/div/div/div/input    teste@gmail.com
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[4]/div[2]/div/div/div/input    89981242944
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[5]/div[1]/div/div/div/input    200000
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[5]/div[2]/div/div/div/input    22041999
    
    # Ramo de atividade
    Click Element    //*[@id="mui-2"]
    Wait Until Page Contains Element   xpath=//*[@id="mui-2-option-4"]
    Click Element    xpath=//*[@id="mui-2-option-4"]

    #Categoria
    Click Element    //*[@id="mui-4"]
    Wait Until Page Contains Element   xpath=//*[@id="mui-4-option-5"]
    Click Element    xpath=//*[@id="mui-4-option-5"]

    # CNAE
    Input Text    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[7]/div[2]/div/div/div/input    2910701
    Aguardar load da página

    # Inscrição isenta
    Click Element    //*[@id="rc-tabs-0-panel-1"]/div/div/form/div[8]/div[2]/div/label/span[1]/span[1]/input

    Click Element    //*[@id="mui-6"]
    Wait Until Page Contains Element   xpath=//*[@id="mui-6-option-2"]
    Click Element    xpath=//*[@id="mui-6-option-2"]

    Click Button    Continuar
    Aguardar load da página

Verificação de sms

    Input Text    //*[@id="rc-tabs-0-panel-2"]/div/div[2]/form/div/div[2]/div/div/div/input    112233
    Wait Until Page Contains Element   //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button
    Click Element    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button
    Aguardar load da página

Representante

    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[1]/div/div/div/input    06718676365
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[2]/div/div/div/input    Roseane Franco
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[3]/div/div/div/input    Francisca Maria da silva
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[4]/div/div/div/input    teste@gmail.com
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[5]/div[1]/div/div/div/input    89981242935
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[5]/div[2]/div/div/div/input    22091998
    Input Text    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[6]/div[2]/div/div/div/input    99

    Click Element    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[6]/div[1]/div/div/div/div
    Wait Until Page Contains Element   //*[@id="menu-"]/div[3]/ul/li[1]
    Click Element    //*[@id="menu-"]/div[3]/ul/li[1]

    Wait Until Page Contains Element    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[7]/div[1]/button
    Click Element    //*[@id="rc-tabs-0-panel-9"]/div/div/form/div[7]/div[1]/button
    Aguardar load da página

Termos

    Wait Until Page Contains Element    xpath=//*[@class="terms-of-use__text"]
    Click Element    //*[@id="rc-tabs-0-panel-4"]/div/div/div/label/span[1]/span[1]
    Sleep    1s
    Click Element    //*[@id="root"]/div/div/div[1]/div/div[3]/div[1]/div/button
    Aguardar load da página

Credenciais

    Wait Until Page Contains Element    //*[@id="rc-tabs-0-panel-3"]/div/div/form/div[1]/div/div/div/input
    Input Text    //*[@id="rc-tabs-0-panel-3"]/div/div/form/div[1]/div/div/div/input    ${NAME}
    Input Text    //*[@id="rc-tabs-0-panel-3"]/div/div/form/div[2]/div[1]/div/div/input    Pass123123
    Sleep    2s
    Click Button    Continuar
    Aguardar load da página

SMS

    Input Text    //*[@id="root"]/div/div/div/div[2]/div/div/div/div/div/input    112233
    Sleep    1s
    Click Button    Entrar
    Aguardar load da página

Endereço

    Input Text    //*[@id="rc-tabs-3-panel-5"]/div/div[1]/div/div/div/input    64600184
    Aguardar load da página
    Input Text    //*[@id="rc-tabs-3-panel-5"]/div/div[4]/div[1]/div/div/div/div/input    23
    Sleep    1s
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
                   
    
