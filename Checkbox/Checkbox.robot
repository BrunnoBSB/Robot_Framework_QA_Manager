*** Settings ***
Documentation    Teste de Usabilidade de checkbox na WEB

Library         SeleniumLibrary
Library        OperatingSystem

*** Variables ***
## No Windows coloque barra dupla assim como mostra o exemplo abaixo!
${FILE}         C:\\projetos\\meu_arquivo_qualquer.txt

*** Test Cases ***
Teste Checkbox 1
    Trabalhar Checkbox de pagina

*** Keywords ***
Trabalhar Checkbox de pagina
    Open Browser    https://demo.automationtesting.in/Register.html    firefox    #options=add_argument("--headless")
    builtin.Sleep    1
    #Execute javascript       document.body.style.MozZoom="30%"
    #Maximize Browser Window
    builtin.Sleep    1

    Scroll Element Into View    //*[@id="secondpassword"]    #rolar ate ver o elemento
    Page Should Contain Checkbox   //*[@id="checkbox1"]     #tem esse check na pagina

    Select Checkbox                 //*[@id="checkbox1"]    #selecionar checkbox
    Checkbox Should Be Selected     //*[@id="checkbox1"]    #checkbox ESTA selecionado?
    builtin.Sleep   1 
    Unselect Checkbox    //*[@id="checkbox1"]            #deselecionar checkbox
    Capture Page Screenshot
    builtin.Sleep    1
    Checkbox Should Not Be Selected    //*[@id="checkbox1"]    #checkbox esta SEM seleção?

    Unselect Checkbox    //*[@id="checkbox1"]        #deselecionar checkbox
    Checkbox Should Not Be Selected    //*[@id="checkbox1"]    #checkbox esta SEM seleção?
    Capture Page Screenshot
    builtin.Sleep    1
    
    Mouse Over    //*[@id="checkbox1"]
    Double Click Element    //*[@id="checkbox1"] 
