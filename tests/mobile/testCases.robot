*** Settings *** 

Resource                                    keywords.robot


*** Test Cases ***


Cenário 01: Crie um Cadastro
    Dado que o aplicativo está aberto
    Quando clicar no botão "Register"
    E preenche os campos obrigatórios
    Então o cadastro é realizado com sucesso

Cenário 02: Realize o login com o novo cadastro e valide se houve sucesso
    Dado que o aplicativo está aberto
    Quando preencher os campos de login com um cadastro existente
    Então o login é realizado com sucesso
    
Cenário 03: Realize o login com um cadastro inexistente e valide o retorno exibido
    Dado que o aplicativo está aberto
    Quando preencher os campos de login com um cadastro inexistente
    Então o login não é realizado com sucesso

