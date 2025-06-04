#!/bin/bash

# Script de Teste de Conectividade via Ping
# Descrição: Verifica a conectividade entre hosts internos, DMZ e a internet.

echo "Iniciando testes de conectividade (ping)..."
echo "-------------------------------------------"

# Lista de testes: Descrição | IP de destino
declare -A destinos=(
  ["Ping VLAN 10 (TI)"]="192.168.10.10"
  ["Ping VLAN 20 (RH)"]="192.168.20.10"
  ["Ping VLAN 30 (Financeiro)"]="192.168.30.10"
  ["Ping DMZ Web Server"]="192.168.100.10"
  ["Ping Gateway pfSense"]="192.168.1.1"
  ["Ping Internet (Google DNS)"]="8.8.8.8"
)

for descricao in "${!destinos[@]}"; do
  ip=${destinos[$descricao]}
  echo -e "\nTeste: $descricao"
  ping -c 3 $ip > /dev/null 2>&1

  if [ $? -eq 0 ]; then
    echo "✅ Conectividade com $ip OK"
  else
    echo "❌ Falha ao alcançar $ip"
  fi
done

echo -e "\nTestes de ping concluídos."
