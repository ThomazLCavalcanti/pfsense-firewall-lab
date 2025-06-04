#!/bin/bash

# Script de varredura Nmap no ambiente de laboratório pfSense
# Descrição: Verifica portas abertas e serviços em hosts da rede interna e DMZ.

echo "Iniciando varredura com Nmap..."
echo "----------------------------------"

# Alvo principal: servidor na DMZ (exemplo: Web Server)
DMZ_IP="192.168.100.10"
GATEWAY_IP="192.168.1.1"

# Verifica se o Nmap está instalado
if ! command -v nmap &> /dev/null; then
    echo "❌ Nmap não está instalado. Por favor, instale com: sudo apt install nmap"
    exit 1
fi

# Scan do servidor da DMZ
echo -e "\n🔎 Escaneando servidor DMZ ($DMZ_IP)..."
nmap -Pn -sS -sV -p- $DMZ_IP | tee dmz_scan_result.txt

# Scan do gateway pfSense (opcional, apenas para checar portas de gerenciamento)
echo -e "\n🔎 Escaneando pfSense Gateway ($GATEWAY_IP)..."
nmap -Pn -sS -sV -p 22,80,443 $GATEWAY_IP | tee gateway_scan_result.txt

echo -e "\n✅ Varreduras finalizadas. Resultados salvos em:"
echo " - dmz_scan_result.txt"
echo " - gateway_scan_result.txt"
