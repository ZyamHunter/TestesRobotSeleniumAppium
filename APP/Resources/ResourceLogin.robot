*** Settings ***
Resource        ../Steps/Login.robot

*** Keywords ***
#### Dado
Que esteja na página de login do APP
    Abrir aplicativo
    Esperar carregamento da página Home

#### Quando
preencher o usuário corretamente
    Preencher campo usuário

#### E
preencher a senha corretamente
    Preencher campo senha

clicar em entrar
    Clicar no botão entrar (login)
    Pop-up
    Confirmação do sms

#### Então
será logado no sistema
    Pop-up de localização
    Permissão android
    Start-rate

    