*** Settings ***
Documentation    Backoffice - Bankeiro - Login

Resource         ../Resources/ResourceLogin.robot  
Resource         ../../BDD/BDDpt-br.robot

*** Keywords ***
CT: Logar no APP com sucesso
    Dado que esteja na página de login do APP
    Quando preencher o usuário corretamente
    E preencher a senha corretamente
    E clicar em entrar
    Então será logado no sistema