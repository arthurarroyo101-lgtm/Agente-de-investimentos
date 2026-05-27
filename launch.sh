#!/bin/bash
echo ""
echo "  =========================================="
echo "   B3 Agent | Rico (XP)"
echo "   Iniciando servidor local..."
echo "  =========================================="
echo ""

PORT=8741

# Abre navegador em background
(sleep 1.5 && open "http://localhost:$PORT" 2>/dev/null || xdg-open "http://localhost:$PORT" 2>/dev/null) &

if command -v python3 &>/dev/null; then
    echo "  [OK] Usando Python 3"
    python3 -m http.server $PORT
elif command -v python &>/dev/null; then
    echo "  [OK] Usando Python"
    python -m http.server $PORT
elif command -v npx &>/dev/null; then
    echo "  [OK] Usando Node.js"
    npx serve -l $PORT
else
    echo "  [ERRO] Python ou Node.js nao encontrado."
    exit 1
fi
