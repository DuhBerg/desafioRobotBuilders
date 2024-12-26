@echo off

REM Defina o nome do ambiente virtual
set venv_name=venv

REM Verifique se o ambiente virtual já existe na pasta do script
if not exist %~dp0\%venv_name% (
    echo O ambiente virtual nao foi encontrado na pasta do script.
    echo Criando o ambiente virtual...
    python -m venv %~dp0\%venv_name%
)

REM Ative o ambiente virtual
call %~dp0\%venv_name%\Scripts\activate

REM Upgrade pip command
python -m pip install --upgrade pip

REM Instale as bibliotecas do Robot Framework no ambiente virtual
pip install robotframework --no-cache-dir
pip install robotframework-browser --no-cache-dir
pip install robotframework-appiumlibrary --no-cache-dir
pip install robotframework-requests --no-cache-dir

REM Inicialize o Robot Framework Browser
rfbrowser init

echo Instalacao do Robot Framework concluida.
pause

