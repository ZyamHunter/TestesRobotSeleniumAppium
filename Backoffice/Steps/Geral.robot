*** Settings ***
Library         SeleniumLibrary    timeout=500

*** Keywords ***
Aguardar load da página
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]
    Run Keyword And Continue On Failure        Verificar notificação de erro

Que esteja logado
#### Verificar logo
    Page Should Contain Element       xpath=//img[@class="login__form__inner__logo"]

Os resultados serão exibidos de acordo com os filtros estabelecidos
    Log Many
    #Page Should Not Contain Element    //div[@class="ant-message-custom-content ant-message-error"]

Abrir filtro
    Wait Until Element Is Visible     panel1a-header
    Click Element                     panel1a-header

Botão filtrar
    Click Button                      Filtrar

Limpar filtros
    Click Button                      Limpar filtros

Verificar notificação de erro
    Page Should Not Contain Element    //div[@class="ant-message-custom-content ant-message-error"]

Verificar notificação de requisição 429
    Run Keyword And Return Status    Page Should Contain Element    xpath=//*[contains(text(), "REQUEST FAILED WITH STATUS CODE 429")]

#Digitar email

#Digitar cpf

#Digitar cnpj

#Digitar nome de representante

#Digitar razão social