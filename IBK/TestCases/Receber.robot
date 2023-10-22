*** Settings ***
Resource         ../Resources/ResourceReceber.robot
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Tela Receber
    Dado que o usuário esteja logado no sistema
    Quando clicar na opção Receber
    Então poderá escolher o tipo de cobrança que deseja fazer

CT: Gerar QR code PIX com valor definido
    Dado que o usuário esteja logado no sistema
    E estiver na tela de RECEBER
    Quando clicar em gerar QR code PIX
    E preenche o valor (RECEBER)
    E confirmar a cobrança do QR code Pix
    Então o QR code estará disponível para ser cobrado

CT: Gerar QR code PIX sem valor definido
    Dado que o usuário esteja logado no sistema
    E estiver na tela de RECEBER
    Quando clicar em gerar QR code PIX
    E não definir o valor (RECEBER)
    E confirmar a cobrança do QR code Pix
    Então o QR code estará disponível para ser cobrado

CT: Gerar boleto
    Dado que o usuário esteja logado no sistema
    E estiver na tela de RECEBER
    Quando clicar em Gerar boleto para depósito
    E preencher o valor do boleto
    Então o boleto estará disponível para ser cobrado


#### Index
CT: Receber
    CT: Gerar QR code PIX com valor definido
    Ir para a home page
    CT: Gerar QR code PIX sem valor definido
    Ir para a home page
    CT: Gerar boleto
    Ir para a home page


#### Boleto
CT: Receber > Boleto
    CT: Gerar boleto
    Ir para a home page

#### Pix
CT: Receber > QR Code
    CT: Gerar QR code PIX com valor definido
    Ir para a home page
    CT: Gerar QR code PIX sem valor definido
    Ir para a home page

