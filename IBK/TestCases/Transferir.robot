*** Settings ***
Resource         ../Resources/ResourceTransferir.robot
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Tela de transferência
    Dado que o usuário esteja logado no sistema
    E esteja na tela inicial
    Quando clicar na opção de transferir
    Então será encaminhado para a tela de transferências
    E poderá escolher o tipo de transferência que deseja fazer

CT: Transferência P2P
    Dado que o usuário esteja logado no sistema
    E esteja na tela de transferências
    Quando clicar na opção de transferência P2P
    E escolher a conta de transferência P2P
    E preencher o valor da transferência
    E confirmar a transferência
    Então a transferência será realizada

CT: Novo cadastro bancário P2P
    Dado que o usuário esteja logado no sistema
    E esteja na tela de transferências
    E tenha escolhido o tipo de transferência P2P
    Quando clicar em novo cadastro bancário
    E preencher as credenciais da conta P2P
    E confirmar o cadastro P2P
    Então o cadastro P2P será realizado

CT: Filtrar contatos cadastrados P2P
    #Dado que o usuário esteja logado no sistema
    #E esteja na tela de transferências
    #E tenha escolhido o tipo de transferência
    Quando preencher o campo de pesquisa de contatos
    Então os contatos P2P serão exibidos conforme a pesquisa

CT: Favoritar contato P2P
    #Dado que o usuário esteja logado no sistema
    #E esteja na tela de transferências
    #E tenha escolhido o tipo de transferência
    Quando clicar na opção de favoritar o contato cadastrado
    Então o contato será favoritado

CT: Excluir contato P2P
    #Dado que o usuário esteja logado no sistema
    #E esteja na tela de transferências
    #E tenha escolhido o tipo de transferência
    Quando clicar na opção de excluir contato cadastrado
    Então o contato P2P será excluído

CT: Transferência TED
    Dado que o usuário esteja logado no sistema
    E esteja na tela de transferências
    Quando clicar na opção de transferência TED
    E escolher a conta de transferência TED
    E preencher o valor da transferência
    E confirmar a transferência
    Então a transferência será realizada

CT: Novo cadastro bancário TED
    Dado que o usuário esteja logado no sistema
    E esteja na tela de transferências
    E tenha escolhido o tipo de transferência TED
    Quando clicar em novo cadastro bancário
    E preencher as credenciais da conta TED
    E confirmar o cadastro TED
    Então o cadastro TED será realizado

CT: Filtrar contatos cadastrados TED
    #Dado que o usuário esteja logado no sistema
    #E esteja na tela de transferências
    #E tenha escolhido o tipo de transferência
    Quando preencher o campo de pesquisa de contatos TED
    Então os contatos TED serão exibidos conforme a pesquisa

CT: Favoritar contato TED
    #Dado que o usuário esteja logado no sistema
    #E esteja na tela de transferências
    #E tenha escolhido o tipo de transferência
    Quando clicar na opção de favoritar o contato cadastrado
    Então o contato será favoritado

CT: Excluir contato TED
    #Dado que o usuário esteja logado no sistema
    #E esteja na tela de transferências
    #E tenha escolhido o tipo de transferência
    Quando clicar na opção de excluir contato cadastrado
    Então o contato TED será excluído

CT: Transferir / P2P
    CT: Transferência P2P
    Sleep    1s
    Reload Page
    CT: Novo cadastro bancário P2P
    CT: Filtrar contatos cadastrados P2P
    CT: Favoritar contato P2P
    CT: Excluir contato P2P

CT: Transferir / TED
    CT: Transferência TED
    Sleep    1s
    Reload Page
    CT: Novo cadastro bancário TED
    CT: Filtrar contatos cadastrados TED
    CT: Favoritar contato TED
    CT: Excluir contato TED

#### Index
CT: Transferir
    CT: Transferência P2P
    Sleep    1s
    Reload Page
    Sleep    1s
    CT: Novo cadastro bancário P2P
    CT: Filtrar contatos cadastrados P2P
    CT: Favoritar contato P2P
    CT: Excluir contato P2P
    Sleep    1s
    Reload Page
    CT: Transferência TED
    Sleep    1s
    Reload Page
    CT: Novo cadastro bancário TED
    CT: Filtrar contatos cadastrados TED
    CT: Favoritar contato TED
    CT: Excluir contato TED
