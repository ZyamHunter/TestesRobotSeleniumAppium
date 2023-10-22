*** Settings ***
Resource         ../Resources/ResourceLogs_usuários.robot
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Filtrar logs de usuários
    Dado que esteja logado
    E estiver na tela de logs dos usuários
    Quando filtrar os logs dos usuários
    Então os resultados serão exibidos de acordo com os filtros estabelecidos

CT: Detalhes do log de usuários
    Dado que esteja logado
    E estiver na tela de logs dos usuários
    Quando clicar em um dos logs dos usuários
    Então os detalhes do log de usuário serão exibidos

#### Index
CT: Usuários/Logs de usuários
    CT: Filtrar logs de usuários
    CT: Detalhes do log de usuários