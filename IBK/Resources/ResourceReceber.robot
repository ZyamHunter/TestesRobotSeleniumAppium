*** Settings ***
Resource        ../Steps/Receber.robot
Resource        ../Steps/Geral.robot

*** Keywords ***
#### Dado

#### Quando
clicar em Gerar boleto para depósito
    Clicar na opção de Gerar Boleto
    Aguardar load da página

clicar em gerar QR code PIX
    Clicar na opção de Gerar QR Code Pix

clicar na opção Receber
    Clicar em RECEBER
    Aguardar load da página

#### E
estiver na tela de RECEBER
    Clicar em RECEBER
    Aguardar load da página

preencher o valor do boleto
    Inserir valor da cobrança (RECEBER)
    Clicar em Criar boleto
    Aguardar load da página

preenche o valor (RECEBER)
    Inserir valor da cobrança (RECEBER)
    Clicar no botão Continuar (GERAR QR CODE PIX)
    Aguardar load da página

não definir o valor (RECEBER)
    Clicar em não definir valor da cobrança (GERAR QR CODE PIX)
    Aguardar load da página

confirmar a cobrança do QR code Pix
    Verificar descrição da cobrança QR code pix
    Clicar no botão para gerar o QR code pix
    Aguardar load da página

#### Então
o boleto estará disponível para ser cobrado
    Verificar se o boleto foi gerado
    Pegar código do boleto gerado

o QR code estará disponível para ser cobrado
    Verificar QR code pix gerado
    Salvar código QR code pix
    Copiar código QR code Pix

poderá escolher o tipo de cobrança que deseja fazer
    Verificar tipos de cobranças (RECEBER)

