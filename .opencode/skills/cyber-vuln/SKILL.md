# Cyber Vuln - SKILL.md

## Role
Sub-agente especializado en análisis de vulnerabilidades.

## Goal
Identificar vulnerabilidades en servicios enumerados, buscar exploits conocidos, y determinar vectores de ataque viables.

## When to Use
User runs: `/cyber:vuln <service>` or `/cyber:vuln <CVE>`

## Process

### 1. Check Memory FIRST (Critical)
```
mem_search: "vulnerability {service} version {version}"
mem_search: "exploit {service}"
```
¿Ya hemos visto este servicio/version antes? ¿Qué funcionó?

### 2. Identify Known Vulnerabilities

#### Searchsploit
```bash
# Search by service name
searchsploit {service} {version}
searchsploit samba 4.7.6

# Copy exploit to current dir
searchsploit -m {exploit_id}

# Mirror (view without copying)
searchsploit -x {exploit_id}
```

#### CVE Databases
```bash
# Using cve-search (if available)
cve-search -p {service}:{version}
```

#### Metasploit
```bash
msfconsole -q -x "search {service} {version}; exit"
```

### 3. Manual Analysis
Check for common misconfigurations:
- Default credentials
- Information disclosure
- Unpatched versions
- Misconfigured permissions

### 4. Cross-Reference with Previous Machines
```
mem_search: "similar vulnerabilities"
```
"El SMB v4.7.6 también estaba en la máquina X, usamos Y exploit"

### 5. If Unknown → Research with NotebookLM

```
notebooklm_research_start(
  query="{service} {version} vulnerabilities exploits",
  mode="deep",
  title="Research-{service}-{version}"
)
```

Wait for completion, then import relevant sources.

### 6. Assess Exploitability

For each vulnerability found, assess:
- **Complexity**: Low/Medium/High
- **Privileges required**: None/User/Admin
- **Interaction required**: None/User
- **Scope**: Unchanged/Changed
- **Impact**: Confidentiality/Integrity/Availability
- **Reliability**: Works consistently?

### 7. Document in Obsidian
Create/update: `02_Laboratorio/Active/{machine}/vuln.md`

Template:
```markdown
## Análisis de Vulnerabilidades

### Servicio: {Service} {Version}

#### CVEs Encontrados
| CVE | Descripción | CVSS | Exploit Available |
|-----|-------------|------|-------------------|
| CVE-XXXX-XXXX | {description} | {score} | ✅/❌ |

#### Vulnerabilidades por Searchsploit
```
{searchsploit output}
```

#### Módulos Metasploit
```
{msf search output}
```

#### Análisis de Explotabilidad

**Vulnerabilidad Principal**: {CVE/name}
- **Vector**: {network/local/adjacent}
- **Complejidad**: {low/medium/high}
- **Privilegios Requeridos**: {none/user/admin}
- **Impacto**: {confidentiality/integrity/availability}
- **Estado**: {confirmed/potential}

#### Pasos de Explotación Sugeridos
1. {step 1}
2. {step 2}
3. {step 3}

#### Referencias
- {link to exploit-db}
- {link to CVE details}
- {link to blog post}

#### Historial de Uso
- **Máquina X**: {used Y exploit, succeeded/failed}
```

### 8. Save to Memory

```json
{
  "type": "vulnerability_analysis",
  "title": "{service} {version} vulnerabilities",
  "content": "CVEs: {list}, Exploits: {list}, Best vector: {exploit}"
}
```

Also save individual vulnerabilities:

```json
{
  "type": "vulnerability",
  "title": "CVE-XXXX-XXXX",
  "content": "Service: {service}, Version: {version}, Exploit: {path}, Success rate: high/medium/low"
}
```

## Expected Output

```json
{
  "status": "ok",
  "executive_summary": "Found 3 CVEs for SMB 4.7.6, CVE-2017-7494 (RCE) most promising",
  "findings": {
    "cves": ["CVE-2017-7494", "CVE-2018-1050", "CVE-2018-1057"],
    "exploits_available": 2,
    "best_vector": "is_known_pipename RCE via Metasploit",
    "complexity": "low",
    "reliability": "high"
  },
  "artifacts_created": [
    {"type": "obsidian_note", "path": "02_Laboratorio/Active/Blue/vuln.md"}
  ],
  "memory_saved": [
    {"type": "vulnerability", "cve": "CVE-2017-7494", "service": "smb", "exploit": "is_known_pipename"},
    {"type": "service_vulns", "service": "smb 4.7.6", "vulnerabilities": ["CVE-2017-7494"]}
  ],
  "next_recommended": "/cyber:exploit CVE-2017-7494"
}
```

## Common CVE Patterns

### SMB
- CVE-2017-0144 (EternalBlue) - Windows SMBv1
- CVE-2017-7494 (SambaCry) - Samba RCE
- MS08-067 (NetAPI) - Windows XP/2003
- MS17-010 (EternalBlue family)

### HTTP
- CVE-2014-6271 (Shellshock) - Bash CGI
- CVE-2017-5638 (Struts) - Apache Struts RCE
- CVE-2019-0232 (Tomcat) - CGI Servlet RCE
- CVE-2021-41773 (Apache Path Traversal)

### SSH
- CVE-2018-15473 (Username enumeration) - OpenSSH
- Weak algorithms (deprecated)

### Databases
- MySQL: CVE-2012-2122 (Auth bypass)
- PostgreSQL: Various RCE via COPY FROM PROGRAM
- MongoDB: Unauthenticated access
- Redis: Unauthenticated access

### FTP
- vsftpd 2.3.4: Backdoor
- ProFTPD: Multiple RCEs
- Pure-FTPd: Various

## Tips

1. **Check versions carefully**: Un número de versión importa mucho
2. **Read exploit code**: Antes de ejecutar, entender qué hace
3. **Start with reliable**: Si hay múltiples exploits, elegir el más estable
4. **Document failures**: Si un exploit falla, guardar por qué
5. **Chain vulns**: A veces se necesitan múltiples vulns para RCE
