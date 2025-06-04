# Configuração de NAT no pfSense

## Objetivo
Configurar regras de NAT (Network Address Translation) para:
- Permitir acesso à internet para redes internas
- Publicar serviços da DMZ para acesso externo
- Garantir segurança e rastreabilidade

## Tipos de NAT Utilizados

### 🔁 NAT de Saída (Outbound NAT)
- **Modo:** Manual
- **Objetivo:** Garantir que todas as VLANs internas saiam com o IP da WAN.
- **Regras configuradas:**
  - LAN → WAN: Tradução de IP de origem para IP da WAN
  - VLAN10 (TI) → WAN: Tradução de IP de origem para IP da WAN
  - VLAN20 (RH) → WAN: Tradução de IP de origem para IP da WAN

### 🌐 NAT de Entrada (Port Forward)
| Nº | Protocolo | Porta Externa | IP Interno     | Porta Interna | Descrição                     |
|----|-----------|----------------|----------------|----------------|--------------------------------|
| 1  | TCP       | 80             | 192.168.100.10 | 80             | Redirecionar HTTP para Web DMZ |
| 2  | TCP       | 443            | 192.168.100.10 | 443            | Redirecionar HTTPS para Web DMZ |
| 3  | UDP       | 1194           | 192.168.100.20 | 1194           | Acesso VPN externo (OpenVPN)   |

> ⚠️ Lembre-se de criar regras de firewall correspondentes para que os redirecionamentos funcionem.

## Capturas
Veja `imagens/regra_firewall.png` e `imagens/openvpn_conexao.png` para visualizar exemplos dessas configurações.

## Observações
- NAT de saída manual garante controle e facilita o troubleshooting.
- NAT de entrada deve sempre ser restrito às portas necessárias.
- O uso de aliases facilita manutenção de regras.
"""

# Criar arquivo
nat_path = Path("/mnt/data/nat.md")
nat_path.write_text(nat_md)

nat_path.name
