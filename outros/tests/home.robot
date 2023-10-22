*** Settings ***
Documentation   Backoffice - Bankeiro - B UNI
Library         SeleniumLibrary    timeout=500

*** Variables ***
${browser}           chrome
${url}               https://ibk.beta.bankeiro.com/

*** Keywords ***

Iniciar sessão
    Open Browser    ${url}  ${browser}

    Maximize Browser Window 

Encerra sessão 
    Capture Page Screenshot
    Sleep    2s
    Close Browser