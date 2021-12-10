*** Variables ***

${SITE}                         https://www.digitalhouse.com/br
${NAVEGADOR}                    Chrome
${COOKIE_FRAME}                 xpath=/html/body/iframe[2]
${ACEITAR_COOKIE}               xpath=/html/body/div/div/div[1]/div[1]/div[2]/div[1]/div[2]
${CONHECER_CURSOS}              xpath=//*[@id="__next"]/div/main/section[1]/div/div/div[1]/div/div[2]/div/a
${SELECIONAR_DATA_ANALYTIC}     xpath=//*[@id="__next"]/div/main/section[2]/div/div/div[1]/a
${CAMPO_TITULO}                 xpath=//*[@id="__next"]/div/main/section/div/div/div[1]/div/div[1]/p
${SELECIONAR_INSCREVA_SE}       xpath=//*[@id="__next"]/div/main/section/div/div/div[1]/div/div[2]/div/a
${BUTTON_INSCREVA_SE}           xpath=//*[@id="0"]/div/a
${CAMPO_PRECO}                  xpath=//*[@id="__next"]/div/main/section[2]/div/div[2]/dl/div/div[4]/div/div/span[1]
${SELECIONAR_DATA_SCIENCE}      xpath=//*[@id="__next"]/div/main/section[2]/div/div/div[2]/a
${SELECIONAR_DEV_MOBILE_AND}    xpath=//*[@id="__next"]/div/main/section[2]/div/div/div[3]/a
${SELECIONAR_DEV_MOBILE_IOS}    xpath=//*[@id="__next"]/div/main/section[2]/div/div/div[4]/a
${SELECIONAR_DEV_FULLSTACK}     xpath=//*[@id="__next"]/div/main/section[2]/div/div/div[5]/a
${SELECIONAR_CTD}               xpath=//*[@id="__next"]/div/main/section[2]/div/div/div[10]/a
${CAMPO_TXT_CTD}                xpath=//*[@id="uJoXSc4pmpxQqCNPVe60oOnXzvTHiJXF"]/h1/font/b
${TEXTO_ESPERADO2}              Crie novas formas de viver o mundo           
${INSCREVA-SE-CTD}              xpath=//*[@id="wIc9FaFLQtAaqfERX7toZ8vOupowTGkN"]/div[1]
${CAMPO_NOME}                   xpath=//*[@id="SPxdIrhGPqy1WTAe5qzVoB7MONOoSOZB"]
${NOME}                         Gabriel
${CAMPO_SOBRENOME}              xpath=//*[@id="DyESSyoTrg8EZUGtiPbmZmuL5y03FlCN"]
${SOBRENOME}                    Gomes
${CAMPO_EMAIL}                  xpath=//*[@id="Lbqhh6B7SmT1OnakIxZ0TBmT2o2IxVNq"]
${EMAIL}                        kbeca.gabriel793@gmail.com
${CAMPO_CELULAR}                xpath=//*[@id="zVe3bzxdSNmVk5qFPuJgonal9LqQMlq8"]
${CELULAR}                      81997071755
${CAMPO_ESTADO}                 xpath=//*[@id="FhKAsNwtv8stLHRSHxLfxd7lkcUMkiM6"]
${ESTADO}                       Pernambuco
${SABER_CURSO}                  xpath=//*[@id="oNRhffVuMHVvyC4GWZzrJrIGLDmweIxT"]
${S_CURSO}                      Eventos


*** Keywords ***

Abrir o Site

    Open Browser                                                        ${SITE}                 ${NAVEGADOR}
    Maximize Browser Window
    Set Selenium Speed        0.1

Clicar em “Aceitar Cookies”

    Select frame                                                        ${COOKIE_FRAME} 
    Wait and Click                                                      ${ACEITAR_COOKIE}
    Unselect frame 

Clicar em “Conheça nossos cursos”

    Wait and Click                                                      ${CONHECER_CURSOS}

