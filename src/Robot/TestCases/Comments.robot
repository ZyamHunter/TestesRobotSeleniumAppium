*** Settings ***
Documentation       Validação automatizada das rotas de postagens -> /posts

Library             RequestsLibrary
Resource            ../Resources/Comments.robot
Resource            ../Component/Validate_Dict.robot


*** Keywords ***
Get all comments
    ${params}    Create Dictionary
    ...    postId=${POST_ID}

    ${RESPONSE}    GET On Session
    ...    alias=JSON API
    ...    url=/comments
    ...    params=${params}
    ...    expected_status=200

    FOR    ${element}    IN    @{RESPONSE.json()}
        Validate Dict    ${element}    ${COMMENTS_LIST}
    END
