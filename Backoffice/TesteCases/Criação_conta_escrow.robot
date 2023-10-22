*** Settings ***
Resource         ../Resources/ResourceCriação_Conta_Escrow.robot  
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***

CT: Criação de conta escrow com o nome da mãe
    Dado que esteja logado
    E estiver na tela de criação de conta conta escrow
    Quando preencher corretamente o nome da empresa
    E preencher corretamente o nome fantasia
    E preencher corretamente o CNPJ
    E preencher corretamente o email
    E preencher corretamente o telefone
    E preencher corretamente a data de abertura
    E preencher corretamente o CEP
    E preencher corretamente o número do estabelecimento
    E selecionar o ramo de atuação
    E selecionar o tipo de empresa
    E preencher corretamente a inscrição estadual
    E preencher corretamente o CNAE
    E preencher corretamente o faturamento mensal
    E selecionar o fundo
    E preencher corretamente o nome do representante
    E preencher corretamente o nome da mãe do representante
    E selecionar o tipo de representante
    E preencher corretamente o CNPJ do representante
    E preencher corretamente o email do representante
    E preencher corretamente o telefone do representante
    #E preencher corretamente a porcentagem do representante
    E preencher corretamente a data de nascimento do representante
    Então a conta escrow será criada