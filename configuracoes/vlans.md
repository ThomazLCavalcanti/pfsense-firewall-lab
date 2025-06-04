# Configuração de VLANs no pfSense

## Objetivo
Segmentar a rede local em sub-redes lógicas distintas para melhorar a segurança, organização e controle de tráfego.

## VLANs Definidas

| VLAN | Nome        | ID  | Sub-rede           | Interface lógica | Finalidade                          |
|------|-------------|-----|---------------------|------------------|-------------------------------------|
| 10   | TI          | 10  | 192.168.10.0/24     | VLAN_Ti          | Rede administrativa e de gestão     |
| 20   | RH          | 20  | 192.168.20.0/24     | VLAN_Rh          | Rede do setor de Recursos Humanos   |
| 30   | Convidados  | 30  | 192.168.30.0/24     | VLAN_Guest       | Acesso isolado à internet           |
| 100  | DMZ         | 100 | 192.168.100.0/24    | VLAN_DMZ         | Zona desmilitarizada para servidores públicos |

## Etapas de Configuração

1. **Criação de Interfaces VLAN**
   - Interface física: `em1` (exemplo)
   - Criar interfaces `em1.10`, `em1.20`, `em1.30`, `em1.100`

2. **Atribuição de Interfaces no pfSense**
   - Atribuir cada VLAN como uma nova interface lógica
   - Nomear de forma intuitiva (ex: VLAN_Ti, VLAN_Rh, etc.)

3. **Configuração de IPs**
   - Atribuir IPs estáticos de gateway para cada sub-rede

4. **DHCP**
   - Configurar servidor DHCP para cada VLAN, exceto DMZ (opcional)

5. **Regras de Firewall**
   - Isolar tráfego entre VLANs
   - Permitir acesso à internet
   - Acesso restrito à VLAN_Ti e DMZ

## Switch Gerenciável
Para que as VLANs funcionem corretamente, o switch conectado ao pfSense deve:
- Estar em modo trunk na porta do pfSense
- Ter as VLANs criadas e associadas às portas corretas (modo access ou trunk conforme necessário)

## Observações
- VLANs ajudam a segmentar e proteger a rede
- Importante manter políticas de acesso claras entre as VLANs
- Testes de ping entre sub-redes devem ser usados para validar isolamento e roteamento
