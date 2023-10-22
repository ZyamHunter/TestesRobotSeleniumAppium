*** Settings ***
Resource         ../Resources/ResourceGestão_bancos.robot
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Ordem dos bancos
    Dado que esteja logado
    E estiver na tela de gestão de bancos
    Quando clicar em alguma seta para alterar a ordem do banco
    Então a ordem do banco será alterada

CT: Editar banco
    Dado que esteja logado
    E estiver na tela de gestão de bancos
    Quando clicar em editar (Listagem de bancos)
    E preencher as informações corretamente (EDITAR BANCO)
    Então o banco será atualizado

CT: Adicionar banco
    Dado que esteja logado
    E estiver na tela de gestão de bancos
    Quando clicar em ADICIONAR (Listagem de bancos)
    E preencher as informações corretamente (ADICIONAR BANCO)
    Então o banco será adicionado

CT: Remover banco
    Dado que esteja logado
    E estiver na tela de gestão de bancos
    Quando clicar em remover (Listagem de bancos)
    Então o banco será removido

#### Index
CT: Configurações / Gestão de bancos
    CT: Adicionar banco
    CT: Editar banco
    CT: Remover banco
    CT: Ordem dos bancos
    
    