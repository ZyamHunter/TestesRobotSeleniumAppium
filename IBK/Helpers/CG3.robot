*** Settings ***

*** Variables ***
${CG3}                               https://ibk.bankeiro.cg3bank.com.br/

${USER_LOGIN}                        messias
${USER_CODE}                         112233
${USER_PASSWORD}                     Pass123123

${FIRST_CONTACT_NAME}                Calebe André Tomás Cavalcanti
${FIRST_CONTACT_CPF}                 04261842114
${FIRST_CONTACT_COMPANY}             1
${FIRST_CONTACT_ACCOUNT_NUMBER}      25403
${FIRST_CONTACT_BANK}                001
${FIRST_CONTACT_DIGIT}               7

${SECOND_CONTACT_NAME}               Bruno Cabral
${SECOND_CONTACT_CPF}                90604403070
${SECOND_CONTACT_COMPANY}            1
${SECOND_CONTACT_ACCOUNT_NUMBER}     25513
${SECOND_CONTACT_BANK}               001
${SECOND_CONTACT_DIGIT}              0

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
