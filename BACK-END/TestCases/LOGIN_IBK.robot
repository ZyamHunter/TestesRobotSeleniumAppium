*** Settings ***
Documentation    
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Login bem sucedido
    Dado que acesse a rota de autenticação do sistema
    Quando enviar as credenciais corretamente
    E realizar a validação do token corretamente
    E realizar o registro do dispositivo corretamente
    Então será logado no sistema

CT: Primeiro login do dispositivo com sucesso
    Dado que acesse a rota de autenticação do sistema
    Quando enviar as credenciais corretamente
    E verificar se o dispositivo já foi autorizado
    E realizar a validação do token corretamente
    E realizar o registro do dispositivo corretamente
    Então será logado no sistema
