---
name: planificacion-sprints
description: >
  Planifica los sprints del proyecto basándose en el alcance y módulos definidos.
  Trigger: Cuando se necesita crear el roadmap de sprints.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Planificando sprints del proyecto"
allowed-tools: Read, Edit, Write
---

## Propósito

Crear el plan de sprints que define:
- Duración de cada sprint
- Objetivos por sprint
- Entregables
- Dependencias

## Cuándo Usar Este Skill

- Después de tener los módulos diseñados
- Antes de crear épicas e historias de usuario

## Pasos

### 1. Obtener Información
Consulta al Documentador sobre:
- Plan de Implementación original (si existe)
- Duración total del proyecto
- Recursos disponibles
- Prioridades del cliente

### 2. Definir Sprints

```markdown
## Plan de Sprints

### Sprint 0: {Título}
**Duración:** {semanas}
**Fechas:** {inicio} - {fin}
**Objetivo:** {descripción del objetivo}

**Entregables:**
- {entregable 1}
- {entregable 2}

**Criterios de Éxito:**
- [ ] {criterio 1}
- [ ] {criterio 2}

**Equipo:** {recursos asignados}

---

### Sprint 1: {Título}
{...}
```

### Tabla Resumen

| Sprint | Fechas | Duración | Módulos | Entregables |
|--------|---------|----------|---------|-------------|
| 0 | {fechas} | {n} sem | {mod} | {ent} |
| 1 | {fechas} | {n} sem | {mod} | {ent} |

## Ejemplo: San Ignacio

```markdown
# Plan de Sprints - Sistema Clínico San Ignacio

## Resumen

| Sprint | Fechas | Duración | Módulos | Entregables |
|--------|---------|----------|---------|-------------|
| 0 | 12-18 Feb | 2 sem | Setup | Repos, CI/CD, Prototipo |
| 1 | 19-25 Feb | 2 sem | Config | Usuarios, Login, Roles |
| 2 | 26 Feb - 11 Mar | 2 sem | Pacientes | Registro, Odontograma |
| 3 | 12-25 Mar | 2 sem | Recepción | Agenda, Citas, Caja |
| 4 | 26 Mar - 8 Abr | 2 sem | CRM | Bandejas, Triggers |
| 5 | 9-22 Abr | 2 sem | Dashboard | Métricas, Reportes |

---

### Sprint 0: Setup y Validación
**Duración:** 2 semanas
**Fechas:** 12 - 18 Febrero 2026
**Objetivo:** Establecer la base técnica y validar flujos con el cliente

**Entregables:**
- Repositorio frontend configurado (Nuxt 4)
- Repositorio backend configurado (NestJS)
- Base de datos PostgreSQL
- Pipeline CI/CD
- Prototipo de UI/UX
- Diseño de alta fidelidad del Odontograma

**Criterios de Éxito:**
- [ ] Repositorios con CI/CD funcionando
- [ ] Entorno de desarrollo configurado
- [ ] Prototipo aprobado por el cliente
- [ ] Diseño de Odontograma validado

**Equipo:** Tech Lead, Backend Dev, Frontend Dev

---

### Sprint 1: Configuración y Administración
**Duración:** 2 semanas
**Fechas:** 19 - 25 Febrero 2026
**Objetivo:** Implementar sistema de usuarios y configuración base

**Entregables:**
- Sistema de autenticación (login/logout)
- Gestión de usuarios (CRUD)
- Catálogo de tratamientos
- Configuración de horarios

**Criterios de Éxito:**
- [ ] Usuarios pueden iniciar sesión
- [ ] Admin puede crear/editar usuarios
- [ ] Catálogo de tratamientos configurable
- [ ] Horarios configurables por doctor

---

### Sprint 2: Núcleo de Pacientes
**Duración:** 2 semanas
**Fechas:** 26 Febrero - 11 Marzo 2026
**Objetivo:** Desarrollar el módulo de pacientes y odontograma

**Entregables:**
- Registro completo de pacientes
- Ficha de paciente
- Odontograma digital por superficies
- Historia clínica básica

**Criterios de Éxito:**
- [ ] Registro de pacientes con validaciones
- [ ] Odontograma permite seleccionar caras
- [ ] Historia clínica guardable
- [ ] Datos persistentes en BD

---

## Dependencias

| Sprint | Depende de |
|--------|------------|
| 0 | Ninguno |
| 1 | Sprint 0 |
| 2 | Sprint 1 |
| 3 | Sprint 2 |
| 4 | Sprint 3 |
| 5 | Sprint 4 |

## Notas

- Sprint 0 es crítico para validar diseño del Odontograma
- Los sprints 2 y 3 son los más intensos en desarrollo
- Buffer de 1 semana incluido para contingencias
```

## Siguiente Paso

Después de crear el plan de sprints, usar:
- `creacion-epicas` para crear épicas por sprint/módulo
