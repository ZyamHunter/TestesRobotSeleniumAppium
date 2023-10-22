*** Settings ***
Documentation   Backoffice - Bankeiro - Configurações / Feriados
Library         SeleniumLibrary    timeout=500
Library         Screenshot
Resource        ../Steps/Feriados.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Dado

#### E
Estiver na tela de feriados
    Clicar no botão Feriados
    Aguardar load da página

Preencher as informações corretamente (ADICIONAR FERIADO)
    Digitar nome do feriado
    Digitar data do feriado

Preencher as informações corretamente (EDITAR FERIADO)
    Editar nome do feriado
    Editar data do feriado

#### Quando
Clicar em adicionar (Feriados)
    Clicar no botão adicionar (Feriados)
    Aguardar load da página

Clicar em editar (Feriados)
    Clicar no ícone de editar (FERIADOS)
    Aguardar load da página

Filtrar os feriados pelo nome
    Abrir filtro
    Filtrar feriados pelo nome
    Botão filtrar
    Aguardar load da página
    #Limpar filtros
    #Aguardar load da página

Filtrar os feriados pela data
    Limpar filtros
    Aguardar load da página
    Filtrar feriados pela data
    Botão filtrar
    Aguardar load da página

Clicar em remover (Feriados)
    Clicar no ícone de remover (FERIADOS)
    Aguardar load da página

#### Então
As informações do feriado serão editadas
    Clicar no botão de salvar (EDIÇÃO DE FERIADO)
    Aguardar load da página

O feriado será removido
    Log Many

O feriado será adicionado
    Clicar no botão adicionar (FERIADOS > ADICIONAR FERIADO)
    Aguardar load da página






