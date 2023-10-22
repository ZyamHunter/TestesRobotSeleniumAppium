*** Settings ***
Documentation   Backoffice - Bankeiro - Segurança/Endereços Bloqueados
Library         SeleniumLibrary    timeout=500
Library         Screenshot
Resource        ../Steps/Endereços_bloqueados.robot
Resource        ../Steps/Geral.robot

*** Variables ***
${BROWSER}                              chrome

${MY_USER}                              yam.carrasco@mblabs.com.br
${MY_PASS}                              Pass123123

*** Keywords ***
#### Dado

#### Quando
Clicar em novo bloqueio
    Clicar no botão novo bloqueio
    Aguardar load da página

Filtrar as endereços bloqueados
    Abrir filtro
    Filtrar enderço bloqueado por valor
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página
    Filtrar enderço bloqueado por id
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página
    Filtrar enderço bloqueado por dispositivo
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página
    Filtrar enderço bloqueado por mac
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página
    Filtrar enderço bloqueado por data
    Botão filtrar
    Aguardar load da página
    Limpar filtros
    Aguardar load da página

Clicar em remover - endereço bloqueado
    Clicar no ícone de remover endereço bloqueado
    Aguardar load da página

#### Então
O endereço IP será bloqueado
    Verificar endereço IP boqueado

O endereço ID DO DISPOSITIVO será bloqueado
    Verificar endereço ID DO DISPOSITIVO boqueado

O endereço MAC será bloqueado
    Verificar endereço MAC boqueado

O endereço será removido
    Log Source
    #Verificar notificação de erro

#### E
Estiver na tela de endereços bloqueados
    Clicar em endereços bloqueados
    Aguardar load da página

Adicionar o valor do IP
    Adicionar número do IP

Adicionar o valor do id do dispositivo
    Adicionar número do id do dispositivo

Adicionar o valor do endereço mac
    Adicionar número do endereço mac

Selecionar o IP
    Selecionar tipo de endereço IP

Selecionar o ID DO DISPOSITIVO
    Selecionar tipo de endereço ID DO DISPOSITIVO

Selecionar o ENDEREÇO MAC
    Selecionar tipo de endereço MAC

Clicar em bloquear
    Clicar no botão bloquear
    Aguardar load da página
