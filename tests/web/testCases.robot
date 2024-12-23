*** Settings *** 

Resource                                    keywords.robot


*** Test Cases ***


Cenário 01: Realizar Login
    Dado que estou na tela de login
    Quando inserir as credenciais válidas
    Então sou redirecionado para a tela Dashboard

Cenário 02: Cadastrar novo Admin e validar sucesso
    Dado que estou logado 
    E na tela "Admin"
    Quando inserir as informações do novo Admin
    Então o Admin é cadastrado com sucesso

Cenário 03: Buscar Admin cadastrado
    Dado que estou logado 
    E na tela "Admin"
    Quando buscar Admin cadastrado
    Então o Admin é exibido na lista de Admins

Cenário 04: Apagar Admin cadastrado
    Dado que estou logado 
    E na tela "Admin"
    Quando apagar Admin cadastrado
    Então o Admin é removido da lista de Admins

Cenário 05: Realizar Logout
    Dado que estou logado
    Quando clicar em "Logout"
    Então sou redirecionado para a tela de login