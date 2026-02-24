# Sprint 1 - San Ignacio

**Proyecto:** San Ignacio - Sistema de Gestión de Clínica Dental  
**Fecha:** 19 Febrero - 25 Febrero 2026  
**Duración:** 1 semana (5 días hábiles)  
**Estado:** Planning  
**Velocity Estimado:** 21 Story Points  

---

## Objetivo del Sprint

Establecer la base del sistema de autenticación y permisos, junto con la gestión del catálogo de tratamientos. Este sprint sienta las bases para el control de acceso y la funcionalidad de agenda.

---

## Matriz de Permisos

| Módulo | ADMIN | DOCTOR | RECEPCIONISTA |
|--------|-------|--------|---------------|
| **Usuarios** | Completo | Ver su perfil | Ver su perfil |
| **Pacientes** | Completo | Completo | Solo resumen |
| **Catálogo Tratamientos** | Completo | Solo lectura | Solo lectura |
| **Agenda** | Completo | Ver/Crear | Gestionar |
| **Pagos** | Completo | Ver | Gestionar |
| **Configuración** | Completo | - | - |

---

## Historias de Usuario

### HU-001: Definición de Roles del Sistema

**ID:** HU-001  
**Título:** Definición de Roles del Sistema  
**Prioridad:** Alta  
**Estimación:** 3 SP  
**Rol:** Administrador  

**Descripción:**  
Como Administrador, quiero definir 3 roles de usuario (Admin, Doctor, Recepcionista) para controlar el acceso al sistema.

**Criterios de Aceptación:**
- [ ] Tabla/enum de roles existe en la base de datos
- [ ] Roles definidos: ADMIN, DOCTOR, RECEPCIONISTA
- [ ] Cada usuario tiene un rol asignado
- [ ] El rol se almacena en el token JWT
- [ ] La API puede consultar el rol del usuario autenticado
- [ ] Validación de rol único por usuario

**Tareas Técnicas:**
- Crear enum/constante de Roles
- Crear migración de tabla de roles
- Agregar campo rol a la entidad Usuario
- Actualizar DTOs de usuario
- Actualizar generación de JWT para incluir rol

---

### HU-002: Implementación de Permisos por Rol

**ID:** HU-002  
**Título:** Implementación de Permisos por Rol  
**Prioridad:** Alta  
**Estimación:** 5 SP  
**Rol:** Administrador  

**Descripción:**  
Como Administrador, quiero que cada rol tenga permisos específicos para restringir funcionalidades.

**Criterios de Aceptación:**
- [ ] Middleware/guards implementados en backend
- [ ] Guards implementados en frontend
- [ ] Matriz de permisos funcional:
  - ADMIN: acceso completo a todo el sistema
  - DOCTOR: pacientes (completo), ver catálogo, ver agenda, ver pagos
  - RECEPCIONISTA: gestionar agenda, resumen pacientes, gestionar pagos, ver catálogo
- [ ] RECEPCIONISTA solo ve resumen de pacientes (sin historial clínico)
- [ ] Rutas protegidas según rol
- [ ] UI adapta según rol del usuario

**Tareas Técnicas:**
- Crear middleware de verificación de rol
- Crear constantes de permisos
- Implementar guard en backend
- Crear guard en frontend (React)
- Implementar HOC o hook de permisos
- Ocultar/mostrar elementos según permisos

---

### HU-003: Corrección Cache Contraseña

**ID:** HU-003  
**Título:** Corrección Cache Contraseña  
**Prioridad:** Media  
**Estimación:** 2 SP  
**Rol:** Usuario  

**Descripción:**  
Como usuario, quiero que el sistema invalide la cache del frontend al cambiar o resetear contraseña.

**Criterios de Aceptación:**
- [ ] Al cambiar contraseña: invalidar cache y cerrar sesión
- [ ] Al resetear contraseña: invalidar cache y redireccionar a login
- [ ] Token de acceso invalidado en backend
- [ ] Feedback claro al usuario
- [ ] Redirección automática a login

**Tareas Técnicas:**
- Implementar endpoint de logout global (invalidar tokens)
- Invalidar refresh tokens en BD
- Frontend: limpiar storage al recibir respuesta exitosa
- Frontend: redireccionar a /login

---

### HU-004: CRUD Catálogo de Tratamientos

