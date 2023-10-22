*** Settings ***
Resource         ../Resources/Endereços_bloqueados.robot  
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***

CT: Adicionar bloqueio - ip
    Dado que esteja logado
    E estiver na tela de endereços bloqueados
    Quando clicar em novo bloqueio
    E selecionar o IP
    E adicionar o valor do IP
    E clicar em bloquear
    Então o endereço IP será bloqueado

CT: Adicionar bloqueio - id do dispositivo
    Dado que esteja logado
    #E estiver na tela de endereços bloqueados
    Quando clicar em novo bloqueio
    E selecionar o ID DO DISPOSITIVO
    E adicionar o valor do id do dispositivo
    E clicar em bloquear
    Então o endereço ID DO DISPOSITIVO será bloqueado

CT: Adicionar bloqueio - endereço mac
    Dado que esteja logado
    #E estiver na tela de endereços bloqueados
    Quando clicar em novo bloqueio
    E selecionar o ENDEREÇO MAC
    E adicionar o valor do endereço mac
    E clicar em bloquear
    Então o endereço MAC será bloqueado

CT: Filtrar endereço bloqueado
    Dado que esteja logado
    #E estiver na tela de endereços bloqueados
    Quando filtrar as endereços bloqueados
    Então os resultados serão exibidos de acordo com os filtros estabelecidos

CT: Remover endereço bloqueado
    FOR  ${index}  IN RANGE    3
        Dado que esteja logado
        #E estiver na tela de endereços bloqueados
        Quando clicar em remover - endereço bloqueado
        Então o endereço será removido
    END
    

#### Index

CT: Usuários/Endereços bloqueados
    CT: Adicionar bloqueio - ip
    CT: Adicionar bloqueio - id do dispositivo
    CT: Adicionar bloqueio - endereço mac
    CT: Filtrar endereço bloqueado
    CT: Remover endereço bloqueado
