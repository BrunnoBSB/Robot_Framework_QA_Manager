*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    Collections
Library    JSONLibrary

*** Test Cases ***
CT- Atualizar Valor no JSON
    Atualiza Json

*** Keywords ***
Atualiza Json
####################### Ler arquivo json #######################
    ${ArquivoJson}   Ler Arquivo Json [data22.json]
    ${DATA}        Get From Dictionary    ${ArquivoJson}        DATA
    Log To Console    \n${DATA} Data inicial

####################### Adicao de 01 dia na data #######################
    ${DATA_ALTERADA}    DateTime.Add Time To Date    ${DATA}    +1 day
    Log To Console     Data uptade...

####################### Formate data para retirar strings indesejadas ##################
    ${DATA_ALTERADA}    Convert Date    ${DATA_ALTERADA}   result_format=%Y/%m/%d
    Log To Console    ${DATA_ALTERADA} Data padrao USA

###################### Salvando alteração do valor DATA no JSON #############################
    ${JSON_ADD}    Update Value To Json    ${ArquivoJson}    $.DATA    ${DATA_ALTERADA}
    Dump Json To File   data22.json   ${JSON_ADD}
    Log To Console    ${JSON_ADD} JSON Atualizado

########################## Converte data para formato brasileiro  e preenche campo ################
    ${DATA_ALTERADA}    Convert Date    ${DATA_ALTERADA}   result_format=%d/%m/%Y
    ${ArquivoJson}   Ler Arquivo Json [data22.json]
    ${PREENCHER_CAMPO}        Get From Dictionary    ${ArquivoJson}        DATA
    Log To Console    ${DATA_ALTERADA} Data padrao BRA
    #Input Text    XPATH=CAMPO_DATA    ${PREENCHER_CAMPO}

############# Keyword de configuracao JSON ###################################
Ler Arquivo Json [${CaminhodoArquivo}]
    ${ArquivoJson}   Load Json From File  ${CaminhodoArquivo}    UTF-8
    [Return]    ${ArquivoJson}


