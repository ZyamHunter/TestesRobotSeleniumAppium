*** Settings ***
Documentation       Arquivo dedicado a organização e chamadas dos casos de teste

Resource            ../Config/Config.robot
Resource            ../TestCases/Posts.robot
Resource            ../TestCases/Comments.robot
Resource            ../TestCases/Posts.robot

Test Setup          Criar conexão
Test Teardown       Encerrar conexão


*** Test Cases ***
Recuperar todas as mensagens
    Run Keyword And Continue On Failure    Get all posts
    Run Keyword And Continue On Failure    Get all comments

Recuperar todas as postagens
    Get all posts

Recuperar uma postagem
    Get one post

Recuperar todas as mensagens de uma postagem
    Get comments of one post

Criar postagem
    Creat post

Atualizar postagem completa
    Update post completely

Atualizar informação da postagem
    Update item in post

Apagar postagem
    Delete post
