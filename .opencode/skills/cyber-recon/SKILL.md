# Cyber Recon - SKILL.md

## Role
Sub-agente especializado en reconocimiento y host discovery.

## Goal
Identificar objetivos en la red, determinar TTL/OS fingerprint, descubrir hosts vivos, y preparar el terreno para enumeración.

## When to Use
User runs: `/cyber:recon <IP>` or `/cyber:recon <network>`

## Process

### 1. Check Memory First
```
mem_search: "host {IP} OR network {subnet}"
```
- ¿Ya hemos escaneado este target antes?
- ¿Qué información previa existe?

### 2. Host Discovery (if network)
```bash
# Ping sweep
nmap -sn {network}/24 -oN hosts_up

# Or netdiscover for local networks
netdiscover -r {network}/24 -P
```

### 3. Single Target Recon
```bash
# Quick ping for TTL analysis
ping -c 1 {IP}
# TTL ~64 = Linux, ~128 = Windows, ~255 = Cisco/Network device

# Quick port scan (top 1000)
nmap -sV -O --top-ports 1000 {IP} -oN quick_scan

# Full port scan (background)
nmap -p- -T4 {IP} -oN full_scan &
```

### 4. OS Fingerprinting
Analyze TTL and Nmap OS detection:
- TTL 64 → Linux/Unix
- TTL 128 → Windows
- TTL 255 → Network device/Cisco

### 5. Document in Obsidian
Create/update: `02_Laboratorio/Active/{machine}/recon.md`

Template:
```markdown
---
tipo: Reconocimiento
maquina: {machine}
ip: {IP}
fecha: {date}
---

# Reconocimiento - {machine}

## Host Discovery
- **Target**: {IP}
- **Status**: Up/Down
- **TTL**: {TTL} ({OS guess})

## Quick Scan Results
### Puertos Abiertos (Top 1000)
{table of ports}

## OS Detection
- **Fingerprint**: {Nmap OS guess}
- **Confidence**: {percentage}

## Full Scan (Background)
- **Status**: Running/Completed
- **File**: full_scan

## Next Steps
- [ ] Enumerar servicios detallados
- [ ] Identificar versiones exactas
- [ ] Buscar vulnerabilidades conocidas
```

### 6. Update Excalidraw Diagram
If diagram exists, add target box with:
- IP address
- OS icon (Linux penguin / Windows logo)
- Open ports (color-coded)

### 7. Save to Memory
```json
{
  "type": "host_discovery",
  "title": "Host {IP} - {machine}",
  "content": "OS: {OS}, TTL: {TTL}, Open ports: {list}"
}
```

## Expected Output

```json
{
  "status": "ok",
  "executive_summary": "Target {IP} is up, identified as {OS} with {N} ports open",
  "findings": {
    "hosts": [{"ip": "10.10.10.40", "os": "Windows", "ttl": 128}],
    "services": ["http:80", "smb:445"],
    "open_ports": 5
  },
  "artifacts_created": [
    {"type": "obsidian_note", "path": "02_Laboratorio/Active/Blue/recon.md"},
    {"type": "nmap_scan", "files": ["quick_scan", "full_scan"]}
  ],
  "memory_saved": [
    {"type": "host", "ip": "10.10.10.40", "os": "Windows", "ports": [80, 445]}
  ],
  "next_recommended": "/cyber:enum smb"
}
```

## Common Commands

```bash
# Quick host discovery
nmap -sn 10.10.10.0/24

# Single host quick scan
nmap -sV -O 10.10.10.40

# Full port scan
nmap -p- -T4 10.10.10.40

# Aggressive scan
nmap -A -T4 10.10.10.40

# UDP scan (slow)
nmap -sU --top-ports 100 10.10.10.40
```

## TTL Reference

| TTL | Likely OS |
|-----|-----------|
| 64 | Linux, Unix, macOS |
| 128 | Windows |
| 255 | Solaris, AIX, Cisco, Network devices |
| 60 | Some Linux distros |
| 120 | Some Windows variants |

## Tips

1. **Start fast**: Quick scan primero, full scan en background
2. **TTL matters**: Puede identificar OS antes de Nmap
3. **Document early**: Crear estructura Obsidian ASAP
4. **Save everything**: Aunque parezca trivial, guardar en memoria

## When Blocked

If host appears down:
1. Verificar conectividad: `ping {IP}`
2. Check VPN/lab connection
3. Try different scan timing: `-T2` or `-T5`
4. Check firewall evasion: `-Pn` (skip host discovery)
