---
name: creacion-epicas
description: >
  Crea las épicas del proyecto basadas en los módulos y sprints definidos.
  Trigger: Cuando se necesitan crear épicas para el backlog.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Creando épicas del proyecto"
allowed-tools: Read, Edit, Write
---

## Propósito

Crear épicas que agrupen las historias de usuario por:
- Módulo del sistema
- Sprint de implementación

## Cuándo Usar Este Skill

- Después de tener los módulos diseñados
- Después de tener el plan de sprints

## Estructura de una Épica

```markdown
---
id: EPICA-{N}
title: "{título de la épica}"
módulo: {nombre-módulo}
sprint: {n}
prioridad: high|medium|low
---

# Épica {N}: {Título}

## Descripción

{Descripción de 2-3 oraciones sobre esta épica}

## Criterios de Inversión

- [ ] {criterio 1 que debe cumplirse}
- [ ] {criterio 2 que debe cumplirse}

## Historias de Usuario

| HU | Título | Prioridad |
|----|--------|-----------|
| HU-{n} | {título} | Alta |
| HU-{n} | {título} | Alta |
| HU-{n} | {título} | Media |

## Notas

{Notas relevantes}

## Definición de Done

- [ ] Código en repositorio
- [ ] Tests implementados
- [ ] Code review aprobado
- [ ] Desplegado a entorno de pruebas
- [ ] Aprobado por Product Owner
```

## Ejemplo: Épica de Pacientes

```markdown
---
id: EPICA-001
title: "Gestión de Pacientes"
módulo: Pacientes
sprint: 2
prioridad: high
---

# Épica 001: Gestión de Pacientes

## Descripción

Esta épica covers todo lo relacionado con el registro y gestión de pacientes del sistema clínico. Incluye la creación de fichas de pacientes, búsqueda, y gestión de datos filiatorios.

## Criterios de Inversión

- [ ] Recepcionista puede registrar nuevos pacientes
- [ ] Sistema valida DNI único
- [ ] Datos de contacto son requeridos
- [ ] Búsqueda funciona por nombre o DNI

## Historias de Usuario

| HU | Título | Prioridad |
|----|--------|-----------|
| HU-001 | Registro de pacientes | Alta |
| HU-002 | Búsqueda de pacientes | Alta |
| HU-003 | Actualizar datos de paciente | Media |
| HU-004 | Eliminar paciente (soft delete) | Baja |

## Notas

- El soft delete permite recuperar pacientes eliminados
- Cada paciente puede tener múltiples истории clínicas

## Definición de Done

- [ ] Código en repositorio
- [ ] Tests implementados (unit + e2e)
- [ ] Code review aprobado
- [ ] Desplegado a entorno de pruebas
- [ ] Validación de accesibilidad aprobada
```

## Ejemplo: Épica de Odontograma

```markdown
---
id: EPICA-002
title: "Odontograma Digital"
módulo: Pacientes
sprint: 2
prioridad: high
---

# Épica 002: Odontograma Digital

## Descripción

Módulo crítico que permite a los doctores registrar el estado dental de cada paciente usando un odontograma interactivo por superficies, siguiendo la normativa del Colegio de Odontólogos del Perú.

## Criterios de Inversión

- [ ] Doctor puede seleccionar pieza dental
- [ ] Doctor puede seleccionar cara específica (5 opciones)
- [ ] Sistema aplica marcadores (caries, restauración, etc.)
- [ ] Colores siguen norma: rojo=diagnóstico, azul=tratamiento
- [ ] Odontograma se actualiza automáticamente con evoluciones

## Historias de Usuario

| HU | Título | Prioridad |
|----|--------|-----------|
| HU-005 | Selección de pieza dental | Alta |
| HU-006 | Aplicar marcador a superficie | Alta |
| HU-007 | Cambiar tipo de odontograma (adulto/infantil) | Alta |
| HU-008 | Ver historial de cambios | Media |
| HU-009 | Imprimir odontograma | Baja |

## Notas

- Esta épica es crítica para el proyecto
- El diseño debe validarse con el cliente en Sprint 0
- Considerar optimización para tablets

## Definición de Done

- [ ] Código en repositorio
- [ ] Tests de componente
- [ ] Code review aprobado
- [ ] Validación de UX con doctores
- [ ] Cumple con norma técnica del Colegio
```

## Proceso

1. **Identificar módulos** del sistema
2. **Agrupar funcionalidades** por módulo
3. **Crear épica** por grupo de funcionalidades
4. **Definir HU** dentro de cada épica

## Siguiente Paso

Usar `creacion-historias-usuario` para detallar cada historia dentro de las épicas.
