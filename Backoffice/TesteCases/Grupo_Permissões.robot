*** Settings ***
Resource         ../Resources/ResourceGrupo_Permissões.robot  
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Adicionar permissão
    Dado que esteja logado
    E estiver na tela de permissões
    Quando clicar em adicionar - grupo de permissões
    E preencher os dados corretamente - grupo de permissões
    Então a permissão será adicionada

CT: Editar permissão
    Dado que esteja logado
    E estiver na tela de permissões
    E estiver olhando os detallhes de uma permissão
    Aguardar load da página
    Quando editar alguma informação da permissão
    E salvar as alterações da edição
    Então as informações da permissão serão editadas

CT: Filtrar permissões
    Dado que esteja logado
    E estiver na tela de permissões
    Quando filtrar as permissões
    Então os resultados serão exibidos de acordo com os filtros estabelecidos

CT: Remover permissão
    Dado que esteja logado
    E estiver na tela de permissões
    E estiver olhando os detallhes de uma permissão
    Quando clicar em remover - grupo de permissões
    Então a permissão será removida

#### Index

CT: Usuários / Grupo de permissões
    CT: Adicionar permissão
    CT: Editar permissão
    CT: Filtrar permissões
    CT: Remover permissão