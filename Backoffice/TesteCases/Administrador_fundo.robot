*** Settings ***
Resource         ../Resources/ResourceAdministrador_fundo.robot  
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Adicionar administrador de fundo sem contrato
    Dado que esteja logado
    E estiver na tela de administrador de fundo
    Quando clicar em ADICIONAR - administrador de fundo
    E preencher os dados da empresa
    E preencher o endereço da empresa
    E clicar adicionar - administrador de fundo
    Então o administrador de fundo será adicionado

CT: Editar administrador de fundo
    Dado que esteja logado
    #E estiver na tela de administrador de fundo
    E estiver olhando os detalhes de algum administrador de fundo
    Quando preencher os dados da empresa
    E preencher o endereço da empresa
    E adicionar contrato - administrador de fundo
    E clicar salvar - administrador de fundo
    Então o administrador de fundo será atualizado

CT: Remover administrador de fundo
    Dado que esteja logado
    #E estiver na tela de administrador de fundo
    E estiver olhando os detalhes de algum administrador de fundo
    Quando clicar em remover - administrador de fundo
    Então o administrador de fundo será removido

#### index
CT: Escrow/Administrador de fundo
    CT: Adicionar administrador de fundo sem contrato
    CT: Editar administrador de fundo
    CT: Remover administrador de fundo