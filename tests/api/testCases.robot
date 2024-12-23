*** Settings *** 

Resource                                    keywords.robot


*** Test Cases ***


Cenário 01: Validar o logradouro que a API retorna
    Dado que tenho um cep válido
    Quando faço uma requisição GET para a API de CEP
    Então o logradouro da resposta deve ser "Rua Cacatua"

Cenário 02: Validar o DDD que a API retorna
    Dado que tenho um cep válido
    Quando faço uma requisição GET para a API de CEP
    Então o DDD da resposta deve ser "92"