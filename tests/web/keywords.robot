*** Settings ***

Library                                     Browser                                 auto_closing_level=SUITE

*** Keywords ***


Dado que estou na tela de login
    New Browser                             chromium                                headless=False
    New Page                                https://opensource-demo.orangehrmlive.com/

Quando inserir as credenciais válidas
    Fill Text                               //input[@name="username"]               Admin
    Fill Text                               //input[@name="password"]               admin123
    Click                                   //button[@type="submit"]

Então sou redirecionado para a tela Dashboard
    Wait For Elements State                 //h6[text()="Dashboard"]                visible

Dado que estou logado
    Wait For Elements State                 //li[contains(@class,"userdropdown")]   visible

E na tela "Admin"
    Click                                   //span[text()="Admin"]/../..//a

Quando inserir as informações do novo Admin
    Click                                   //button[normalize-space()="Add"]
    Click                                   //label[text()="User Role"]/../..//i
    Click                                   //label[text()="User Role"]/../..//*[text()="Admin"]
    Click                                   //label[text()="Status"]/../..//i
    Click                                   //label[text()="Status"]/../..//*[text()="Enabled"]
    Fill Text                               //label[text()="Employee Name"]/../..//input                                    Orange Test Test
    Click                                   //label[text()="Employee Name"]/../..//div[contains(@class,"autocomplete-dropdown")]//*[text()="Orange Test Test"]       
    Fill Text                               //label[text()="Username"]/../..//input                                         nomeAdmin
    Fill Text                               //label[text()="Password"]/../..//input                                         admin123
    Fill Text                               //label[text()="Confirm Password"]/../..//input                                 admin123
    Click                                   //button[normalize-space()="Save"]

Então o Admin é cadastrado com sucesso
    Wait For Elements State                 //*[text()="Successfully Saved"]        visible

Quando buscar Admin cadastrado
    Fill Text                               //label[text()="Username"]/../..//input                                         nomeAdmin
    Click                                   //label[text()="User Role"]/../..//i
    Click                                   //label[text()="User Role"]/../..//*[text()="Admin"]
    Fill Text                               //label[text()="Employee Name"]/../..//input                                    Orange Test Test
    Click                                   //label[text()="Employee Name"]/../..//div[contains(@class,"autocomplete-dropdown")]//*[text()="Orange Test Test"]  
    Click                                   //label[text()="Status"]/../..//i
    Click                                   //label[text()="Status"]/../..//*[text()="Enabled"]
    Click                                   //button[normalize-space()="Search"]

Então o Admin é exibido na lista de Admins
    Wait For Elements State                 //div[@role="table"]//div[@role="row"]//div[text()="nomeAdmin"]                 visible

Quando apagar Admin cadastrado
    Quando buscar Admin cadastrado
    Click                                   //input[@type="checkbox" and @value=0]/..//span
    Click                                   //button[contains(@class,"table-cell-action")]//i[contains(@class,"trash")]
    Click                                   //button[normalize-space()="Yes, Delete"]

Então o Admin é removido da lista de Admins
    Wait For Elements State                 //*[text()="Successfully Deleted"]      visible

Quando clicar em "Logout"
    Click                                   //i[contains(@class,"userdropdown-icon")]
    Click                                   //li//a[text()="Logout"]

Então sou redirecionado para a tela de login
    Wait For Elements State                 //h5[text()="Login"]                    visible


