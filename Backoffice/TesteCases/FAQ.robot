*** Settings ***
Resource         ../Resources/ResourceFAQ.robot
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Adicionar tópico para usuários logados
    Dado que esteja logado
    E estiver na tela de FAQ
    Quando clicar em ADICIONAR
    E adidicona o nome do tópico
    E seleciona usuários logados
    Então o tópico será adicionado

CT: Adicionar tópico para usuários não logados
    Dado que esteja logado
    E estiver na tela de FAQ
    Quando clicar em ADICIONAR
    E adidicona o nome do tópico
    E seleciona usuários não logados
    Então o tópico será adicionado

CT: Editar tópico
    Dado que esteja logado
    E estiver na tela de FAQ
    Quando clicar no ícone de editar
    E preencher as informações corretamente
    Então o tópico será atualizado

CT: Excluir tópico
    Dado que esteja logado
    E estiver na tela de FAQ
    Quando clicar no ícone de excluir
    Então o tópico será removido

CT: Ordem dos tópicos
    Dado que esteja logado
    E estiver na tela de FAQ
    Quando clicar no ícone de alterar a ordem do tópico
    Então a ordem dos tópicos será alterada

CT: Questões do tópico (adicionar)
    Dado que esteja logado
    E estiver na tela de FAQ
    E estiver olhando os detalhes de um tópico
    Quando clicar em ADICIONAR
    E preencher as informações corretamente
    Então a questão será adicionada no tópico

CT: Questões do tópico (editar)
    Dado que esteja logado
    E estiver na tela de FAQ
    E estiver olhando os detalhes de um tópico
    Quando clicar no ícone de editar questão
    E preencher as informações corretamente
    Então a questão será atualizada no tópico

CT: Questões do tópico (remover)
    Dado que esteja logado
    E estiver na tela de FAQ
    E estiver olhando os detalhes de um tópico
    Quando clicar no ícone de remover
    Então a questão será removida

CT: Questões do tópico (ordem)
    Dado que esteja logado
    E estiver na tela de FAQ
    E estiver olhando os detalhes de um tópico
    Quando clicar no ícone de alterar ordem das questões
    Então a ordem das questões será alterada

#### Index
CT: Configurações/FAQ
    CT: Adicionar tópico para usuários logados
    CT: Adicionar tópico para usuários não logados
    #CT: Editar tópico
    #CT: Ordem dos tópicos
    CT: Questões do tópico (adicionar)
    CT: Questões do tópico (editar)
    CT: Questões do tópico (remover)
    #CT: Questões do tópico (ordem)
    CT: Excluir tópico

