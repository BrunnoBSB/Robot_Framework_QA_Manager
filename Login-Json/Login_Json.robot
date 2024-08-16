*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${username}    xpath=//*[@id='username']
${password}    xpath=//*[@id='password']
${BtnSubmit}   xpath=//*[@id="submit"]

*** Test Cases ***
Teste Upload
    Acessar a Home Page
    Fornecer dados de login
    Home logada com sucesso
    
*** Keywords **
#JSON

Acessar a Home Page
    ${ArquivoJson}    Ler Arquivo Json [TesteData\\data.json]
    ${SITE}    Get From Dictionary   ${ArquivoJson}    URL
    Open Browser    ${SITE}    chrome    #options=add_argument("--headless")
    Maximize Browser Window
    Wait Until Page Contains    Test login
    Wait Until Page Contains    Username 
    Wait Until Page Contains    Password 
    Wait Until Page Contains    Submit

Fornecer dados de login
    ${ArquivoJson}    Ler Arquivo Json [TesteData\\data.json]
    ${Usuario}        Get From Dictionary   ${ArquivoJson}    Username
    ${Senha}          Get From Dictionary   ${ArquivoJson}    Password

    Wait Until Element Is Visible   ${username}
    Input Text    ${username}       ${Usuario}
    
    Wait Until Element Is Visible   ${password}
    Input Text    ${password}       ${Senha}

    Wait Until Element Is Visible   ${BtnSubmit}
    Click Button                    ${BtnSubmit}

Home logada com sucesso
    Wait Until Page Contains    Logged In Successfully
    Wait Until Page Contains    Congratulations student. You successfully logged in!
    Capture Page Screenshot

Ler Arquivo Json [${LocalArquivoJson}]
    ${ArquivoJson}    Load Json From File   ${LocalArquivoJson}   encoding=UTF-8
    [Return]   ${ArquivoJson}
    