*** Settings ***
Library         SeleniumLibrary    timeout=500
Library         Screenshot

*** Variables ***
${LOADING_IMAGE}                                xpath: //*[@testid="home_Loading"]
${LOGO_IMAGE}                                   xpath: //*[@testid="home_Logo"]
${LOGO_IMAGE_LOGIN_SCREEN}

*** Keywords ***
Verificar notificação de requisição 429
    Run Keyword And Return Status    Page Should Contain Element    xpath=//*[contains(text(), "REQUEST FAILED WITH STATUS CODE 429")]

Que o usuário esteja logado no sistema
    Wait Until Element Is Visible               ${LOGO_IMAGE}    30s
    Aguardar load da página

Esteja na tela inicial
    Page Should Contain                Internet Banking

Aguardar load da página
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]

Verificar notificação de erro
    Page Should Not Contain Element    //div[@class="ant-message-custom-content ant-message-error"]

Ir para a home page
    Wait Until Element Is Visible    //a[@class="panel-content-breadcrumb__menu__item__link panel-content-breadcrumb__menu__item__link--active"]
    Click Element                    //a[@class="panel-content-breadcrumb__menu__item__link panel-content-breadcrumb__menu__item__link--active"]
