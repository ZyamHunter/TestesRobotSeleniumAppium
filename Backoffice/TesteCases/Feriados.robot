*** Settings ***
Resource         ../Resources/ResourceFeriados.robot
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Filtrar feriado por nome
    Dado que esteja logado
    E estiver na tela de feriados
    Quando filtrar os feriados pelo nome
    Então os resultados serão exibidos de acordo com os filtros estabelecidos

CT: Filtrar feriado por data
    Dado que esteja logado
    E estiver na tela de feriados
    Quando filtrar os feriados pela data
    Então os resultados serão exibidos de acordo com os filtros estabelecidos

CT: Editar feriado
    Dado que esteja logado
    E estiver na tela de feriados
    Quando clicar em editar (Feriados)
    E preencher as informações corretamente (EDITAR FERIADO)
    Então as informações do feriado serão editadas

CT: Remover feriado
    Dado que esteja logado
    E estiver na tela de feriados
    Quando clicar em remover (Feriados)
    Então o feriado será removido

CT: Adicionar feriado
    Dado que esteja logado
    E estiver na tela de feriados
    Quando clicar em adicionar (Feriados)
    E preencher as informações corretamente (ADICIONAR FERIADO)
    Então o feriado será adicionado

#### Index
CT: Configurações / Feriados
    CT: Adicionar feriado
    CT: Filtrar feriado por nome
    CT: Editar feriado
    CT: Filtrar feriado por data
    CT: Remover feriado