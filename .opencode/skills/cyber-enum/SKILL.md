# Cyber Enum - SKILL.md

## Role
Sub-agente especializado en enumeración de servicios.

## Goal
Extraer información detallada de servicios específicos: versiones, configuraciones, usuarios, shares, y potenciales vectores de ataque.

## When to Use
User runs: `/cyber:enum <service>` or `/cyber:enum <service> <target>`

Services supported:
- smb (SMB/CIFS)
- http/https (Web)
- ssh (SSH)
- ftp (FTP)
- smtp (Mail)
- snmp (SNMP)
- rpc (RPC/MSRPC)
- ldap (LDAP/Active Directory)
- mysql/postgres/mssql (Databases)
- dns (DNS)

## Process

### 1. Check Memory
```
mem_search: "enum {service} {target}"
```
- ¿Ya enumeramos este servicio antes?
- ¿Qué técnicas funcionaron?

### 2. Service-Specific Enumeration

#### SMB (Port 445/139)
```bash
# Basic enumeration
smbclient -L //{IP} -N
smbmap -H {IP}
enum4linux -a {IP}

# Detailed
nmap --script smb-enum-shares,smb-enum-users -p 445 {IP}
crackmapexec smb {IP} --shares
rpcclient -U "" -N {IP} -c "enumdomusers"
```

Documentar:
- Shares disponibles
- Null session allowed?
- Usuarios enumerados
- Versión SMB/OS

#### HTTP/HTTPS (Port 80/443/8080)
```bash
# Technologies
whatweb http://{IP}
wappalyzer scan

# Directory discovery
gobuster dir -u http://{IP} -w /usr/share/wordlists/dirb/common.txt -o dirs
gobuster dir -u http://{IP} -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 50

# Virtual hosts
gobuster vhost -u http://{IP} -w /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-5000.txt

# Nikto scan
nikto -h http://{IP} -o nikto_scan

# Sitemap
curl -s http://{IP}/robots.txt
curl -s http://{IP}/sitemap.xml
```

Documentar:
- Tecnologías detectadas
- Directorios interesantes
- Archivos expuestos
- Headers de seguridad
- CMS identificado

#### SSH (Port 22)
```bash
# Version and algorithms
nmap --script ssh2-enum-algos -p 22 {IP}
ssh-audit {IP}

# Check for weak keys/configs
nmap --script ssh-hostkey -p 22 {IP}
```

Documentar:
- Versión SSH
- Algoritmos soportados
- Weak ciphers?
- Host keys

#### FTP (Port 21)
```bash
# Anonymous login
ftp -n {IP} <<EOF
user anonymous anonymous
ls
EOF

# Detailed
nmap --script ftp-anon,ftp-bounce,ftp-libopie,ftp-proftpd-backdoor,ftp-vsftpd-backdoor,ftp-vuln-cve2010-4221 -p 21 {IP}
```

Documentar:
- Anonymous login allowed?
- Files/directories accesibles
- Versión FTP

#### SNMP (Port 161)
```bash
# Community strings
onesixtyone -c /usr/share/wordlists/seclists/Discovery/SNMP/snmp.txt {IP}

# Detailed enumeration
snmpwalk -v 2c -c public {IP}
snmp-check {IP}
```

Documentar:
- Community strings válidos
- Información del sistema
- Usuarios/procesos
- Network interfaces

### 3. Cross-Reference with Vuln Database
```
mem_search: "service {service} version {version}"
```
¿Hemos visto esta versión específica antes? ¿Qué exploits funcionaron?

### 4. Document in Obsidian
Create/update: `02_Laboratorio/Active/{machine}/enum.md`

Template per service:
```markdown
## Enumeración {Service} - Puerto {Port}

### Comandos Ejecutados
```bash
{commands used}
```

### Resultados
- **Versión**: {version}
- **Banner**: {banner}

### Información Extraída
{detailed findings}

### Vectores Potenciales
- [ ] {potential attack vector 1}
- [ ] {potential attack vector 2}

### Credenciales Encontradas
| Usuario | Password | Fuente |
|---------|----------|--------|
| {user} | {pass} | {source} |
```

### 5. Save to Memory
```json
{
  "type": "service_enum",
  "title": "{service} on {target}",
  "content": "Version: {version}, Findings: {summary}, Interesting: {files/users/shares}"
}
```

## Expected Output

```json
{
  "status": "ok",
  "executive_summary": "SMB enumeration found 3 shares, null session allowed, 15 users enumerated",
  "findings": {
    "service": "smb",
    "version": "Samba 4.7.6",
    "shares": ["IPC$", "share", "admin"],
    "users": ["administrator", "guest", ...],
    "vulnerabilities": ["null session allowed"],
    "credentials": []
  },
  "artifacts_created": [
    {"type": "obsidian_note", "path": "02_Laboratorio/Active/Blue/enum.md"}
  ],
  "memory_saved": [
    {"type": "service", "service": "smb", "version": "4.7.6", "shares": ["share", "admin"]}
  ],
  "next_recommended": "/cyber:vuln smb"
}
```

## Common Wordlists

| Purpose | Path |
|---------|------|
| Small dirs | `/usr/share/wordlists/dirb/common.txt` |
| Medium dirs | `/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt` |
| Big dirs | `/usr/share/wordlists/dirbuster/directory-list-2.3-big.txt` |
| Subdomains | `/usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-5000.txt` |
| SNMP | `/usr/share/wordlists/seclists/Discovery/SNMP/snmp.txt` |

## Tips

1. **Start broad**: Enumerar todo lo visible primero
2. **Version matters**: La versión exacta es crucial para exploits
3. **Default creds**: Siempre probar default credentials
4. **Null sessions**: En SMB, probar acceso sin credenciales primero
5. **robots.txt**: Muchos admin olvidan que revelan paths
