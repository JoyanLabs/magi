# Product Backlog - San Ignacio

**Proyecto:** San Ignacio - Sistema de Gestión de Clínica Dental  
**Última actualización:** 19 Febrero 2026  
**Sprint actual:** 1

---

## Visión del Producto

Sistema integral de gestión para clínica dental que permita administrar pacientes, citas, tratamientos y pagos con control de acceso basado en roles.

---

## Épicas

### Épica 1: Autenticación y Control de Acceso
Gestión de usuarios, roles y permisos del sistema.

### Épica 2: Gestión de Pacientes
Administración de datos de pacientes y su historial clínico.

### Épica 3: Catálogo de Tratamientos
Gestión del catálogo de servicios y precios.

### Épica 4: Agenda y Citas
Sistema de programación y gestión de citas.

### Épica 5: Pagos y Facturación
Gestión de pagos, presupuestos y facturación.

---

## Historias de Usuario

### Sprint 1 (19-25 Feb 2026) - 19 SP

| ID | Épica | Título | Prioridad | Estimación | Sprint |
|----|-------|--------|-----------|------------|--------|
| HU-001 | 1 | Definición de Roles del Sistema | Alta | 3 SP | 1 |
| HU-002 | 1 | Implementación de Permisos por Rol | Alta | 5 SP | 1 |
| HU-003 | 1 | Corrección Cache Contraseña | Media | 2 SP | 1 |
| HU-004 | 3 | CRUD Catálogo de Tratamientos | Alta | 5 SP | 1 |
| HU-005 | 3 | Activar/Desactivar Tratamientos | Media | 2 SP | 1 |
| HU-006 | 3 | Visualización de Catálogo | Media | 2 SP | 1 |

---

### Historias Futuras (Backlog)

#### Prioridad Alta (Próximo Sprint)

| ID | Épica | Título | Estimación |
|----|-------|--------|------------|
| HU-007 | 2 | CRUD Pacientes | 5 SP |
| HU-008 | 2 | Historia Clínica del Paciente | 8 SP |
| HU-009 | 4 | Programación de Citas | 5 SP |

#### Prioridad Media

| ID | Épica | Título | Estimación |
|----|-------|--------|------------|
| HU-010 | 4 | Calendario de Agenda | 3 SP |
| HU-011 | 5 | Registro de Pagos | 3 SP |
| HU-012 | 5 | Generación de Presupuestos | 5 SP |

#### Prioridad Baja

| ID | Épica | Título | Estimación |
|----|-------|--------|------------|
| HU-013 | 5 | Facturación | 5 SP |
| HU-014 | 2 | Notificaciones Recordatorio | 3 SP |
| HU-015 | 1 | Recuperación de Contraseña | 2 SP |

---

## Matriz de Prioridad ICE

| Historia | Impact | Confidence | Ease | Score | Prioridad |
|----------|--------|------------|------|-------|-----------|
| HU-001 | 9 | 9 | 7 | 567 | Alta |
| HU-002 | 9 | 8 | 5 | 360 | Alta |
| HU-003 | 6 | 8 | 8 | 384 | Media |
| HU-004 | 8 | 9 | 6 | 432 | Alta |
| HU-005 | 6 | 8 | 8 | 384 | Media |
| HU-006 | 6 | 8 | 8 | 384 | Media |

---

## Dependencies

- HU-002 depende de HU-001
- HU-004 y HU-005 tienen dependencia (CRUD primero)
- HU-007 (Pacientes) requiere HU-001 y HU-002
- HU-008 (Historia Clínica) requiere HU-007
- HU-009 (Citas) requiere HU-004 y HU-006
- HU-010 (Calendario) requiere HU-009

---

## Notas del Backlog

1. Sprint 1 aprobado formalmente por el usuario
2. Las HU de autenticación (HU-001, HU-002) son bloqueantes para el resto del proyecto
3. El catálogo de tratamientos es fundamental para la agenda
4. Se reserva capacidad para deuda técnica en sprints posteriores
