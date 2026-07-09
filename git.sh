#!/bin/bash
set -e

# Directorio del repositorio
REPO_DIR="/home/srvdpahidrologia/celec_precipitacion"

echo "===== Inicio de la subida automática a GitHub ====="
echo "Fecha y hora: $(date)"
echo "Directorio del repositorio: $REPO_DIR"

# Cambiar al directorio del repo
cd "$REPO_DIR" || { echo "No se pudo acceder al repositorio"; exit 1; }

# Configurar identidad Git local del repositorio
git config --local user.name "adrianarodriguezp"
git config --local user.email "arodriguezinamhi@gmail.com"

echo "Usuario Git configurado:"
git config --local --get user.name
git config --local --get user.email

# Confirmar archivos
echo "Archivos disponibles para commit:"
ls -lh --time-style=long-iso *.json *.html

# Estado antes del commit
echo "Estado Git antes del commit:"
git status --short

# Agregar todos los archivos
git add -A

# Verificar si hay cambios
if git diff --cached --quiet; then
    echo "⚠️ No hay diferencias detectadas, se hará commit vacío para registrar ejecución."
else
    echo "✅ Hay cambios en los archivos."
fi

# Realiza el commit, aunque no haya cambios
git commit --allow-empty -m "Actualización automática del $(date '+%d-%m-%Y %H:%M')"

# Subir a GitHub
git push origin main

echo "===== Fin del proceso ====="
