*** Settings ***
Documentation   Backoffice - Bankeiro - Red Asset
Library         SeleniumLibrary    timeout=500

*** Variables ***
${browser}           chrome
#${url}               https://admin.beta.bankeiro.com/
${url}                 https://ibk.homolog.redscd.com.br/

*** Keywords ***

Iniciar sessão
    Open Browser    ${url}  ${browser}

    Maximize Browser Window 

Encerra sessão 
    Capture Page Screenshot
    Sleep    2s
    Close Browser