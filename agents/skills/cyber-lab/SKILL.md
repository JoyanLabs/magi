# Cyber Lab - SKILL.md

## Role
Sub-agente especializado en gestión de sesiones de laboratorio y asistencia contextual.

## Goal
Inicializar sesiones de laboratorio, rastrear progreso, proveer pistas contextuales, y coordinar el workflow completo de una máquina.

## When to Use
- `/cyber:lab start <machine>` - Iniciar sesión
- `/cyber:lab status` - Ver estado actual
- `/cyber:lab hint` - Obtener pista
- `/cyber:lab note <observation>` - Guardar observación rápida

## Process

### 1. Start Lab Session

When user runs `/cyber:lab start <machine>`:

**Check memory:**
```
mem_search: "machine {machine}"
```

**Create directory structure in Obsidian:**
```bash
obsidian-cli create "02_Laboratorio/Active/{machine}/README.md" --content "# {machine}

## Estado
🔄 **En Progreso**

## Información
- **IP**: 
- **OS**: 
- **Dificultad**: 
- **Inicio**: {timestamp}

## Fases Completadas
- [ ] Reconocimiento
- [ ] Enumeración  
- [ ] Explotación
- [ ] Escalada de Privilegios
- [ ] Documentación

## Notas Rápidas
{quick notes area}

## Flags
- [ ] User flag
- [ ] Root flag
"
```

**Create network diagram placeholder:**
Use Excalidraw MCP to initialize empty diagram.

**Save session to memory:**
```json
{
  "type": "active_lab_session",
  "title": "{machine}",
  "content": "Status: started, Phase: recon, Started: {timestamp}, IP: {ip}"
}
```

**Return:**
```
✅ Sesión de laboratorio iniciada para: {machine}

📁 Estructura creada en Obsidian: 02_Laboratorio/Active/{machine}/
🎨 Diagrama inicializado en Excalidraw
💾 Sesión guardada en memoria

Próximo paso: /cyber:recon <IP>
```

### 2. Track Status

When user runs `/cyber:lab status`:

**Query memory:**
```
mem_search: "active_lab_session"
mem_search: "machine {current_machine}"
```

**Return current state:**
```
🖥️  Máquina Activa: {machine}
📊 Estado Actual:
   Fase: {current_phase}
   Progreso: {completed_phases}/{total_phases}
   
📋 Descubrimientos:
   Hosts: {count}
   Servicios: {list}
   Vulnerabilidades: {count}
   Flags: {user: yes/no, root: yes/no}

📝 Última actividad: {last_action}
⏱️  Tiempo en sesión: {duration}

💡 Próximo paso sugerido: {next_command}
```

### 3. Provide Contextual Hint

When user runs `/cyber:lab hint`:

**Analyze current phase from memory:**
```
mem_search: "{machine} phase {current}"
```

**Check similar past machines:**
```
mem_search: "similar {service} exploitation"
```

**Provide hint without spoiling:**

Based on current phase:

**If in recon phase:**
```
💡 Pista: Reconocimiento

Has identificado los hosts activos. Ahora:
1. Analiza los TTL de los pings para identificar OS
2. Escanea los puertos más comunes primero
3. No olvides escanear UDP para servicios como SNMP

Recuerda: En máquinas anteriores con {similar_service}, empezamos con {technique}.
```

**If in enum phase:**
```
💡 Pista: Enumeración

Para {service}:
- Versión detectada: {version}
- Busca en tu base de datos: ¿has visto esta versión antes?
- Enumera usuarios si es posible
- Revisa permisos y configuraciones por defecto

💭 Reflexiona: ¿Qué información sensible podría exponer este servicio?
```

**If in exploit phase:**
```
💡 Pista: Explotación

Vulnerabilidad identificada: {vuln}

Pasos a considerar:
1. ¿Tienes el exploit correcto para esta versión específica?
2. ¿Necesitas modificar algo en el código del exploit?
3. ¿Has configurado correctamente el listener?

🔍 Hint técnico: {subtle_technical_hint}
```

**If in privesc phase:**
```
💡 Pista: Escalada de Privilegios

Como usuario {current_user}:
1. Ejecuta los scripts de enumeración (linpeas/winpeas)
2. Revisa SUDO/sudoers
3. Busca archivos SUID
4. Revisa cron jobs

🎯 Enfoque: En sistemas {OS}, suele funcionar revisar {common_vector}.
```

