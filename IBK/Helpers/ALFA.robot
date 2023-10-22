*** Settings ***

*** Variables ***
${ALFA}                            https://ibk.alfa.bankeiro.com/

${USER_LOGIN}                        nori
${USER_CODE}                         112233
${USER_PASSWORD}                     Pass123123

${FIRST_CONTACT_NAME}                Gabriel Freitas Yamamoto
${FIRST_CONTACT_CPF}                 47363030855
${FIRST_CONTACT_AGENCY}              7428
${FIRST_CONTACT_ACCOUNT_NUMBER}      27936
${FIRST_CONTACT_BANK}                001
${FIRST_CONTACT_DIGIT}               6

${SECOND_CONTACT_NAME}               Marcello Antonio Marabita
${SECOND_CONTACT_CPF}                33659550892
${SECOND_CONTACT_AGENCY}             001
${SECOND_CONTACT_ACCOUNT_NUMBER}     27936
${SECOND_CONTACT_BANK}               001
${SECOND_CONTACT_DIGIT}              6

*** Keywords ***
Setar variáveis de login IBK
    Set Suite Variable            ${USER_LOGIN}    ${USER_LOGIN}
    Set Suite Variable            ${USER_CODE}    ${USER_CODE}
    Set Suite Variable            ${USER_PASSWORD}    ${USER_PASSWORD}

Setar variáveis de transferência IBK
    Set Suite Variable    ${FIRST_CONTACT_NAME}    ${FIRST_CONTACT_NAME}
    Set Suite Variable    ${FIRST_CONTACT_CPF}    ${FIRST_CONTACT_CPF}
    Set Suite Variable    ${SECOND_CONTACT_NAME}    ${SECOND_CONTACT_NAME}
    Set Suite Variable    ${SECOND_CONTACT_CPF}    ${SECOND_CONTACT_CPF}
