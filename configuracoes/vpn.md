# Configuração de VPN no pfSense

## Objetivo
Estabelecer uma conexão segura entre dispositivos remotos e a rede interna utilizando **OpenVPN**, garantindo criptografia e autenticação fortes para acesso remoto.

## Tipo de VPN Utilizada
- **Protocolo:** OpenVPN
- **Modo:** Remote Access (SSL/TLS + User Auth)
- **Porta:** UDP 1194
- **Criptografia:** AES-256-CBC
- **Autenticação:** TLS com certificados (CA + Server Cert) + autenticação por usuário

## Etapas de Configuração

### 1. Certificados
- Criar uma **Autoridade Certificadora (CA)**
- Criar um **certificado do servidor VPN**
- Criar certificados para os **usuários remotos**

### 2. Servidor OpenVPN
- Interface: WAN
- Protocolo: UDP
- Porta: 1194
- Rede da VPN: 10.8.0.0/24
- Redirecionar todo o tráfego do cliente (push "redirect-gateway def1")
- DNS: fornecer DNS interno (ex: 192.168.1.1)

### 3. Usuários e Autenticação
- Criar usuários no pfSense
- Associar certificados individuais a cada usuário

### 4. Regras de Firewall
- WAN: permitir entrada UDP 1194
- OpenVPN: permitir tráfego da rede VPN para LAN/VLANs

### 5. Exportação e Conexão
- Instalar pacote `openvpn-client-export`
- Exportar arquivos `.ovpn` com certificado do usuário
- Conectar via cliente OpenVPN (Windows, Linux ou Mobile)

## Capturas
Veja `imagens/openvpn_conexao.png` para uma ilustração da conexão remota ativa.

## Observações
- Reforce o uso de autenticação multifator (2FA) se possível
- Registre e monitore as conexões por logs no pfSense
- Limite o acesso da VPN apenas ao necessário via regras no grupo OpenVPN
