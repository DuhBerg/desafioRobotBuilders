*** Settings ***

Library                                     AppiumLibrary                           run_on_failure=No Operation                           


*** Variables ***

${remoteUrl}                                http://127.0.0.1:4723
${platformName}                             Android
${deviceName}                               Pixel 5 API 33
${automationName}                           UiAutomator2          
${appPackage}                               com.example.vamsi.login               
${appActivity}                              com.example.vamsi.login.MainActivity     

#Prefixo presente no resource-id dos elementos
${idPrefix}                                 com.example.vamsi.login:id/

*** Keywords ***

Dado que o aplicativo está aberto
    ${appAberto}                            Run Keyword And Return Status           Get Activity
    IF      ${appAberto} == False
        Open Application                    ${remoteUrl}
        ...                                 platformName=${platformName}   
        ...                                 deviceName=${deviceName}
        ...                                 automationName=${automationName}
        ...                                 appPackage=${appPackage}
        ...                                 appActivity=${appActivity}
    END

Quando clicar no botão "Register"
    Wait Until Element Is Visible           id=${idPrefix}tvRegister 
    Click Element                           id=${idPrefix}tvRegister

E preenche os campos obrigatórios
    Wait Until Element Is Visible           id=${idPrefix}etRegName 
    Input Text                              id=${idPrefix}etRegName                 Eduardo Berg
    Input Text                              id=${idPrefix}etRegPhone                19 99999-9999
    Input Text                              id=${idPrefix}etRegGmail                email@gmail.com
    Input Text                              id=${idPrefix}etRegPassword             123456789
    Click Element                           id=${idPrefix}btnRegLogin

Então o cadastro é realizado com sucesso
    ${pageSource}                           Get Source
    Should Contain                          ${pageSource}                           Registration Successful
    Click Element                           id=${idPrefix}btnGotoLogin

Quando preencher os campos de login com um cadastro existente
    Wait Until Element Is Visible           id=${idPrefix}etLogGmail
    Input Text                              id=${idPrefix}etLogGmail                email@gmail.com
    Input Text                              id=${idPrefix}etLoginPassword           123456789
    Click Element                           id=${idPrefix}btnLogin

Então o login é realizado com sucesso
    Wait Until Element Is Visible           xpath=//android.widget.TextView[@text="You are now logged in"]
    Go Back

Quando preencher os campos de login com um cadastro inexistente
    Wait Until Element Is Visible           id=${idPrefix}etLogGmail
    Input Text                              id=${idPrefix}etLogGmail                inexistente@gmail.com
    Input Text                              id=${idPrefix}etLoginPassword           inexistente
    Click Element                           id=${idPrefix}btnLogin

Então o login não é realizado com sucesso
    ${pageSource}                           Get Source
    Should Contain                          ${pageSource}                           Login error
