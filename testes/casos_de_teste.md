# Casos de Teste – pfSense Firewall Lab

## Objetivo
Validar o funcionamento correto das configurações implementadas no pfSense, incluindo firewall, NAT, VPN e segmentação via VLANs.

---

## 🔒 Testes de Regras de Firewall

### 1. Bloqueio entre VLANs
- **Descrição:** Um host na VLAN 20 (RH) tenta acessar um host na VLAN 10 (TI).
- **Esperado:** Tráfego bloqueado.
- **Comando:** `ping 192.168.10.10` a partir de 192.168.20.10.

### 2. Acesso à Internet a partir das VLANs
- **Descrição:** Verificar se hosts nas VLANs 10, 20 e 30 têm acesso à internet.
- **Esperado:** Tráfego permitido para a internet.
- **Comando:** `ping 8.8.8.8` ou `curl http://example.com`.

### 3. Acesso restrito à DMZ
- **Descrição:** Hosts internos acessam um servidor web na DMZ.
- **Esperado:** Tráfego permitido apenas nas portas 80/443.
- **Comando:** `curl http://192.168.100.10`.

---

## 🌐 Testes de NAT

### 4. Tradução de endereços para saída externa
- **Descrição:** Garantir que IPs internos sejam traduzidos corretamente ao acessar a internet.
- **Esperado:** NAT funcionando, IP externo visível via `curl ifconfig.me`.

### 5. Port forwarding para DMZ
- **Descrição:** Testar se conexões externas alcançam o servidor da DMZ (porta 80).
- **Esperado:** Serviço acessível pela WAN.
- **Comando:** `curl http://<IP_WAN>:80`.

---

## 🛡️ Testes de VPN

### 6. Conexão VPN Remota (OpenVPN)
- **Descrição:** Estação remota se conecta via OpenVPN.
- **Esperado:** Conexão estabelecida com IP interno atribuído.
- **Comando:** `openvpn --config cliente.ovpn`.

### 7. Acesso interno via VPN
- **Descrição:** Após conexão VPN, usuário acessa recursos internos.
- **Esperado:** Acesso permitido conforme regras de firewall.
- **Comando:** `ping 192.168.10.10`.

---

## 🧪 Testes Extras

### 8. Scan de portas via Nmap
- **Descrição:** Escanear portas abertas em hosts da DMZ e VLANs.
- **Esperado:** Apenas portas autorizadas devem estar abertas.
- **Comando:** `nmap -Pn 192.168.100.10`.

### 9. Verificação de logs no pfSense
- **Descrição:** Conferir se os eventos dos testes aparecem nos logs.
- **Esperado:** Logs de conexões e bloqueios devidamente registrados.

---

## Observações
- Os testes devem ser realizados após a configuração completa da topologia e serviços.
- Resultados devem ser documentados no arquivo `resultados.md`.
- Scripts automatizados estão na pasta `testes/scripts/`.
