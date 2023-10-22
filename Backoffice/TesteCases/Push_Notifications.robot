*** Settings ***
Resource         ../Resources/ResorucePush_Notifications.robot  
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Adicionar via csv template por telefone
    Dado que esteja logado
    E estiver na tela de PUSH NOTIFICATIONS
    Quando clicar em adicionar - PUSH NOTIFICATIONS
    E selecionar o arquivo csv por telefone
    Então a notificação será adicionada

CT: Adicionar via csv template por cpf
    Dado que esteja logado
    E estiver na tela de PUSH NOTIFICATIONS
    Quando clicar em adicionar - PUSH NOTIFICATIONS
    E selecionar o arquivo csv por cpf
    Então a notificação será adicionada

CT: Adicionar ENVIAR PARA TODOS
    Dado que esteja logado
    E estiver na tela de PUSH NOTIFICATIONS
    Quando clicar em adicionar - PUSH NOTIFICATIONS
    E clicar em ENVIAR PARA TODOS
    E preencher as informações da notificação
    Então a notificação será adicionada

CT: Download do template de envio por CPF
    Dado que esteja logado
    E estiver na tela de PUSH NOTIFICATIONS
    E Clicar em adicionar - Tela PUSH NOTIFICATIONS
    Quando clicar em Download do template de envio por CPF
    Então o template csv será baixado

CT: Download do template de envio por telefone
    Dado que esteja logado
    E estiver na tela de PUSH NOTIFICATIONS
    E Clicar em adicionar - Tela PUSH NOTIFICATIONS
    Quando clicar em Download do template de envio por telefone
    Então o template csv será baixado

#### Index
CT: Marketing/Push Notifications
    CT: Adicionar via csv template por telefone
    CT: Adicionar via csv template por cpf
    CT: Adicionar ENVIAR PARA TODOS
    CT: Download do template de envio por CPF
    CT: Download do template de envio por telefone