*** Settings ***
Documentation   Backoffice - Bankeiro - Usuários / Grupo de permissões
Library         SeleniumLibrary    timeout=500
Resource        ../Steps/Grupo_Permissões.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Dado

#### Quando
Clicar em adicionar - grupo de permissões
    Clicar no botão adicionar - grupo de permissões
    Aguardar load da página

Editar alguma informação da permissão
    Digitar nome do grupo de permissões
    Clicar em permissão do tipo de conta
    Marcar mais um item do tipo conta
    Clicar em permissão do tipo detalhes da conta
    Marcar mais um item do tipo detalhes da conta

Clicar em remover - grupo de permissões
    Clicar no botão remover - grupo de permissões
    Aguardar load da página

Filtrar as permissões
    Abrir filtro
    Filtrar por grupo de permissão
    Botão Filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página
    Filtrar grupo de permissão por data
    Botão Filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página

#### Então
A permissão será adicionada
    Log Source

As informações da permissão serão editadas
    Log Source

A permissão será removida
    Log Source

#### E
Estiver na tela de permissões
    Clicar no botão de grupo de permissões
    Aguardar load da página

Preencher os dados corretamente - grupo de permissões
    Digitar nome do grupo de permissões
    Clicar em permissão do tipo de conta
    Selecionar permissão do tipo conta
    Clicar em permissão do tipo detalhes da conta
    Selecionar permissão do tipo detalhes da conta
    Clicar no botão Salvar para adicionar a permissão

Estiver olhando os detallhes de uma permissão
    Clicar no ícone de detalhes - grupo de permissões
    Aguardar load da página

Salvar as alterações da edição
    Clicar no botão Salvar para adicionar a permissão
    Aguardar load da página