*** Settings ***
Documentation   Backoffice - Bankeiro - Red Asset
Library         SeleniumLibrary    timeout=500
##Library         Browser

*** Variables ***
${browser}           chrome
#${url}                 http://localhost:3000/
${url}                 https://ibk.homolog.redscd.com.br/
${user_data_path}

*** Keywords ***

Iniciar sessão
    Open Browser    ${url}  ${browser}
    Maximize Browser Window 

Encerra sessão 
    Capture Page Screenshot
    Sleep    2s
    Close Browser