*** Settings ***
Library          ScreenCapLibrary    screenshot_directory=Videos

Resource         ../TesteCases/Login.robot
Resource         ../TesteCases/Administradores.robot
Resource         ../TesteCases/Endereços_bloqueados.robot
Resource         ../TesteCases/Push_Notifications.robot
Resource         ../TesteCases/Grupo_Permissões.robot
Resource         ../TesteCases/Logs_usuários.robot
Resource         ../TesteCases/Transações.robot
Resource         ../TesteCases/Gestão_bancos.robot
Resource         ../TesteCases/Feriados.robot

Resource         ../Helpers/Help.robot
Resource         ../Helpers/env.robot

*** Test Cases ***
Login
    ${TODAY}    Get Current Date    result_format=%Y-%m-%d
    ${TODAY}    Convert Date    ${TODAY}   result_format=%d-%m-%Y
    Set Global Variable    ${TODAY}    ${TODAY}

    Start Video Recording    name=./CG3_BANK/Login
    [Tags]    CG3_BANK
    CT: Logar no "${CG3_TEST_ENVIROMENT}" com sucesso
    Sleep    1s
    Stop Video Recording

    Set Selenium Speed    0.2 seconds

Administradores
    Start Video Recording    name=./CG3_BANK/Administradores
    CT: Usuários/administradores
    Sleep    1s
    Stop Video Recording

Endereços bloqueados
    Start Video Recording    name=./CG3_BANK/Endereços bloqueados
    CT: Usuários/Endereços bloqueados
    Sleep    1s
    Stop Video Recording

Grupo de permissões
    Start Video Recording    name=./CG3_BANK/Grupo de permissões
    CT: Usuários / Grupo de permissões
    Sleep    1s
    Stop Video Recording

Logs dos usuários
    Start Video Recording    name=./CG3_BANK/Logs dos usuários
    CT: Usuários/Logs de usuários
    Sleep    1s
    Stop Video Recording

Transações
    Start Video Recording    name=./CG3_BANK/Transações
    CT: Usuários/Transações
    Sleep    1s
    Stop Video Recording

Push notifications
    Start Video Recording    name=./CG3_BANK/Push Notifications
    CT: Marketing/Push Notifications
    Sleep    1s
    Stop Video Recording

Feriados
    Start Video Recording    name=./CG3_BANK/Feriados
    CT: Configurações / Feriados
    Sleep    1s
    Stop Video Recording

Gestão de bancos
    Start Video Recording    name=./CG3_BANK/Gestão_bancos
    
    FOR  ${index}  IN RANGE    3
        CT: Configurações / Gestão de bancos
    END
    
    Sleep    1s
    Stop Video Recording