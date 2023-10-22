*** Settings ***
Documentation   Backoffice - Bankeiro - Configurações / Gestão de bancos
Library         SeleniumLibrary    timeout=500
Library         Screenshot
Resource        ../Steps/Gestão_bancos.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Dado

#### Quando
Clicar em alguma seta para alterar a ordem do banco
    Alterar ordem de bancos para baixo
    Aguardar load da página
    Alterar ordem de bancos para cima
    Aguardar load da página

Clicar em editar (Listagem de bancos)
    Clicar no ícone de detalhes (Listagem de bancos)
    Aguardar load da página

clicar em ADICIONAR (Listagem de bancos)
    Clicar no botão ADICIONAR - Gestão de bancos
    Aguardar load da página

Clicar em remover (Listagem de bancos)
    Clicar no botão remover (Listagem de bancos)
    Aguardar load da página

#### Então
A ordem do banco será alterada
    Log Source

O banco será adicionado
    Clicar no botão adicionar (Listagem de bancos > Adicionar banco)
    Aguardar load da página
    Verificar se o banco foi adicionado

O banco será atualizado
    Clicar no botão salvar (Listagem de bancos > Adicionar banco)
    Aguardar load da página
    Estiver na tela de gestão de bancos
    Verificar se o banco foi atualizado

O banco será removido
    Log Many

#### E
Estiver na tela de gestão de bancos
    Clicar no botão Gestão Bancos
    Aguardar load da página

Preencher as informações corretamente (ADICIONAR BANCO)
    Digitar nome do banco
    Digitar código SPD do banco
    Digitar código SPI do banco
    Digitar prioridade do banco
    Digitar url do ícone do banco

Preencher as informações corretamente (EDITAR BANCO)
    Editar nome do banco
    Editar código SPD do banco
    Editar código SPI do banco
    Editar prioridade do banco
    Editar url do ícone do banco