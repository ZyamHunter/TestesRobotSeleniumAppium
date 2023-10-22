*** Settings ***
Resource        ../Steps/Login.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Dado
Que esteja na página de login do "${IBK}"
    Set Suite Variable    ${IBK}    ${IBK}
    Abrir navegador
    Aguardar load da página

#### E
Preencha as credenciais corretamente (Login)
    Preencher campo usuário
    Preencher campo senha

Confirmar o sms no 1° login
    Digitar código (Login)
    Clicar no botão para confirmar sms (Login)
    Aguardar load da página

#### Quando
Clicar em Entrar (Login)
    Clicar no botão entrar (Login)
    Aguardar load da página

#### Então
Será logado no Internet Banking
    Verificar login
    Aguardar load da página


