*** Settings ***
Library         SeleniumLibrary    timeout=500

*** Keywords ***
Preencher campo email
    [Arguments]    ${user}
    Input Text                        //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[3]/div/div/div/div/input    ${user}

Preencher campo senha
    [Arguments]    ${password}
    Input Text                        //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[4]/div/div/div/div/input    ${password}

Clicar no botão entrar
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[5]/div/div/div/button
    Click Element                     //*[@id="root"]/div/div/div/div/div/div/div/div/div/form/div/div/div[5]/div/div/div/button

Verificar login
    [Arguments]    ${url_acess}

    ${current_url}=                   Get Location    

    Run Keyword If                    '${current_url}' != '${url_acess}/usuarios/relatorio?page=0'    Capture Page Screenshot    ./Login/Login_Error.png
    Should Not Contain                    ${current_url}    ${url_acess}/usuarios/relatorio?page=0