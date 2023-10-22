*** Settings ***
Documentation   Backoffice - Bankeiro - Login
Library         SeleniumLibrary    timeout=500
Library         Screenshot
Resource        ../Steps/Login.robot
Resource        ../Steps/Geral.robot

*** Variables ***
${BROWSER}                              chrome

#${MY_USER}                              yam.carrasco@mblabs.com.br
${MY_USER}                              leonardo.nori@mblabs.com.br
${MY_PASS}                              123
#${MY_PASS}                              Pass123123

*** Keywords ***
#### Dado
Que esteja na página de login do "${BACKOFFICE}"
    Open Browser    ${BACKOFFICE}    ${BROWSER}
    Maximize Browser Window
    Set Global Variable    ${BACKOFFICE}    ${BACKOFFICE}
    Aguardar load da página

#### Quando
Preencher o usuário corretamente
    Preencher campo email    ${MY_USER}

#### Então
Será logado no sistema
    Verificar login    ${BACKOFFICE}

#### E
Preencher a senha corretamente
    Preencher campo senha    ${MY_PASS}

Clicar em Entrar
    Clicar no botão entrar
    Aguardar load da página
