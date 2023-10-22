*** Settings ***
Documentation   Backoffice - Bankeiro - Marketing / Push Notifications
Library         SeleniumLibrary    timeout=500
Resource        ../Steps/Push_Notifications.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Dado

#### Quando
Clicar em adicionar - PUSH NOTIFICATIONS 
    Clicar no botão adicionar - PUSH NOTIFICATIONS 
    Aguardar load da página

Clicar em Download do template de envio por CPF
    Clicar no botão Download do template CPF

Clicar em Download do template de envio por telefone
    Clicar no botão Download do template telefone

#### Então
A notificação será adicionada
    Log Many

O template csv será baixado
    Log Many

#### E
Estiver na tela de PUSH NOTIFICATIONS
    Clicar no botão PUSH NOTIFICATIONS
    Aguardar load da página

Selecionar o arquivo csv por telefone
    Upload de arquivo csv telefone
    Aguardar load da página
    Clicar no botão salvar para adicionar notificação

Selecionar o arquivo csv por cpf
    Upload de arquivo csv cpf
    Aguardar load da página
    Clicar no botão salvar para adicionar notificação

Clicar em adicionar - Tela PUSH NOTIFICATIONS
    Clicar no botão adicionar - PUSH NOTIFICATIONS
    Aguardar load da página

Clicar em ENVIAR PARA TODOS
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/button
    Click Element                    //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/button

Preencher as informações da notificação
    Digitar título da notificação
    Digitar mensagem da notificação
    Clicar no botão salvar para adicionar notificação