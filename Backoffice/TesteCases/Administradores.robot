*** Settings ***
Resource         ../Resources/Administradores.robot  
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Adicionar administrador
    Dado que esteja logado
    E esteja na tela de administradores
    Quando clicar em adicionar
    E preencher os dados corretamente
    Então o administrador será criado

CT: Editar administrador
    Dado que esteja logado
    E estiver olhando os detallhes de um administrador
    Quando editar alguma informação do administrador
    Então as informações do administrador serão editadas

CT: Filtrar administradores
    Dado que esteja logado
    #E esteja na tela de administradores
    Quando filtrar as contas do administradores
    Então os resultados serão exibidos de acordo com os filtros estabelecidos

CT: Remover administrador
    Dado que esteja logado
    E estiver olhando os detallhes de um administrador
    Quando clicar em remover
    Então o administrador será removido

#### Index

CT: Usuários/administradores
    CT: Adicionar administrador
    CT: Editar administrador
    CT: Filtrar administradores
    CT: Remover administrador