*** Settings ***
Library           Collections
Library           OperatingSystem
Library           RequestsLibrary

*** Test Cases ***
Teste de Upload de Documento
    ${id}=                 Set Variable    123
    ${type}=               Set Variable    RG
    ${file}=               Set Variable    /path/to/file.jpg
    ${second_file}=        Set Variable    /path/to/second_file.jpg
    ${mimetype}=           Set Variable    image/jpeg
    
    ${image_binary}=       Get Binary File    ${file}
    ${is_rg}=              Run Keyword If    '${type}'=='RG'    True    False
    ${url}=                Get Image Url    ${file}    ${is_rg}
    
    ${second_bucket}=      ${second_url}=      ${second_image_binary}=    ${None}
    Run Keyword If         ${second_file}!=''  Get Second Image Url    ${second_file}    ${is_rg}
    Run Keyword If         ${second_file}!=''  ${second_image_binary}=    Get Binary File    ${second_file}
    
    ${result}=             Save And Upload    ${id}    ${type}    ${image_binary}    ${second_image_binary}    ${mimetype}    ${url}    ${second_url}    ${is_rg}
    Should Be True         ${result}

*** Keywords ***
Get Image Url
    [Arguments]            ${file}    ${is_rg}
    ${ext}=                OperatingSystem.Get File Extension    ${file}
    ${document_type}=      Run Keyword If    ${is_rg}    ${DocumentType.RG_FRONT}    ${type}
    ${response}=           OnboardingApi.Get Image Url    ${ext}    ${document_type}
    [Return]               ${response.url}

Get Second Image Url
    [Arguments]            ${file}    ${is_rg}
    ${ext}=                OperatingSystem.Get File Extension    ${file}
    ${document_type}=      Run Keyword If    ${is_rg}    ${DocumentType.RG_BACK}    ${type}
    ${response}=           OnboardingApi.Get Image Url    ${ext}    ${document_type}
    [Return]               ${response.bucket}    ${response.url}

Save And Upload
    [Arguments]            ${id}    ${type}    ${image_binary}    ${second_image_binary}    ${mimetype}    ${url}    ${second_url}    ${is_rg}
    ${document}=           PendingDocumentsApi.Create Document Dictionary    ${image_binary}    ${mimetype}
    ${documents}=          Create List    ${document}
    ${document_back}=      Run Keyword If    ${second_image_binary}    PendingDocumentsApi.Create Document Dictionary    ${second_image_binary}    ${mimetype}
    Run Keyword If         ${second_url}!=''  Append To List    ${documents}    ${document_back}
    PendingDocumentsApi.Save Document    ${id}    ${type}    ${url.bucket}    ${second_url}    ${documents}
    ${upload_result}=      PendingDocumentsApi.Upload Picture    ${url.url}    ${image_binary}    ${mimetype}
    Run Keyword If         ${second_url}!=''  PendingDocumentsApi.Upload Picture    ${second_url}    ${second_image_binary}    ${mimetype}
    [Return]               ${True}
