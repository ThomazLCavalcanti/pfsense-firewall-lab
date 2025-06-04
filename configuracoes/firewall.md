
# Configuração de Regras de Firewall no pfSense

## Objetivo
Criar regras de firewall no pfSense que garantam:
- Segmentação entre redes internas (VLANs)
- Acesso seguro à internet
- Acesso controlado entre segmentos (DMZ, LAN, VPN)
- Bloqueio de tráfego indesejado

## Regras Criadas

### 🔒 Regras de Entrada na WAN
| Nº | Ação | Protocolo | Porta | Origem        | Destino       | Descrição                   |
|----|------|-----------|-------|----------------|----------------|-----------------------------|
| 1  | Pass | TCP       | 1194  | *              | WAN Address    | Permitir acesso OpenVPN    |
| 2  | Block| Any       | *     | *              | WAN Address    | Bloquear acesso externo     |

### 🔐 Regras de Acesso Interno (LAN para WAN)
| Nº | Ação | Protocolo | Porta  | Origem  | Destino     | Descrição                    |
|----|------|-----------|--------|----------|--------------|------------------------------|
| 1  | Pass | Any       | *      | LAN net | Any          | Permitir navegação internet  |

### 🔁 Regras entre VLANs
| Nº | Ação | Protocolo | Porta  | Origem       | Destino       | Descrição                        |
|----|------|-----------|--------|----------------|----------------|----------------------------------|
| 1  | Block| Any       | *      | HR VLAN       | TI VLAN       | Isolamento de setores           |
| 2  | Pass | TCP       | 22     | TI VLAN       | HR VLAN       | Acesso SSH permitido da TI      |

### 🌐 Regras para DMZ
| Nº | Ação | Protocolo | Porta | Origem    | Destino  | Descrição                     |
|----|------|-----------|-------|------------|------------|-------------------------------|
| 1  | Pass | TCP       | 80,443| WAN net   | DMZ       | Acesso HTTP/HTTPS ao site     |
| 2  | Block| Any       | *     | DMZ       | LAN net   | Impedir acesso da DMZ à LAN   |

## Capturas
Veja `imagens/regra_firewall.png` para visualização das regras na interface do pfSense.

## Observações
- Todas as regras foram aplicadas na aba correspondente à interface de rede.
- A ordem das regras é importante no pfSense (da primeira para a última).
- Logs de firewall ativados para todas as regras importantes.
