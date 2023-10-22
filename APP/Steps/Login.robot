*** Settings ***
Library      AppiumLibrary    timeout=500
Library      OperatingSystem
Library      DateTime
Library      ScreenCapLibrary   screenshot_directory=videos

*** Variables ***
#variáveis de configuração
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                Bankeiro
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_DEVICENAME}         emulator-5554
${ANDROID_APPPACKAGE}         com.bankeiro.test

${USER_LOGIN}    Silvana123
${USER_PASSWORD}    Pass123123

*** Keywords ***
Abrir aplicativo
    Open Application  http://localhost:4723/wd/hub    platformName=${ANDROID_PLATFORM_NAME}    deviceName=${ANDROID_DEVICENAME}    appPackage=${ANDROID_APPPACKAGE}   appActivity=com.bankeiro.test.MainActivity    automationName=${ANDROID_AUTOMATION_NAME}

Esperar carregamento da página Home
    Wait Until Page Contains Element    xpath=//android.widget.ScrollView
    Wait Until Page Contains Element    //*[contains(@text,"ENTRAR")]
    Click Text    ENTRAR

Preencher campo usuário
    Wait Until Page Contains Element    xpath=//android.widget.EditText
    Input Text    xpath=//android.widget.EditText    ${USER_LOGIN}
    Click Text    CONTINUAR

Preencher campo senha
    Wait Until Page Contains Element    xpath=//android.widget.EditText
    Sleep    3s
    Input Text    xpath=//android.widget.EditText    ${USER_PASSWORD}

Clicar no botão entrar (login)
    Click Text    Entrar

Pop-up
    Sleep    2s
    Wait Until Page Contains Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup
    Click Text    Agora não

Confirmação do sms
    Wait Until Page Contains Element    xpath=//android.widget.EditText
    Wait Until Page Contains Element    //*[contains(@text,"Entrar")]
    Sleep    14s
    Input Text    xpath=//android.widget.EditText    112233
    Click Text    Entrar

Pop-up de localização
    Wait Until Page Contains Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView

Permissão android
    Wait Until Page Contains Element    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Click Element    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button

Start-rate
    Wait Until Page Contains Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]


