*** Settings ***
Library         SeleniumLibrary

*** Variables ***
## No Windows coloque barra dupla assim como mostra o exemplo abaixo!
${FILE}         C:\\projetos\\meu_arquivo_qualquer.txt

*** Test Cases ***
Teste Upload
    Faz upload de um arquivo
    Teste de Loop While
    Upload concluido
    
*** Keywords **
Faz upload de um arquivo
    Open Browser    http://the-internet.herokuapp.com/upload    chrome    #options=add_argument("--headless")
    builtin.Sleep    2
    Maximize Browser Window
    builtin.Sleep    1
Teste de Loop While
    WHILE    
        ${UP_VISIBLE} =     Run Keyword And Return Status    Wait Until Element Is Visible    //*[@id="file-upload"]
        Log To Console    ${UP_VISIBLE}
        builtin.Sleep    1
    Exit For Loop If    ${UP_VISIBLE} == False

        Captura Arquivo
    END

Captura Arquivo
    Wait Until Element Is Visible   file-submit
    builtin.Sleep    1
    Click Element    //div[@class="example"]/h3   # CLICK NA TELA
    builtin.Sleep    1
    Choose File     file-upload     ${FILE}
    builtin.Sleep    1
    Click Button    file-submit    # BOTAO UPLOAD DO ARQUIVO
    builtin.Sleep    2
    #Go To    http://the-internet.herokuapp.com/upload 

Upload concluido
        Wait Until Page Contains        File Uploaded!
        Capture Page Screenshot