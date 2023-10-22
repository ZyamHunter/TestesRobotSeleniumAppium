*** Settings ***
Library         SeleniumLibrary    timeout=500
Library         Screenshot
Library         ScreenCapLibrary    screenshot_directory=videos

*** Variables ***
${BANK_NAME}                         TESTE CARRASCO 6.0
${EDIT_BANK_NAME}                    TESTE FONTALBA 6.0
${CODIGO_SPD}                        123
${EDITCODIGO_SPD}                    360
${CODIGO_SPI}                        123456
${EDIT_CODIGO_SPI}                   654321
${PRIORITY}                          1
${EDIT_PRIORITY}                     2
${BANK_LINK}                         https://play-lh.googleusercontent.com/CyP_f9VxfdTyixcWO_-2IW5cJ1M8adkqRrY9Wo_CkH0Ixj12qdg1SJHpuye-9n_YYqM=s180
${EDIT_BANK_LINK}                    https://play-lh.googleusercontent.com/jaCkHvnjyNSTiID7_xDQATtRBDdH0eHZlnPNKIUWhx4XrrUQveXgtOnz9NiHz2AaCtcN=s180

*** Keywords ***
Clicar no botão Gestão Bancos
    Wait Until Element Is Visible     xpath=//*[contains(text(), "Gestão de bancos")]
    Click Element                     xpath=//*[contains(text(), "Gestão de bancos")]

Alterar ordem de bancos para baixo
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[6]/div/button[1]
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[1]/div[6]/div/button[1]

Alterar ordem de bancos para cima
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[2]/div[6]/div/button[2]
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[2]/div[6]/div/button[2]

Clicar no botão ADICIONAR - Gestão de bancos
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/a/div/button
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/a/div/button

Digitar nome do banco
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[1]/div[1]/div/div/div/input
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[1]/div[1]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${BANK_NAME}

Digitar código SPD do banco
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[1]/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${CODIGO_SPD}

Digitar código SPI do banco
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[1]/div[3]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${CODIGO_SPI}

Digitar prioridade do banco
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[2]/div[1]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${PRIORITY}

Digitar url do ícone do banco
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[2]/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${BANK_LINK}


Editar nome do banco
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[1]/div[1]/div/div/div/input
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[1]/div[1]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${EDIT_BANK_NAME}

Editar código SPD do banco
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[1]/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${EDIT_CODIGO_SPD}

Editar código SPI do banco
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[1]/div[3]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${EDIT_CODIGO_SPI}

Editar prioridade do banco
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[2]/div[1]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${EDIT_PRIORITY}

Editar url do ícone do banco
    Press Keys                        //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[3]/div[2]/div[2]/div/div/div/input    HOME    SHIFT+END+BACKSPACE    ${EDIT_BANK_LINK}



Clicar no botão adicionar (Listagem de bancos > Adicionar banco)
    Click Button                      Adicionar

Clicar no ícone de detalhes (Listagem de bancos)
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[2]/div[8]/div/a/button
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[2]/div[8]/div/a/button

Clicar no botão salvar (Listagem de bancos > Adicionar banco)
    Click Button                      Salvar

Clicar no botão remover (Listagem de bancos)
    Wait Until Element Is Visible     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[3]/div[7]/div/button
    Click Element                     //*[@id="root"]/div/div/div/div[2]/div[2]/div/div/div[2]/div/div/div/div[2]/div[2]/div/div/div/div/div/div[3]/div[7]/div/button

Verificar se o banco foi atualizado
    ${passed}=    Run Keyword And Return Status    Page Should Not Contain Element    //div[@class="ant-message-custom-content ant-message-error"]
    Run Keyword If    '${passed}' != 'True'    Stop Video Recording
    Page Should Contain               ${EDIT_BANK_NAME}

Verificar se o banco foi adicionado
    ${passed}=    Run Keyword And Return Status    Page Should Not Contain Element    //div[@class="ant-message-custom-content ant-message-error"]
    Run Keyword If    '${passed}' != 'True'    Stop Video Recording
    Page Should Contain               ${BANK_NAME}

