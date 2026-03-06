# Cyber Doc - SKILL.md

## Role
Sub-agente especializado en documentación en Obsidian y diagramación en Excalidraw.

## Goal
Crear y mantener documentación estructurada de máquinas, vulnerabilidades, y técnicas en Obsidian, así como diagramas de red en Excalidraw.

## When to Use
- `/cyber:doc note <content>` - Guardar nota rápida
- `/cyber:diagram network` - Crear diagrama de red
- `/cyber:flags` - Registrar flags
- `/cyber:writeup` - Generar writeup completo

## Process

### 1. Obsidian Integration

**CLI Tool**: `obsidian-cli` (already installed)

**Vault Path**: `/home/joshrm/Documentos/obsidian/obsidian-tank`

**Structure**:
```
02_Laboratorio/
├── Active/
│   └── {machine}/
│       ├── recon.md
│       ├── enum.md
│       ├── vuln.md
│       ├── exploit.md
│       ├── privesc.md
│       └── writeup.md
├── Completed/
│   └── {machine}/
│       └── (full documentation)
├── Network-Diagrams/
│   └── {machine}-network.excalidraw
└── Vuln-Database/
    ├── CVE-XXXX-XXXX.md
    ├── Service-SMB.md
    ├── Service-HTTP.md
    └── Techniques/
        ├── Pivoting.md
        ├── Privilege-Escalation-Linux.md
        └── Privilege-Escalation-Windows.md
```

**Commands**:
```bash
# Create note
obsidian-cli create "02_Laboratorio/Active/{machine}/recon.md" --content "..."

# Update note
obsidian-cli create "path" --content "..." --append

# Search notes
obsidian-cli search-content "keyword"

# Print note
obsidian-cli print "path"
```

### 2. Create Machine Structure

When starting a new machine:

```bash
# Create directories (via obsidian-cli, they create automatically with files)
obsidian-cli create "02_Laboratorio/Active/{machine}/recon.md" --content "# {machine} - Reconocimiento

## Información General
- **IP**: 
- **OS**: 
- **Dificultad**: 
- **Estado**: 🔄 En progreso

## Resumen Ejecutivo
{brief summary}

## Checklist
- [ ] Reconocimiento
- [ ] Enumeración
- [ ] Explotación
- [ ] Escalada de Privilegios
- [ ] Documentación
"
```

### 3. Create Network Diagram (Excalidraw)

Use MCP Excalidraw to create diagrams:

```
excalidraw MCP:
"Create a network diagram for pentest lab showing:
- Attacker machine (Kali)
- Target network 10.10.10.0/24
- Discovered hosts with their IPs
- Open ports on each host
- Connections between hosts"
```

### 4. Register Flags

When flags are obtained:

```markdown
## Flags - {machine}

### User Flag
- **Location**: {path}
- **Hash**: {hash}
- **Método**: {how obtained}
- **Fecha**: {date}

### Root Flag
- **Location**: {path}
- **Hash**: {hash}
- **Método**: {how obtained}
- **Fecha**: {date}

### Captura de Pantalla
{screenshot or terminal output}
```

Save to memory:
```json
{
  "type": "flag",
  "title": "{machine} - {user/root}",
  "content": "Hash: {hash}, Method: {technique}, Date: {date}"
}
```

### 5. Generate Writeup

Create comprehensive writeup:

```markdown
---
tipo: Writeup
plataforma: {HTB/THM/eJPT}
dificultad: {Easy/Medium/Hard}
ip: {IP}
fecha: {date}
tags: [{tags}]
---

# {machine}

## Información General
- **IP**: {IP}
- **OS**: {OS}
- **Dificultad**: {difficulty}

## Resumen Ejecutivo
{1-2 paragraph overview}

## Reconocimiento

### Host Discovery
{nmap results}

### OS Detection
{OS fingerprint}

## Enumeración

### Servicio: {Service 1}
{enum results}

### Servicio: {Service 2}
{enum results}

## Vulnerabilidades Identificadas

### {Vuln 1}
- **CVE**: {CVE}
- **Descripción**: {description}
- **Vector**: {attack vector}

## Explotación

### Obtención de Foothold
{exploitation steps}

### Comandos Utilizados
```bash
{commands}
```

## Escalada de Privilegios

### Vector de Privesc
{privesc technique}

### Pasos
{steps}

## Flags

- **User**: {hash}
- **Root**: {hash}

## Lecciones Aprendidas
- {lessons}

## Referencias
- {links}

## Herramientas Utilizadas
- {tools}
```

### 6. Update Vulnerability Database

When new vuln encountered:

```markdown
# {CVE/Name}

## Información
- **CVE**: {number}
- **Nombre**: {name}
- **Servicio Afectado**: {service}
- **Versiones**: {affected versions}

## Descripción
{description}

## Indicadores
{how to identify}

## Explotación

### Método 1: Metasploit
```bash
use {exploit}
set RHOSTS {target}
exploit
```

### Método 2: Manual
```bash
{manual exploitation}
```

## Máquinas Afectadas
- {machine 1} - {date}
- {machine 2} - {date}

## Referencias
- {links}
```

Save to memory:
```json
{
  "type": "vulnerability_database",
  "title": "{CVE}",
  "content": "Service: {service}, Version: {version}, Exploits: {methods}, Affected machines: {list}"
}
```

### 7. Move to Completed

When machine is done:

```bash
# Conceptually - obsidian-cli handles paths
# Move from Active/ to Completed/
obsidian-cli create "02_Laboratorio/Completed/{machine}/writeup.md" --content "{full writeup}"
```

## Expected Output

```json
{
  "status": "ok",
  "executive_summary": "Created writeup for machine Blue, registered both flags, moved to Completed",
  "artifacts_created": [
    {"type": "obsidian_note", "path": "02_Laboratorio/Completed/Blue/writeup.md"},
    {"type": "vuln_database_entry", "path": "02_Laboratorio/Vuln-Database/CVE-2017-0144.md"},
    {"type": "excalidraw_diagram", "path": "02_Laboratorio/Network-Diagrams/Blue-network.excalidraw"}
  ],
  "memory_saved": [
    {"type": "flag", "machine": "Blue", "user": "{hash}", "root": "{hash}"},
    {"type": "machine_completed", "title": "Blue", "difficulty": "Easy", "techniques": ["EternalBlue"]}
  ],
  "next_recommended": "/cyber:lab start {next_machine}"
}
```

## Templates Available

### Quick Note
```markdown
## Nota Rápida - {machine} - {timestamp}

{content}

**Contexto**: {phase}
**Siguiente paso**: {next}
```

### Credential Found
```markdown
## Credenciales Encontradas - {machine}

| Servicio | Usuario | Password/Hash | Fuente |
|----------|---------|---------------|--------|
| {service} | {user} | {pass} | {source} |
```

### Technique Learned
```markdown
## Técnica: {name}

**Categoría**: {category}
**OS**: {OS}

### Uso
{how to use}

### Ejemplo
```bash
{example}
```

### Máquinas donde funcionó
- {machine 1}
- {machine 2}
```

## Tips

1. **Document as you go**: No dejar todo para el final
2. **Use templates**: Consistencia saves time
3. **Screenshots**: Capturar evidencia visual
4. **Link related**: Conectar notas relacionadas
5. **Tag everything**: Facilita búsqueda posterior
