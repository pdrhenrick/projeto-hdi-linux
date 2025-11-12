#!/bin/bash
# Script de Backup do Site para o S3
# ATENÇÃO: Mude o nome do bucket!

# Pasta de origem (seu site)
ORIGEM="/var/www/html/"

# Destino temporário local
DEST_LOCAL="/tmp/backup_site_$(date +%F)/"

# Nome do Bucket S3
BUCKET_S3="s3://SEU-BUCKET-VAI-AQUI"

echo "Iniciando backup local com rsync..."
rsync -avz $ORIGEM $DEST_LOCAL

echo "Enviando backup para o S3..."
aws s3 sync $DEST_LOCAL $BUCKET_S3
