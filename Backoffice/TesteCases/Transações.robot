*** Settings ***
Resource         ../Resources/ResourceTransações.robot
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Exportar transações
    Dado que esteja logado
    E estiver na tela de transações
    Quando clicar em exportar transações
    Então poderá receber o arquivo por email ou efetuar download

CT: Filtrar transações
    Dado que esteja logado
    E estiver na tela de transações
    Quando filtrar as transações
    Então os resultados serão exibidos de acordo com os filtros estabelecidos

CT: Detalhes de transação
    Dado que esteja logado
    E estiver na tela de transações
    Quando clicar em uma das transações
    Então os detalhes da transação serão exibidos

#### Index
CT: Usuários/Transações
    CT: Exportar transações
    CT: Filtrar transações
    CT: Detalhes de transação