Selecionar o curso “Data Analytics”

    Scroll Wait and Click                                               ${SELECIONAR_DATA_ANALYTIC}

Verificar se o subtitulo do curso corresponde a “${TEXTO_ESPERADO}”

    Element Should Contain                                              ${CAMPO_TITULO}         ${TEXTO_ESPERADO}

Verificar se a página contém o termo “${TEXTO_PAGINA}”

    Page Should Contain                                                 ${TEXTO_PAGINA}
   
Clicar em “Inscreva-se”
    Wait and Click                                                      ${SELECIONAR_INSCREVA_SE}
    Wait and Click                                                      ${BUTTON_INSCREVA_SE}

Validar se o valor do curso é “${VALIDAR_PRECO}”

    Execute JavaScript                                                  window.scrollTo(0,200)
    Wait Until Element is Visible                                       ${CAMPO_PRECO}
    Element Should Contain                                              ${CAMPO_PRECO}           ${VALIDAR_PRECO}


#====================================================== extra case 2

Selecionar o curso “Data Science”

    Wait and Click                                                      ${SELECIONAR_DATA_SCIENCE}

#====================================================== extra case 3

Selecionar o curso “Desenvolvimento Mobile Android”

    Execute JavaScript                                                  window.scrollTo(0,200)
    Wait and Click                                                      ${SELECIONAR_DEV_MOBILE_AND}

#====================================================== extra case 4

Selecionar o curso “Desenvolvimento Mobile IOS”

    Execute JavaScript                                                  window.scrollTo(0,200)
    Wait and Click                                                      ${SELECIONAR_DEV_MOBILE_IOS}

#====================================================== extra case 5

Selecionar o curso “Desenvolvimento Web Full Stack”

    Execute JavaScript                                                  window.scrollTo(0,300)
    Wait and Click                                                      ${SELECIONAR_DEV_FULLSTACK}

#====================================================== extra case 6

Selecionar o curso “Certified Tech Developer”

    Execute JavaScript                                                  window.scrollTo(0,500)
    Wait and Click                                                      ${SELECIONAR_CTD}

Verificar se o subtitulo do curso corresponde a “Crie novas formas de viver o mundo”

    Element Should Contain                                              ${CAMPO_TXT_CTD}       ${TEXTO_ESPERADO2}

Clicar em “Inscreva-se” CTD

    Wait and Click                                                      ${INSCREVA-SE-CTD}

Preencher os campos do formulário “Faça parte do futuro digital”

    Input Text                                                          ${CAMPO_NOME}           ${NOME}
    Input Text                                                          ${CAMPO_SOBRENOME}      ${SOBRENOME}
    Input Text                                                          ${CAMPO_EMAIL}          ${EMAIL}
    Input Text                                                          ${CAMPO_CELULAR}        ${CELULAR}
    Select From List by Value                                           ${CAMPO_ESTADO}         ${ESTADO}
    Select From List by Value                                           ${SABER_CURSO}          ${S_CURSO}
    Sleep                                                               2



# ========================================================== funções

Wait and Click

    [Arguments]                                                         ${ELEMENTO}
    Wait Until Element is Visible                                       ${ELEMENTO}   10
    wait Until Element is Enabled                                       ${ELEMENTO}
    Click Element                                                       ${ELEMENTO}


Wait and Input Text

    [Arguments]                                                         ${ELEMENTO}               ${TXT}
    Wait Until Element is Visible                                       ${ELEMENTO} 
    wait Until Element is Enabled                                       ${ELEMENTO}    
    Click Element                                                       ${ELEMENTO}
    Input Text                                                          ${ELEMENTO}               ${TXT}

Scroll Wait and Click

    [Arguments]  ${ELEMENTO}
    Wait Until Element is Visible                                       ${ELEMENTO}
    Wait Until Element is Enabled                                       ${ELEMENTO}
    Scroll Element Into View                                            ${ELEMENTO}
    Click Element                                                       ${ELEMENTO}