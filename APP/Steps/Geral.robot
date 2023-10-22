*** Settings ***
Library         SeleniumLibrary    timeout=500
Library         Screenshot

*** Keywords ***
Aguardar load da página
    Wait Until Page Does Not Contain Element    //img[@class="loading__inner__img"]
    