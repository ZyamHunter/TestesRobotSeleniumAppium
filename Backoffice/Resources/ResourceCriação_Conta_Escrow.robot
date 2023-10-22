*** Settings ***
Documentation   Backoffice - Bankeiro - Escrow/Criação de conta
Library         SeleniumLibrary    timeout=500
Library         Screenshot
Resource        ../Steps/Criação_conta_escrow.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Quando
Preencher corretamente o nome da empresa
    Digitar nome da empresa

#### Então
A conta escrow será criada
    Clicar no botão

#### E
Estiver na tela de criação de conta conta escrow
    Clicar em criação de conta
    Aguardar load da página

Preencher corretamente o nome fantasia
    Digitar nome fantasia

Preencher corretamente o CNPJ
    Digitar cnpj

Preencher corretamente o email
    Digitar email

Preencher corretamente o telefone
    Digitar telefone

Preencher corretamente a data de abertura
    Digitar data de abertura

Preencher corretamente o CEP
    Digitar CEP

Preencher corretamente o número do estabelecimento
    Digitar número do estabelecimento

Selecionar o ramo de atuação
    Seleção do ramo de atuação

Selecionar o tipo de empresa
    Seleção do tipo de empresa

Preencher corretamente a inscrição estadual
    Digitar inscrição estadual

Preencher corretamente o CNAE
    Digitar CNAE

Preencher corretamente o faturamento mensal
    Digitar renda mensal

Selecionar o fundo
    Seleção do fundo

Preencher corretamente o nome do representante
    Digitar nome do representante
    
Preencher corretamente o nome da mãe do representante
    Digitar nome da mãe do representante

Selecionar o tipo de representante
    Seleção do tipo de representante

Preencher corretamente o CNPJ do representante
    Digitar CNPJ do representante

Preencher corretamente o email do representante
    Digitar email do representante

Preencher corretamente o telefone do representante
    Digitar telefone do representante

Preencher corretamente a porcentagem do representante
    Digitar porcentagem do representante

Preencher corretamente a data de nascimento do representante
    Digitar data de nascimento do representante
