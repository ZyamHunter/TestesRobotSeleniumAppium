*** Settings ***
Documentation   Backoffice - Bankeiro - Usuários/administradores
Library         SeleniumLibrary    timeout=500
Library         Screenshot
Resource        ../Steps/Administradores.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Dado

#### Quando
Clicar em adicionar
    Clicar no botão adicionar
    Aguardar load da página

Editar alguma informação do administrador
    Editar nome completo do administrador
    Clicar em salvar
    Aguardar load da página

Clicar em remover
    Clicar no botão remover
    Aguardar load da página

Filtrar as contas do administradores
    Abrir filtro
    Filtrar administrador por usuário
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página
    Filtrar administrador por email
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página
    Filtrar administrador por data
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página

#### Então
O administrador será criado
    Verificar administrador criado

As informações do administrador serão editadas
    Verificar administrador editado

O administrador será removido
    Verificar administrador

#### E
Esteja na tela de administradores
    Clicar em administradores
    Aguardar load da página

Preencher os dados corretamente
    Preencher nome completo
    Preencher email
    Preencher pin
    Selecionar permissão
    Preencher senha
    Preencher senha novamente
    Adicionar administrador
    Aguardar load da página

Estiver olhando os detallhes de um administrador
    Clicar em detalhes
    Aguardar load da página
    