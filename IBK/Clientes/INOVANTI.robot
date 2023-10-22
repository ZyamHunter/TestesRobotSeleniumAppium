*** Settings ***
Resource         ../TestCases/Login.robot
Resource         ../TestCases/Transferir.robot
Resource         ../TestCases/Receber.robot
Resource         ../TestCases/Pix.robot

Resource         ../Helpers/Help.robot
Resource         ../Helpers/INOVANTI.robot

Library    ScreenCapLibrary    screenshot_directory=videos
Library    DateTime

*** Test Cases ***
Login
    [Tags]    LOGIN
    Setar variáveis de login IBK

    #Start Video Recording    name=./${TODAY}/INOVANTI/IBK/Login
    CT: Logar no "${INOVANTI}" com sucesso
    Sleep    1s
    #Stop Video Recording

Início
    #Start Video Recording    name=./${TODAY}/INOVANTI/IBK/Início
    CT: Tela de transferência
    CT: Tela Receber
    CT: Tela Pix
    Sleep    1s
    #Stop Video Recording

Receber
    #Start Video Recording    name=./${TODAY}/INOVANTI/IBK/Receber Boleto
    CT: Receber > Boleto
    Sleep    1s
    #Stop Video Recording

    #Start Video Recording    name=./${TODAY}/INOVANTI/IBK/Receber QR code
    CT: Receber > QR Code
    Sleep    1s
    #Stop Video Recording 

Transferir
    Setar variáveis de transferência IBK

    #Start Video Recording    name=./${TODAY}/INOVANTI/IBK/Transferir P2P
    CT: Transferir / P2P
    Sleep    1s
    #Stop Video Recording
    Reload Page
    #Start Video Recording    name=./${TODAY}/INOVANTI/IBK/Transferir TED
    CT: Transferir / TED
    Sleep    1s
    #Stop Video Recording
    
Pix    
    #CT: Criar Chave pix aleatória
    #Ir para a home page
    #Start Video Recording    name=./${TODAY}/INOVANTI/IBK/PIX
    CT: Tranferir Pix
    CT: Pix Copia e cola com valor definido
    CT: Pix Copia e cola sem valor definido
    Sleep    1s
    #Stop Video Recording





