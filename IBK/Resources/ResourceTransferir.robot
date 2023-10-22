*** Settings ***
Documentation   IBK - Bankeiro - Transferência
Resource        ../Steps/Transferir.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Dado

#### Quando
Clicar na opção de transferir
    Clicar em transferir
    Aguardar load da página

clicar na opção de transferência P2P
    Clicar na opção P2P
    Aguardar load da página

clicar em novo cadastro bancário
    Clicar em novo dado bancário

preencher o campo de pesquisa de contatos
    Pesquisar usuário pelo CPF (Transferir)
    Sleep    1s

clicar na opção de favoritar o contato cadastrado
    Clicar no ícone de favoritar contato cadastrado
    Sleep    0.5 seconds

clicar na opção de excluir contato cadastrado
    Clicar no ícone de excluir contato cadastrado
    Aguardar load da página

clicar na opção de transferência TED
    Clicar na opção TED
    Aguardar load da página
    
preencher o campo de pesquisa de contatos TED
    Pesquisar usuário pelo CPF (Transferir)
    Sleep    1s
    
#### E
poderá escolher o tipo de transferência que deseja fazer
    Verificar tipos de transferências

esteja na tela de transferências
    Clicar em transferir
    Aguardar load da página

escolher a conta de transferência P2P
    ${standard}=    Run Keyword And Return Status    Clicar em contato já cadastrado

    IF  ${standard}
        Aguardar load da página
    ELSE
        Clicar em novo dado bancário
        Digitar nome completo (transferir)    ${standard}
        Digitar cpf do contato cadastrado     ${standard}
        confirmar o cadastro P2P
    END

escolher a conta de transferência TED
    ${standard}=    Run Keyword And Return Status    Clicar em contato já cadastrado

    IF  ${standard}
        Aguardar load da página
    ELSE
        Clicar em novo dado bancário
        Digitar nome completo (transferir)    ${standard}
        Digitar cpf do contato cadastrado     ${standard}
        #Selecionar tipo conta corrente (TED)
        Digitar agência (TED)
        Digitar banco (TED)
        Digitar conta (TED)
        Digitar digito (TED)
        confirmar o cadastro TED
    END

tenha escolhido o tipo de transferência P2P
    Clicar na opção P2P
    Aguardar load da página

preencher o valor da transferência
    Digitar valor da transação
    Clicar no botão avançar (transferir)
    Aguardar load da página

confirmar a transferência
    Clicar no botão confirmar (transferir)
    Aguardar load da página
    Confirmar PIN (transferir)

preencher as credenciais da conta P2P
    Digitar nome completo (transferir)    True
    Digitar cpf do contato cadastrado     True

preencher as credenciais da conta TED
    Digitar nome completo (transferir)    True
    Digitar cpf do contato cadastrado     True
    #Selecionar tipo conta corrente (TED)
    Digitar agência (TED)
    Digitar banco (TED)
    Digitar conta (TED)
    Digitar digito (TED)

confirmar o cadastro P2P
    Clicar no botão cadastrar (Transferir > Cadastro bancário)
    Aguardar load da página

confirmar o cadastro TED
    Clicar no botão cadastrar (Transferir > Cadastro bancário)
    Aguardar load da página

tenha escolhido o tipo de transferência TED
    Clicar na opção TED
    Aguardar load da página

#### Então
será encaminhado para a tela de transferências
    Verificar página de transferências    

a transferência será realizada
    Verificar comprovante de transação (Transferir)

o cadastro P2P será realizado
    Voltar para a tela de contas (Transferir)
    Verificar existência de conta criada P2P (Transferir)

o cadastro TED será realizado
    Voltar para a tela de contas (Transferir)
    Verificar existência de conta criada TED (Transferir)

os contatos P2P serão exibidos conforme a pesquisa
    Verificar existência de conta criada P2P (Transferir)

o contato será favoritado
    Log Many

o contato P2P será excluído
    Verificar contato P2P excluído (Transferir)

o contato TED será excluído
    Verificar contato TED excluído (Transferir)

os contatos TED serão exibidos conforme a pesquisa
    Verificar existência de conta criada TED (Transferir)




