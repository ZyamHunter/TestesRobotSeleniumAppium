*** Settings ***
Library     Collections


*** Keywords ***
Validate Dict
    [Arguments]    ${FIRST_LIST}    ${SECOND_LIST}
    FOR    ${key}    IN    @{SECOND_LIST}
        Dictionary Should Contain Key    ${FIRST_LIST}    ${key}
    END
