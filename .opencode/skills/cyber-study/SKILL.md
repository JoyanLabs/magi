# Cyber Study - SKILL.md

## Role
Sub-agente especializado en estudio, investigación y consulta de conocimiento eJPT.

## Goal
Asistir en la preparación teórica del examen eJPT, investigar servicios desconocidos, y generar material de estudio usando NotebookLM.

## When to Use
- `/cyber:study <topic>` - Estudiar tema específico
- `/cyber:research <query>` - Investigación profunda (nuevo notebook)
- `/cyber:cheatsheet <tool>` - Generar cheatsheet
- `/cyber:quiz [topic]` - Preguntas de práctica

## Process

### 1. Consult eJPT Notebook (Main)

The main eJPT notebook (id: d56bf1d2-e763-4e8d-8afd-6ee016852773) contains:
- 33 sources about eJPT preparation
- Cheatsheets
- Pivoting guides
- Metasploit techniques
- SQLMap guides
- etc.

**Query for study:**
```
notebooklm_notebook_query(
  notebook_id="d56bf1d2-e763-4e8d-8afd-6ee016852773",
  query="{topic}"
)
```

### 2. Study by Topic

When user asks `/cyber:study <topic>`:

**Parse topic** and query the eJPT notebook:

Topics covered:
- `nmap` - Scanning techniques
- `smb` - SMB enumeration and exploitation
- `pivoting` - Network pivoting techniques
- `sqlmap` - SQL injection automation
- `metasploit` - Framework usage
- `privilege escalation linux` - Linux privesc
- `privilege escalation windows` - Windows privesc
- `web exploitation` - XSS, SQLi, LFI, etc.
- `active directory` - AD attacks
- `post exploitation` - Post-exploitation techniques

**Create study note in Obsidian:**
```markdown
# Estudio: {topic}

## Resumen
{summary from NotebookLM}

## Conceptos Clave
- {key concept 1}
- {key concept 2}

## Comandos Importantes
```bash
{commands}
```

## Para el Examen
{exam-specific tips}

## Referencias
{sources from notebook}
```

**Save to memory:**
```json
{
  "type": "study_session",
  "title": "{topic}",
  "content": "Key concepts: {list}, Difficulty: {easy/medium/hard}"
}
```

### 3. Deep Research (New Notebook)

When encountering unknown service/technique:

```
notebooklm_research_start(
  query="{detailed query}",
  mode="deep",
  title="Research-{topic}-{timestamp}"
)
```

**Poll for completion:**
```
notebooklm_research_status(
  notebook_id={new_notebook_id},
  max_wait=300
)
```

**Import relevant sources:**
```
notebooklm_research_import(
  notebook_id={new_notebook_id},
  task_id={task_id},
  source_indices=[0, 1, 2, ...]
)
```

**Query new notebook:**
```
notebooklm_notebook_query(
  notebook_id={new_notebook_id},
  query="technical details exploitation"
)
```

**Document findings in Obsidian:**
```markdown
# Investigación: {topic}

**Fecha**: {date}
**Notebook**: {notebook_id}

## Contexto
{why researched this}

## Hallazgos
{key findings}

## Técnicas de Explotación
{exploitation methods}

## Herramientas Recomendadas
{tools}

## Aplicación a eJPT
{how this applies to exam}

## Fuentes Consultadas
{sources}
```

### 4. Generate Cheatsheet

When user asks `/cyber:cheatsheet <tool>`:

**Create cheatsheet in Obsidian:**
```markdown
# Cheatsheet: {tool}

## Descripción Breve
{what it does}

## Instalación
```bash
{installation}
```

## Comandos Básicos
```bash
{common commands}
```

## Comandos Avanzados
```bash
{advanced usage}
```

## Opciones Útiles
| Opción | Descripción |
|--------|-------------|
| {flag} | {description} |

## Ejemplos Prácticos

### Ejemplo 1: {use case}
```bash
{command}
```

### Ejemplo 2: {use case}
```bash
{command}
```

## Para eJPT
{exam-specific usage}

## Referencias
{links}
```

**Save to memory:**
```json
{
  "type": "cheatsheet",
  "title": "{tool}",
  "content": "Common commands: {list}, Use cases: {list}"
}
```

### 5. Generate Quiz Questions

When user asks `/cyber:quiz [topic]`:

Use NotebookLM to generate questions:
```
notebooklm_notebook_query(
  notebook_id="d56bf1d2-e763-4e8d-8afd-6ee016852773",
  query="Generate 5 practice questions about {topic} for eJPT exam"
)
```

Present questions interactively and track score.

## Expected Output

### Study Session
```json
{
  "status": "ok",
  "executive_summary": "Study session on SMB enumeration completed, 5 key concepts covered",
  "artifacts_created": [
    {"type": "obsidian_note", "path": "eJPTv2_Prep/02_Cheatsheets/SMB-Study.md"}
  ],
  "memory_saved": [
    {"type": "study_session", "topic": "SMB", "difficulty": "medium", "time_spent": "15min"}
  ],
  "next_recommended": "/cyber:study smb-exploitation"
}
```

### Research Session
```json
{
  "status": "ok",
  "executive_summary": "Deep research on RPC enumeration completed, new notebook created",
  "artifacts_created": [
    {"type": "notebooklm_notebook", "id": "...", "title": "Research-RPC-20260226"},
    {"type": "obsidian_note", "path": "eJPTv2_Prep/00_Base_Conocimiento/RPC-Research.md"}
  ],
  "memory_saved": [
    {"type": "research_topic", "topic": "RPC enumeration", "sources": 12, "key_findings": ["..."]}
  ],
  "next_recommended": "/cyber:enum rpc"
}
```

## Quick Reference Topics

### eJPT Domains
1. **Assessment Methodologies** (25%, 90% min)
   - Host discovery
   - Port scanning
   - OS fingerprinting
   - Service detection

2. **Host & Network Auditing** (25%, 80% min)
   - SMB, SNMP, RPC enumeration
   - User enumeration
   - Share enumeration

3. **Host & Network Penetration** (35%, 70% min)
   - Metasploit usage
   - Exploitation techniques
   - Brute force attacks
   - Pivoting

4. **Web Application Penetration** (15%, 60% min)
   - Directory busting
   - SQL injection
   - XSS
   - Login bypass

### Common Research Queries
- "{service} enumeration techniques eJPT"
- "{CVE} exploitation metasploit"
- "{technique} privilege escalation"
- "{tool} common options examples"

## Tips

1. **Use eJPT notebook first**: Ya tiene 33 fuentes relevantes
2. **Create research notebooks**: Para temas desconocidos
3. **Link to practice**: Conectar teoría con máquinas resueltas
4. **Build personal cheatsheets**: Basados en tu experiencia
5. **Review before exam**: Usar memoria para identificar debilidades
