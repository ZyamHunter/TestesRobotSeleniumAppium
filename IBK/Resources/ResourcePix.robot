*** Settings ***
Resource        ../Steps/Pix.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Dado

#### Quando
clicar na opção de PIX
    Clicar em Pix
    Aguardar load da página

clicar em criar chave (PIX)
    Clicar em criar chave pix (GESTÃO PIX)
    Aguardar load da página

clicar em transferir (PIX)
    Clicar na opção de transferir PIX
    Aguardar load da página

clicar em Copia e Cola
    Clicar na opção de Copia e Cola PIX
    Aguardar load da página

#### E
estiver na tela de PIX
    Clicar em Pix
    Aguardar load da página

selecionar o tipo de chave (PIX)
    Selecionar chave pix aleatória
    Aguardar load da página

confirmar a chave pix
    Clicar no botão avançar (PIX)
    Digitar PIN (TRANSFERIR PIX)
    Aguardar load da página

selecionar o destinatário (PIX)
    Clicar no contato salvo pix
    Aguardar load da página

confirmar a transação (PIX)
    Inserir valor da transferência pix
    Clicar no botão avançar (PIX)
    Verificar tela de confirmação pix
    Clicar no botão confirmar (PIX)
    Digitar PIN (TRANSFERIR PIX)
    Aguardar load da página

inserir o código pix
    Inserir código pix (COPIA E COLA)
    Clicar no botão continuar (PIX)

inserir o código pix (Com valor)
    Inserir código pix com valor (COPIA E COLA)
    Clicar no botão continuar (PIX)

inserir o valor da transação pix
    Digitar valor da transação pix (COPIA E COLA)
    Clicar no botão confirmar (PIX)
    Aguardar load da página

confirmar a transação (COPIA E COLA PIX)
    Verificar página de confirmação (PIX COPIA E COLA)
    Clicar no botão confirmar (PIX)
    Digitar PIN (PIX)
    Aguardar load da página

confirmar a transação com valor (COPIA E COLA PIX)
    Verificar página de confirmação (PIX COPIA E COLA)
    Clicar no botão confirmar (PIX)
    Digitar PIN (PIX)
    Aguardar load da página

#### Então
será encaminhado para a tela de gestão PIX
    Verificar área de gestão pix

a chave Pix será criada
    Verificar chave aleatória pix criada

a transferência pix será realizada
    Verificar transferencia pix realizada




