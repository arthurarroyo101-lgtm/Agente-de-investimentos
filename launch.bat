@echo off
title B3 Agent - Inicializando...
echo.
echo  ==========================================
echo   B3 Agent ^| Rico (XP)
echo   Iniciando servidor local...
echo  ==========================================
echo.

:: Verifica Python
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo  [OK] Python encontrado
    set CMD=python -m http.server 8741
    goto :serve
)

py --version >nul 2>&1
if %errorlevel% equ 0 (
    echo  [OK] Python (py) encontrado
    set CMD=py -m http.server 8741
    goto :serve
)

:: Tenta Node.js / npx
npx --version >nul 2>&1
if %errorlevel% equ 0 (
    echo  [OK] Node.js encontrado
    set CMD=npx serve -l 8741
    goto :serve
)

echo  [ERRO] Python ou Node.js nao encontrado.
echo  Instale Python em: https://python.org/downloads
pause
exit /b 1

:serve
echo  [OK] Abrindo em http://localhost:8741
echo.
:: Abre o navegador apos 1.5s
start /b cmd /c "timeout /t 2 /nobreak >nul && start http://localhost:8741"
:: Inicia servidor (bloqueia ate fechar)
%CMD%
