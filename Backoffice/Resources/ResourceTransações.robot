*** Settings ***
Documentation   Backoffice - Bankeiro - Usuários/Transações
Library         SeleniumLibrary    timeout=500
Library         Screenshot
Resource        ../Steps/Transações.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Dado

#### Quando
Clicar em exportar transações
    Clicar no botão de exportar transações
    Aguardar load da página

Filtrar as transações
    Abrir filtro
    Abrir filtro de tipo de transação
    Filtrar por Transferência em transações
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página

    Abrir filtro de tipo de transação
    Filtrar por Boleto em transações
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página

    Filtrar transações por data
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página

Clicar em uma das transações
    Clicar em alguma transação
    Aguardar load da página

#### Então
Poderá receber o arquivo por email ou efetuar download
    Log Many

#### E
Estiver na tela de transações
    Clicar no botão de transações em usuários
    Aguardar load da página

Os detalhes da transação serão exibidos
    Verificar detalhes da transação

