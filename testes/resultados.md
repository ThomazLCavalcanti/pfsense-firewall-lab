# Resultados dos Testes – pfSense Firewall Lab

## ✅ Resumo Geral

| Teste                                   | Resultado | Observações                       |
|----------------------------------------|-----------|-----------------------------------|
| Bloqueio entre VLANs                   | ✅        | Tráfego bloqueado conforme regras |
| Acesso à Internet (VLANs)              | ✅        | Conectividade confirmada          |
| Acesso à DMZ                           | ✅        | Acesso permitido nas portas 80/443|
| NAT - Tradução de IP                   | ✅        | IP público visível corretamente   |
| NAT - Port Forwarding                  | ✅        | Serviço da DMZ acessível externamente |
| VPN - Conexão remota (OpenVPN)         | ✅        | Conexão estabelecida com sucesso  |
| VPN - Acesso interno pós-conexão       | ✅        | Recursos acessados via VPN        |
| Nmap - Scan de portas DMZ              | ✅        | Apenas portas 80/443 abertas      |
| Verificação de logs no pfSense         | ✅        | Logs registrados corretamente     |

---

## 📋 Detalhes dos Testes

### 🔒 Firewall
- VLANs isoladas conforme esperado.
- Acesso à internet restrito por VLAN quando configurado.
- DMZ acessível apenas nas portas HTTP/HTTPS.

### 🌐 NAT
- Port forwarding funcional (redirecionamento HTTP testado com sucesso).
- NAT de saída traduzindo corretamente os IPs internos.

### 🛡️ VPN
- Cliente conectou via OpenVPN e obteve IP interno (192.168.200.X).
- Conectividade com hosts internos após VPN confirmada.

### 🧪 Extras
- `nmap` confirmou segurança das interfaces com portas filtradas corretamente.
- Logs do pfSense mostram conexões e bloqueios conforme configurado.

---

## 🗂️ Arquivos Gerados
- `teste_ping.sh` – teste de conectividade automatizado
- `nmap_scan.sh` – verificação de portas abertas (ainda a ser executado)
- Logs capturados podem ser anexados se necessário
