*** Settings ***

Library                                     RequestsLibrary
Library                                     Collections

*** Keywords ***


Dado que tenho um cep válido
    Set Global Variable                     ${cepValido}                            69084-470

Quando faço uma requisição GET para a API de CEP
    Create Session                          CEP                                     https://viacep.com.br/ws/
    ${response}                             GET On Session                          CEP                                     /${cepValido}/json
    ${response}                             Convert To Dictionary                   ${response.json()}
    Set Global Variable                     ${response}

Então o logradouro da resposta deve ser "Rua Cacatua"
    ${logradouro}                           Get From Dictionary                     ${response}                             logradouro
    Should Be Equal As Strings              ${logradouro}                           Rua Cacatua

Então o DDD da resposta deve ser "92"
    ${ddd}                                  Get From Dictionary                     ${response}                             ddd
    Should Be Equal As Strings              ${ddd}                                  92