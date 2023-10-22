*** Settings ***
Library    SeleniumLibrary
Library    ScreenCapLibrary    screenshot_directory=videos

Resource    ../Steps/Criação_conta_PF.robot

*** Test Cases ***
PF
    Abrir navegador
    #Start Video Recording    name=PF
    Clicar na opção de criar conta
    Escolher tipo de conta de pessoa física
    Digitar CPF
    Digitar Nome completo
    Digitar Nome da mãe
    Digitar Email
    Digitar número de celular
    Digitar data de nascimento
    #Selecionar gênero
    #Selecionar ramo de atuação
    #Selecionar código de estatística fianceira
    Confirmar primeiros passos
    

Loop
    FOR    ${index}    IN RANGE    10
        Abrir navegador
        Clicar na opção de criar conta
        Escolher tipo de conta de pessoa física
        Digitar CPF
        Digitar Nome completo
        Digitar Nome da mãe
        Digitar Email
        Digitar número de celular
        Digitar data de nascimento
        Selecionar gênero
        Selecionar ramo de atuação
        Selecionar código de estatística fianceira
        Confirmar primeiros passos
        Digitar código sms
        Clicar no botão confirmar
        Clicar em aceitar termos de uso
        Clicar no botão continuar
        Digitar usuário para login
        Digitar senha de acesso
        Clicar no botão Continuar 1
        Digitar CEP
        Digitar número
        Clicar no botão Confirmar 1
        Clicar em documentos
        Clicar em selfie
        #Sleep    5s
        Clicar em continuar 2
        Digitar PIN
        Sleep    1s
        Close Browser
    END

Loop PF
    FOR    ${index}    IN RANGE    10
        Run Keyword And Continue On Failure  Creat PF
        Sleep    1s
        Close All Browsers
        Sleep    200S
    END

*** Keywords ***
Creat PF
    Abrir navegador
    Clicar na opção de criar conta
    Escolher tipo de conta de pessoa física
    Digitar CPF
    Digitar Nome completo
    Digitar Nome da mãe
    Digitar Email
    Digitar número de celular
    Digitar data de nascimento
    Confirmar primeiros passos
    Digitar código sms
    Clicar no botão confirmar
    Clicar em aceitar termos de uso
    Clicar no botão continuar
    Politica de privacidade
    Digitar usuário para login
    Digitar senha de acesso
    Clicar no botão Continuar 1
    Digitar CEP
    Digitar número
    Clicar no botão Confirmar 1
    Clicar em documentos
    Clicar em selfie
    Clicar em continuar 2
    Digitar PIN