
# Projeto de Firewall com pfSense

## ✨ Objetivo
Criar um ambiente de laboratório com pfSense em uma VM, simulando um firewall corporativo completo com segmentação de redes, regras de acesso, NAT, VPN e monitoramento. O projeto serve como estudo prático para portfólio, comprovação de conhecimento em segurança de redes e administração de firewalls.

## 📆 Topologia Proposta
```
[INTERNET]
    |
[WAN - pfSense - LAN]
    |               \
[Servidor DMZ]   [Switch VLANs]
                    |     |     |
                [HR] [TI] [Guests]
```

- **pfSense**: Servidor de firewall e roteamento.
- **DMZ**: Servidor Web acessível externamente.
- **VLANs**: Segmentação para controle de tráfego e segurança.

## 🔧 Tecnologias Utilizadas
- pfSense 2.7.X (em VM VirtualBox ou Proxmox)
- Ubuntu Server / Windows para clientes e servidor de testes
- Ferramentas de teste: `ping`, `traceroute`, `nmap`, `iperf`, `tcpdump`

## ✅ Funcionalidades Esperadas
- Regras de firewall separando sub-redes.
- NAT para acesso à internet.
- VPN com autenticação segura.
- VLANs configuradas para isolar setores.
- Testes automatizados validados por scripts e logs.

## ▶️ Como Usar o Projeto
1. Importe a VM com pfSense e configure as interfaces conforme a topologia.
2. Crie as VLANs no switch virtual.
3. Configure as regras no pfSense (veja `configuracoes/`).
4. Realize os testes práticos com os scripts em `testes/scripts/`.
5. Documente os resultados e valide a conectividade entre segmentos.

## 🔐 Aprendizado
Este projeto é excelente para entender conceitos práticos de:
- Firewall stateful
- Segmentação de rede com VLANs
- VPN site-to-site e roadwarrior
- Testes de penetração básicos (nmap)

---
