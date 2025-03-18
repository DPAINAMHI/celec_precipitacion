#!/bin/bash

# Directorio del repositorio
REPO_DIR="/home/srvdpahidrologia/celec_precipitacion"

echo "===== Inicio de la subida automática a GitHub ====="
echo "Fecha y hora: $(date)"
echo "Directorio del repositorio: $REPO_DIR"

# Cambiar al directorio del repo
cd $REPO_DIR || { echo "No se pudo acceder al repositorio"; exit 1; }

# Confirmar archivos
echo "Archivos disponibles para commit:"
ls -lh --time-style=long-iso *.json *.html

# Agregar todos los archivos (forzando)
git add -A

# Verificar si hay cambios (para el log)
if git diff --cached --quiet; then
    echo "⚠️  No hay diferencias detectadas, se forzará un commit."
else
    echo "✅ Hay cambios en los archivos."
fi

# Realiza el commit forzado (aunque git diga que no hay cambios)
git commit --allow-empty -m "Actualización automática del $(date '+%d-%m-%Y %H:%M')"

# Subir a GitHub
git push origin main

echo "===== Fin del proceso ====="
