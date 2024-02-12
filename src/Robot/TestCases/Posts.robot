*** Settings ***
Documentation       Validação automatizada das rotas de postagens -> /posts

Library             FakerLibrary
Library             RequestsLibrary
Resource            ../Resources/Posts.robot
Resource            ../Resources/Comments.robot
Resource            ../Component/Validate_Dict.robot


*** Keywords ***
Get all posts
    ${RESPONSE}    GET On Session
    ...    alias=JSON API
    ...    url=/posts
    ...    expected_status=200

    FOR    ${element}    IN    @{RESPONSE.json()}
        Validate Dict    ${element}    ${POSTS}
    END

    Set Suite Variable    ${POST_ID}    ${RESPONSE.json()[0]['id']}

Get one post
    ${RESPONSE}    GET On Session
    ...    alias=JSON API
    ...    url=/posts/${POST_ID}
    ...    expected_status=200

    Validate Dict    ${RESPONSE.json()}    ${POSTS}

Get comments of one post
    ${RESPONSE}    GET On Session
    ...    alias=JSON API
    ...    url=/posts/${POST_ID}/comments
    ...    expected_status=200

    FOR    ${element}    IN    @{RESPONSE.json()}
        Validate Dict    ${element}    ${COMMENTS_LIST}
    END

Creat post
    ${title}    FakerLibrary.Text
    ${body}    FakerLibrary.Texts

    ${POST_ITEM}    Create Dictionary
    ...    title=${title}
    ...    body=${body}
    ...    userId=1

    ${RESPONSE}    POST On Session
    ...    alias=JSON API
    ...    url=/posts
    ...    json=${POST_ITEM}
    ...    expected_status=201

    Validate Dict    ${RESPONSE.json()}    ${POSTS}
    Dictionary Should Contain Item    ${RESPONSE.json()}    title    ${title}
    Dictionary Should Contain Item    ${RESPONSE.json()}    body    ${body}
    Dictionary Should Contain Item    ${RESPONSE.json()}    userId    1

Update post completely
    ${title}    FakerLibrary.Text
    ${body}    FakerLibrary.Texts

    ${POST_ITEM}    Create Dictionary
    ...    title=${title}
    ...    body=${body}
    ...    userId=1

    ${RESPONSE}    PUT On Session
    ...    alias=JSON API
    ...    url=/posts/${POST_ID}
    ...    json=${POST_ITEM}
    ...    expected_status=200

    Validate Dict    ${RESPONSE.json()}    ${POSTS}
    Dictionary Should Contain Item    ${RESPONSE.json()}    title    ${title}
    Dictionary Should Contain Item    ${RESPONSE.json()}    body    ${body}
    Dictionary Should Contain Item    ${RESPONSE.json()}    userId    1

Update item in post
    ${title}    FakerLibrary.Text

    ${POST_ITEM}    Create Dictionary
    ...    title=${title}

    ${RESPONSE}    PATCH On Session
    ...    alias=JSON API
    ...    url=/posts/${POST_ID}
    ...    json=${POST_ITEM}
    ...    expected_status=200

    Validate Dict    ${RESPONSE.json()}    ${POSTS}
    Dictionary Should Contain Item    ${RESPONSE.json()}    title    ${title}

Delete post
    ${RESPONSE}    DELETE On Session
    ...    alias=JSON API
    ...    url=/posts/${POST_ID}
    ...    expected_status=200
