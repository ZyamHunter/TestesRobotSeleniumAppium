*** Settings ***
Documentation   Backoffice - Bankeiro - Red Asset
Library         SeleniumLibrary    timeout=500

*** Variables ***
${browser}           chrome
##${url}               https://admin.beta.bankeiro.com/
${url}                 http://localhost:3000/

*** Keywords ***

Iniciar sessão
    Open Browser    ${url}  ${browser}

    Maximize Browser Window 

Encerra sessão 
    Capture Page Screenshot
    Sleep    2s
    Close Browser