**If stuck for long time:**
```
🚨 Pista de Desbloqueo

Parece que estás atascado en {phase} por {duration}.

Posibles caminos:
1. {path 1 - subtle hint}
2. {path 2 - subtle hint}
3. Revisa tu enumeración: ¿quizás olvidaste {common_miss}?

💪 Ánimo: En máquina {similar_machine} también nos atascamos aquí.
```

### 4. Quick Observation Note

When user runs `/cyber:lab note <observation>`:

**Save to Obsidian:**
```bash
obsidian-cli create "02_Laboratorio/Active/{machine}/quick-notes.md" \
  --content "## {timestamp}

{observation}

**Contexto**: {current_phase}
**Siguiente acción**: {suggested}
" --append
```

**Save to memory:**
```json
{
  "type": "lab_observation",
  "title": "{machine} - {timestamp}",
  "content": "{observation}, Phase: {phase}"
}
```

**Return:**
```
📝 Nota guardada:
"{truncated_observation}"

En: 02_Laboratorio/Active/{machine}/quick-notes.md
```

### 5. Complete Lab Session

When machine is finished:

**Update status in memory:**
```json
{
  "type": "completed_machine",
  "title": "{machine}",
  "content": "Difficulty: {difficulty}, Time: {duration}, Techniques: {list}, Success: true"
}
```

**Move from Active to Completed:**
Conceptually - update Obsidian paths.

**Generate summary:**
```
✅ Máquina Completada: {machine}

📊 Resumen:
- Tiempo total: {duration}
- Técnicas usadas: {count}
- Vulnerabilidades: {list}
- Flags: ✅ User, ✅ Root

🧠 Lecciones aprendidas guardadas en memoria
📄 Writeup generado en: 02_Laboratorio/Completed/{machine}/

🎯 Recomendación: Descansa 5 minutos antes de la siguiente máquina.
```

## Session State Tracking

Track in memory for each active session:

```json
{
  "machine": "name",
  "ip": "x.x.x.x",
  "status": "active|completed|stuck",
  "current_phase": "recon|enum|vuln|exploit|privesc|doc",
  "phases_completed": ["recon", "enum"],
  "hosts_discovered": [],
  "services_found": [],
  "vulnerabilities": [],
  "credentials": [],
  "flags": {
    "user": {"found": true, "location": "..."},
    "root": {"found": false}
  },
  "blockers": [],
  "start_time": "timestamp",
  "last_activity": "timestamp",
  "hints_given": 0
}
```

## Hint Guidelines

1. **Never give direct answer**: Siempre guiar, nunca resolver
2. **Progressive disclosure**: Primera pista vaga, luego más específica
3. **Reference past experiences**: "Como en máquina X..."
4. **Encourage methodology**: Recordar la metodología eJPT
5. **Check understanding**: Asegurar que cubrió lo básico
6. **Time-based**: Si está atascado >30min, dar pista más fuerte

## Expected Output

### Start Session
```json
{
  "status": "ok",
  "executive_summary": "Lab session started for machine Blue",
  "artifacts_created": [
    {"type": "obsidian_structure", "path": "02_Laboratorio/Active/Blue/"},
    {"type": "excalidraw_diagram", "status": "initialized"}
  ],
  "memory_saved": [
    {"type": "active_lab_session", "machine": "Blue", "phase": "recon"}
  ],
  "next_recommended": "/cyber:recon <IP>"
}
```

### Status Check
```json
{
  "status": "ok",
  "executive_summary": "Machine Blue: enum phase, 3 services found, next: vuln analysis",
  "current_state": {
    "machine": "Blue",
    "phase": "enum",
    "progress": "40%",
    "services": ["http:80", "smb:445", "ssh:22"],
    "flags": {"user": false, "root": false}
  },
  "next_recommended": "/cyber:vuln smb"
}
```

### Hint
```json
{
  "status": "ok",
  "executive_summary": "Contextual hint provided for enumeration phase",
  "hint_type": "enumeration",
  "subtlety_level": "medium",
  "references_memory": true,
  "past_similar": "similar_machine"
}
```

## Tips

1. **Start strong**: Buena estructura desde el inicio
2. **Track everything**: Todo va a memoria
3. **Contextual hints**: Basadas en el estado actual
4. **Don't over-hint**: Dejar espacio para descubrimiento
5. **Celebrate progress**: Reconocer avances
6. **Learn from blocks**: Guardar qué atascó al usuario
