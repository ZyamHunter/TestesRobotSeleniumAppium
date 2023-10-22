*** Settings ***
Documentation   Backoffice - Bankeiro - Usuários/Logs dos usuários
Library         SeleniumLibrary    timeout=500
Library         Screenshot
Resource        ../Steps/Logs_usuários.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Dado

#### E
Estiver na tela de logs dos usuários
    Clicar no botão Logs dos usuários
    Aguardar load da página

#### Quando
Filtrar os logs dos usuários
    Abrir filtro
    Abrir filtro de nível em logs dos usuários
    Filtrar por nível info em logs dos usuários
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página

    Abrir filtro de nível em logs dos usuários
    Filtrar por nível error em logs dos usuários
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página

    Filtrar por data em logs dos usuários
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página

    Abrir filtro de ação em logs dos usuários
    Filtrar por auth_failed em logs dos usuários
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página

Clicar em um dos logs dos usuários
    Clicar no ícone de detalhes de log de usuário

#### Então
Os detalhes do log de usuário serão exibidos
    Visualizar detalhes do log de usuário
    Fechar detalhes de log de usuário