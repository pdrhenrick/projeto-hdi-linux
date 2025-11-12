#!/bin/bash
# Script de Health Check por Pedro Henrick

echo "--- CHECANDO USO DE DISCO ---"
df -h | grep /dev/sda

echo "--- CHECANDO MEMORIA LIVRE ---"
free -m | grep Mem

echo "--- CHECANDO STATUS DO APACHE ---"
# O 'grep Active' filtra só a linha que importa
systemctl status apache2 | grep Active
