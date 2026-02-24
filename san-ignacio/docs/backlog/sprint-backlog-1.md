# Sprint Backlog - Sprint 1

**Proyecto:** San Ignacio  
**Sprint:** 1  
**Fecha:** 19 Febrero - 25 Febrero 2026  
**Total SP:** 19

---

## Sprint Goal

Establecer la base del sistema de autenticación y permisos, junto con la gestión del catálogo de tratamientos.

---

## User Stories en Sprint

| # | ID | Título | SP | Estado | Asignado a |
|---|-----|--------|-----|--------|------------|
| 1 | HU-001 | Definición de Roles del Sistema | 3 | Todo | - |
| 2 | HU-002 | Implementación de Permisos por Rol | 5 | Todo | - |
| 3 | HU-003 | Corrección Cache Contraseña | 2 | Todo | - |
| 4 | HU-004 | CRUD Catálogo de Tratamientos | 5 | Todo | - |
| 5 | HU-005 | Activar/Desactivar Tratamientos | 2 | Todo | - |
| 6 | HU-006 | Visualización de Catálogo | 2 | Todo | - |

---

## Tareas Técnicas por HU

### HU-001: Definición de Roles del Sistema (3 SP)

- [ ] Crear enum/constante de Roles
- [ ] Crear migración de tabla de roles (si aplica)
- [ ] Agregar campo rol a la entidad Usuario
- [ ] Actualizar DTOs de usuario
- [ ] Actualizar generación de JWT para incluir rol

### HU-002: Implementación de Permisos por Rol (5 SP)

- [ ] Crear middleware de verificación de rol
- [ ] Crear constantes de permisos
- [ ] Implementar guard en backend
- [ ] Crear guard en frontend (React)
- [ ] Implementar HOC o hook de permisos
- [ ] Ocultar/mostrar elementos según permisos

### HU-003: Corrección Cache Contraseña (2 SP)

- [ ] Implementar endpoint de logout global
- [ ] Invalidar refresh tokens en BD
- [ ] Frontend: limpiar storage al recibir respuesta exitosa
- [ ] Frontend: redireccionar a /login

### HU-004: CRUD Catálogo de Tratamientos (5 SP)

- [ ] Crear entidad Tratamiento
- [ ] Crear migración de tabla
- [ ] Crear CRUD endpoints
- [ ] Crear DTOs (Create, Update, Response)
- [ ] Crear validaciones
- [ ] Crear interfaz en frontend (solo Admin)

### HU-005: Activar/Desactivar Tratamientos (2 SP)

- [ ] Agregar campo activo a entidad Tratamiento
- [ ] Crear endpoint toggle estado
- [ ] Actualizar queries de agenda para filtrar activos
- [ ] Agregar indicador visual en UI

### HU-006: Visualización de Catálogo (2 SP)

- [ ] Crear endpoint GET tratamientos (solo activos)
- [ ] Crear componente de vista de catálogo
- [ ] Configurar rutas con guard de autenticación
- [ ] Sin permisos de edición

---

## Pendientes (Pre-Sprint)

- Asignar historias a desarrolladores
- Revisar dependencias técnicas
- Preparar entorno de desarrollo

---

## Notas

- **Prioridad:** HU-001 y HU-002 deben iniciarse primero (bloqueantes)
- **Dependencias:** HU-004 → HU-005 (CRUD primero)
- **Paralelismo:** HU-003 puede hacerse en paralelo
