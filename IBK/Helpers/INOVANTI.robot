*** Settings ***

*** Variables ***
${INOVANTI}                            https://ibk.stg.bankeiro.inovanti.com.br/

${USER_LOGIN}                        bruno.cabral
${USER_CODE}                         112233
${USER_PASSWORD}                     Pass123123

${FIRST_CONTACT_NAME}                Leonardo Fernando Ricardo Nogueira
${FIRST_CONTACT_CPF}                 79138052776
${FIRST_CONTACT_COMPANY}             1
${FIRST_CONTACT_ACCOUNT_NUMBER}      27936
${FIRST_CONTACT_BANK}                001
${FIRST_CONTACT_DIGIT}               6

${SECOND_CONTACT_NAME}               Bruno Cabral
${SECOND_CONTACT_CPF}                74628550034
${SECOND_CONTACT_COMPANY}            1
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
