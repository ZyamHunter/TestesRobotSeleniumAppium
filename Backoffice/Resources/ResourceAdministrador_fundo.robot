*** Settings ***
Documentation   Backoffice - Bankeiro - Escrow/administradores de Fundo
Library         SeleniumLibrary    timeout=500
Resource        ../Steps/Administrador_fundo.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Dado

#### Quando
Clicar em ADICIONAR - administrador de fundo
    Clicar no botão adicionar - administrador de fundo
    Aguardar load da página

Preencher os dados da empresa - administrador de fundo
    Digitar razão social - administrador de fundo
    Digitar email - administrador de fundo
    Digitar cnpj - administrador de fundo

Clicar em remover - administrador de fundo
    Clicar no botão remover - administrador de fundo
    Aguardar load da página

#### Então
O administrador de fundo será adicionado
    Log Many

O administrador de fundo será atualizado
    Log Many

O administrador de fundo será removido
    Log Many

#### E
Estiver na tela de administrador de fundo
    Clicar no botão de administrador de fundo
    Aguardar load da página

Preencher os dados da empresa
    Digitar razão social - administrador de fundo
    Digitar email - administrador de fundo
    Digitar cnpj - administrador de fundo

Preencher o endereço da empresa
    Digitar CEP - administrador de fundo
    Digitar número da casa - administrador de fundo

Clicar adicionar - administrador de fundo
    Clicar no botão para adicionar administrador de fundo
    Aguardar load da página

Estiver olhando os detalhes de algum administrador de fundo
    Clicar no ícone de detalhes - administrador de fundo
    Aguardar load da página

Clicar salvar - administrador de fundo
    Clicar no botão salvar - administrador de fundo
    Aguardar load da página

Adicionar contrato - administrador de fundo
    Adicionar contrato no administrador de fundo