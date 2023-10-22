*** Settings ***
Library         SeleniumLibrary    timeout=500
Library         DateTime

*** Variables ***
${IP_ADRESS}                          12347839937
${MAC_ADRESS}                         74892877829
${DEVICE_ADRESS}                      77368292768

${TYPE_IP}                            xpath=//*[@class="MuiButtonBase-root MuiListItem-root MuiMenuItem-root Mui-selected MuiMenuItem-gutters MuiListItem-gutters MuiListItem-button Mui-selected"]
${TYPE_MAC}                           //*[@id="menu-"]/div[3]/ul/li[3]
${TYPE_DEVICE}                        //*[@id="menu-"]/div[3]/ul/li[2]

*** Keywords ***
Clicar em endereços bloqueados
    Wait Until Element Is Visible     xpath=//*[contains(text(), "Endereços bloqueados")]
    Click Element                     xpath=//*[contains(text(), "Endereços bloqueados")]

Clicar no botão novo bloqueio
    Click Button                      Novo bloqueio

Adicionar número do IP
    Wait Until Element Is Visible     xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/div[1]/div/div/div/input

    Input Text                        xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/div[1]/div/div/div/input    ${IP_ADRESS}

Adicionar número do id do dispositivo
    Wait Until Element Is Visible     xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/div[1]/div/div/div/input

    Input Text                        xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/div[1]/div/div/div/input    ${DEVICE_ADRESS}

Adicionar número do endereço mac
    Wait Until Element Is Visible     xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/div[1]/div/div/div/input

    Input Text                        xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/div[1]/div/div/div/input    ${MAC_ADRESS}

Selecionar tipo de endereço IP
    Click Element                     xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/div[2]/div/div/div/div
    Wait Until Element Is visible     ${TYPE_IP}
    Click Element                     ${TYPE_IP}

Selecionar tipo de endereço ID DO DISPOSITIVO
    Click Element                     xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/div[2]/div/div/div/div
    Wait Until Element Is visible     ${TYPE_DEVICE}
    Click Element                     ${TYPE_DEVICE}

Selecionar tipo de endereço MAC
    Click Element                     xpath=/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div/div[2]/div/div/div/div
    Wait Until Element Is visible     ${TYPE_MAC}
    Click Element                     ${TYPE_MAC}

Clicar no botão bloquear
    Click Button                      Bloquear

Verificar endereço IP boqueado
    Wait Until Element Is Visible    //div[@data-rowindex="0" and @data-colindex="0" and @data-value="${IP_ADRESS}"]
    Page Should Contain Element    //div[@data-rowindex="0" and @data-colindex="0" and @data-value="${IP_ADRESS}"]

Verificar endereço MAC boqueado
    Wait Until Element Is Visible    //div[@data-rowindex="0" and @data-colindex="0" and @data-value="${MAC_ADRESS}"]
    Page Should Contain Element    //div[@data-rowindex="0" and @data-colindex="0" and @data-value="${MAC_ADRESS}"]

Verificar endereço ID DO DISPOSITIVO boqueado
    Wait Until Element Is Visible    //div[@data-rowindex="0" and @data-colindex="0" and @data-value="${DEVICE_ADRESS}"]
    Page Should Contain Element    //div[@data-rowindex="0" and @data-colindex="0" and @data-value="${DEVICE_ADRESS}"]

Filtrar enderço bloqueado por valor
    Input Text                       xpath=//*[@class="MuiInputBase-input MuiOutlinedInput-input"]    ${IP_ADRESS}

Filtrar enderço bloqueado por id
    Click Element                    //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/div
    Click Element                    //*[@id="menu-"]/div[3]/ul/li[1]

Filtrar enderço bloqueado por dispositivo
    Click Element                    //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/div
    Click Element                    //*[@id="menu-"]/div[3]/ul/li[2]

Filtrar enderço bloqueado por mac
    Click Element                    //*[@id="panel1a-content"]/div/div/form/div[1]/div[2]/div/div/div/div/div
    Click Element                    //*[@id="menu-"]/div[3]/ul/li[3]

Filtrar enderço bloqueado por data
    [Tags]    Filtrar endereço bloqueado
    Click Element                     //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div
    Input Text                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[1]/input    15/10/2022
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[1]/input    ENTER
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[3]/input    18/10/2022
    Press Keys                        //*[@id="panel1a-content"]/div/div/form/div[1]/div[3]/div/div/label/div/div[3]/input    ENTER

Clicar no ícone de remover endereço bloqueado
    Wait Until Element Is Visible     //*[@class="transparent-button users__remove--button"]
    Click Element                     //*[@class="transparent-button users__remove--button"]