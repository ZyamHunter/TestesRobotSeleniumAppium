*** Settings ***
Resource         ../Resources/ResourcePix.robot
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Tela Pix
    Dado que o usuário esteja logado no sistema
    E esteja na tela inicial
    Quando clicar na opção de PIX
    Então será encaminhado para a tela de gestão PIX

CT: Criar Chave pix aleatória
    Dado que o usuário esteja logado no sistema
    E estiver na tela de PIX
    Quando clicar em criar chave (PIX)
    E selecionar o tipo de chave (PIX)
    E confirmar a chave pix
    Então a chave Pix será criada

CT: Criar Chave pix cpf
CT: Criar Chave pix cnpj

CT: Tranferir Pix
    Dado que o usuário esteja logado no sistema
    E estiver na tela de PIX
    Quando clicar em transferir (PIX)
    E selecionar o destinatário (PIX)
    E confirmar a transação (PIX)
    Então a transferência pix será realizada

CT: Novo cadastro bancário Pix
    Dado que o usuário esteja logado no sistema
    E estiver na tela de PIX
    E esteja na tela de transferência PIX
    Quando clicar em novo cadastro bancário
    E preencher as credenciais da conta PIX
    E confirmar o cadastro PIX
    Então o cadastro PIX será realizado

CT: Filtrar contatos cadastrados Pix
    #Dado que o usuário esteja logado no sistema
    #E estiver na tela de PIX
    #E esteja na tela de transferência PIX
    Quando preencher o campo de pesquisa de contatos (PIX)
    Então os contatos PIX serão exibidos conforme a pesquisa

CT: Favoritar contato Pix
    #Dado que o usuário esteja logado no sistema
    #E estiver na tela de PIX
    #E esteja na tela de transferência PIX
    Quando clicar na opção de favoritar o contato cadastrado (PIX)
    Então o contato PIX será favoritado

CT: Excluir contato PIX
    #Dado que o usuário esteja logado no sistema
    #E estiver na tela de PIX
    #E esteja na tela de transferência PIX
    Quando clicar na opção de excluir contato cadastrado (PIX)
    Então o contato PIX será excluído

CT: Pix Copia e cola com valor definido
    Dado que o usuário esteja logado no sistema
    E estiver na tela de PIX
    Quando clicar em Copia e Cola
    E inserir o código pix (Com valor)
    E confirmar a transação com valor (COPIA E COLA PIX)
    Então a transferência pix será realizada

CT: Pix Copia e cola sem valor definido
    Dado que o usuário esteja logado no sistema
    E estiver na tela de PIX
    Quando clicar em Copia e Cola
    E inserir o código pix
    E inserir o valor da transação pix
    E confirmar a transação (COPIA E COLA PIX)
    Então a transferência pix será realizada

CT: Cobrar Pix
    Dado que o usuário esteja logado no sistema
    E estiver na tela de PIX
    Quando clicar em gerar QR code PIX
    E preenche o valor (RECEBER)
    E confirmar a cobrança do QR code Pix
    Então o QR code estará disponível para ser cobrado

CT: Editar Limites Pix Diurno
    Dado que o usuário esteja logado no sistema 
    E estiver na tela de limites Pix
    Quando alterar o limite pix diruno
    Então o limite pix diurno será alterado

CT: Editar Limites Pix Noturno
    Dado que o usuário esteja logado no sistema 
    E estiver na tela de limites Pix
    Quando alterar o limite pix noturno
    Então o limite pix noturno será alterado

#### Index
CT: Pix
    CT: Criar Chave pix aleatória
    CT: Tranferir Pix
    CT: Pix Copia e cola com valor definido
    CT: Pix Copia e cola sem valor definido
    CT: Cobrar Pix
    CT: Editar Limites Pix Diurno
    CT: Editar Limites Pix Noturno