**ID:** HU-004  
**Título:** CRUD Catálogo de Tratamientos  
**Prioridad:** Alta  
**Estimación:** 5 SP  
**Rol:** Administrador  

**Descripción:**  
Como Administrador, quiero gestionar el catálogo de tratamientos.

**Criterios de Aceptación:**
- [ ] Crear tratamiento: todos los campos obligatorios
- [ ] Leer tratamientos: lista completa
- [ ] Actualizar tratamiento: todos los campos editables
- [ ] Eliminar tratamiento: soft delete
- [ ] Campos del tratamiento:
  - nombre (string, requerido)
  - precio (decimal, requerido)
  - dias_seguimiento (integer, opcional)
  - duracion (enum: FLEXIBLE, 30min, 1h)
  - especialidad (string, requerido)
- [ ] Validación de datos
- [ ] Solo ADMIN puede acceder a CRUD

**Tareas Técnicas:**
- Crear entidad Tratamiento
- Crear migración de tabla
- Crear CRUD endpoints
- Crear DTOs (Create, Update, Response)
- Crear validaciones
- Crear interfaz en frontend (solo Admin)

---

### HU-005: Activar/Desactivar Tratamientos

**ID:** HU-005  
**Título:** Activar/Desactivar Tratamientos  
**Prioridad:** Media  
**Estimación:** 2 SP  
**Rol:** Administrador  

**Descripción:**  
Como Administrador, quiero activar/desactivar tratamientos.

**Criterios de Aceptación:**
- [ ] Campo estado (boolean) en tratamiento
- [ ] Endpoint para cambiar estado (activar/desactivar)
- [ ] Solo tratamientos activos visibles en agenda
- [ ] Cambio de estado reversible
- [ ] Logging de cambios de estado
- [ ] Solo ADMIN puede cambiar estado

**Tareas Técnicas:**
- Agregar campo activo a entidad Tratamiento
- Crear endpoint toggle estado
- Actualizar queries de agenda para filtrar activos
- Agregar indicador visual en UI

---

### HU-006: Visualización de Catálogo

**ID:** HU-006  
**Título:** Visualización de Catálogo  
**Prioridad:** Media  
**Estimación:** 2 SP  
**Rol:** Doctor/Recepcionista  

**Descripción:**  
Como Doctor/Recepcionista, quiero ver el catálogo de tratamientos activos.

**Criterios de Aceptación:**
- [ ] Vista de solo lectura
- [ ] Mostrar solo tratamientos activos
- [ ] Campos visibles: nombre, precio, duracion, especialidad
- [ ] No permite edición
- [ ] Doctor y Recepcionista pueden acceder
- [ ] Lista actualizada en tiempo real

**Tareas Técnicas:**
- Crear endpoint GET tratamientos (solo activos)
- Crear componente de vista de catálogo
- Configurar rutas con guard de autenticación
- Sin permisos de edición

---

## Resumen de Estimaciones

| HU | Título | SP |
|----|--------|-----|
| HU-001 | Definición de Roles del Sistema | 3 |
| HU-002 | Implementación de Permisos por Rol | 5 |
| HU-003 | Corrección Cache Contraseña | 2 |
| HU-004 | CRUD Catálogo de Tratamientos | 5 |
| HU-005 | Activar/Desactivar Tratamientos | 2 |
| HU-006 | Visualización de Catálogo | 2 |
| **Total** | | **19** |

---

## Definition of Done

- [ ] Código implementado y revisado
- [ ] Pruebas unitarias pasadas (coverage > 70%)
- [ ] Pruebas de integración pasadas
- [ ] Documentación técnica actualizada
- [ ] Criterios de aceptación verificados
- [ ] Code review aprobado
- [ ] Desplegado a entorno de staging

---

## Riesgos Identificados

1. **Riesgo:** La implementación de permisos puede ser más compleja de lo esperado
   - **Mitigación:** Priorizar HU-001 y HU-002 al inicio del sprint

2. **Riesgo:** Dependencias entre entidades pueden requerir ajustes
   - **Mitigación:** Verificar modelo de datos antes de implementar CRUD

---

## Notas de Planificación

- Las HU-001 y HU-002 son bloqueantes para las demás
- HU-004 y HU-005 tienen dependencia técnica (primero CRUD, luego activar/desactivar)
- HU-003 puede implementarse en paralelo con otras HU
- Se deja buffer de 2 SP para imprevistos
