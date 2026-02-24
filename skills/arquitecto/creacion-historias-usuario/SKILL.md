---
name: creacion-historias-usuario
description: >
  Crea historias de usuario detalladas para cada épica.
  Trigger: Cuando se necesitan crear las HU específicas de cada épica.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Creando historias de usuario"
allowed-tools: Read, Edit, Write
---

## Propósito

Crear historias de usuario con:
- Descripción clara (formato BDD)
- Criterios de aceptación verificables
- Notas técnicas
- Vinculación con épica

## Cuándo Usar Este Skill

- Después de tener las épicas creadas
- Para cada funcionalidad dentro de una épica

## Estructura de una HU

```markdown
---
id: HU-{N}
title: "{título de la historia}"
épica: {id-épica}
módulo: {nombre-módulo}
prioridad: high|medium|low
sprint: {n}
estimación: {n} puntos
---

## Historia de Usuario

**Como** {rol}
**Quiero** {funcionalidad}
**Para** {beneficio}

## Descripción

{Descripción adicional de 2-3 oraciones}

## Criterios de Aceptación

### Criterios Funcionales

- [ ] {criterio 1 verificable}
- [ ] {criterio 2 verificable}
- [ ] {criterio 3 verificable}

### Criterios No Funcionales

- [ ] {criterio de rendimiento}
- [ ] {criterio de seguridad}

### Criterios de UX

- [ ] {criterio de usabilidad}

## Flujo de Usuario

```
1. {Paso 1}
2. {Paso 2}
3. {Paso 3}
```

## Casos de Prueba

| Escenario | Pasos | Resultado Esperado |
|-----------|-------|-------------------|
| Happy path | 1, 2, 3 | {resultado} |
| Validación fallida | 1, 2 | {mensaje de error} |
| Edge case | 1, 2, 3, 4 | {resultado} |

## Notas Técnicas

| Aspecto | Detalle |
|---------|---------|
| Endpoint | {API endpoint} |
| Entidad | {Entidad en BD} |
| Permisos | {roles que pueden acceder} |
| Validaciones | {validaciones necesarias} |
| Excepciones | {casos de error} |

## Dependencies

- {HU-001} - Debe existir primero
- {HU-002} - Depende de esta

## Definition of Done

- [ ] Código implementado
- [ ] Tests unitarios pasando
- [ ] Tests de integración pasando
- [ ] Code review aprobado
- [ ] Desplegado a staging
- [ ] QA aprobado
- [ ] Documentación actualizada
```

## Ejemplo: HU de Registro de Pacientes

```markdown
---
id: HU-001
title: "Registro de nuevos pacientes"
épica: EPICA-001
módulo: Pacientes
prioridad: high
sprint: 2
estimación: 5 puntos
---

## Historia de Usuario

**Como** recepcionista
**Quiero** registrar nuevos pacientes en el sistema
**Para** tener un registro digital de todos los pacientes de la clínica

## Descripción

Permite a la recepcionista ingresar los datos completos de un nuevo paciente al sistema. Validará que el DNI sea único y que los datos obligatorios estén presentes.

## Criterios de Aceptación

### Criterios Funcionales

- [ ] Formulario de registro con campos: nombre, apellido, DNI, teléfono, email, fecha nacimiento, dirección
- [ ] DNI debe ser único en el sistema (validación en tiempo real)
- [ ] Todos los campos obligatorios deben validarse antes de enviar
- [ ] Al guardar, se crea la ficha del paciente
- [ ] Sistema muestra mensaje de éxito
- [ ] Redirección a la ficha del paciente creado

### Criterios No Funcionales

- [ ] Tiempo de respuesta < 2 segundos
- [ ] Los datos se persistentes en PostgreSQL
- [ ] Backups automáticos habilitados

### Criterios de UX

- [ ] Mensajes de error claros y en español
- [ ] Los campos obligatorios tienen asterisco
- [ ] El botón de guardar está deshabilitado hasta completar campos obligatorios

## Flujo de Usuario

```
1. Recepcionista hace clic en "Nuevo Paciente"
2. Sistema muestra formulario de registro
3. Recepcionista completa los campos
4. Sistema valida en tiempo real (DNI único)
5. Recepcionista hace clic en "Guardar"
6. Sistema valida todos los campos
7. Sistema guarda el paciente
8. Sistema muestra mensaje de éxito
9. Sistema redirecciona a la ficha del paciente
```

## Casos de Prueba

| Escenario | Pasos | Resultado Esperado |
|-----------|-------|-------------------|
| Registro exitoso | 1-9 | Paciente creado, mensaje de éxito, redirección |
| DNI duplicado | 1-4 | Mensaje de error "DNI ya registrado" |
| Campo obligatorio vacío | 1-6 | Mensaje de error en campo específico |
| Email inválido | 1-5 | Mensaje de error "Email inválido" |

## Notas Técnicas

| Aspecto | Detalle |
|---------|---------|
| Endpoint | POST /api/patients |
| Entidad | Patient |
| Permisos | Recepción, Admin |
| Validaciones | DNI único, email formato, teléfono formato |
| Exceciones | DuplicateKeyException, ValidationException |

## Definition of Done

- [x] Código implementado
- [ ] Tests unitarios pasando
- [ ] Tests de integración pasando
- [ ] Code review aprobado
- [ ] Desplegado a staging
- [ ] QA aprobado
- [ ] Documentación actualizada
```

## Ejemplo: HU de Odontograma

```markdown
---
id: HU-005
title: "Selección de pieza dental en odontograma"
épica: EPICA-002
módulo: Pacientes
prioridad: high
sprint: 2
estimación: 8 puntos
---

## Historia de Usuario

**Como** doctor
**Quiero** seleccionar una pieza dental específica en el odontograma
**Para** poder registrar hallazgos en esa pieza

## Descripción

El doctor hace clic en una pieza dental del odontograma y el sistema la selecciona visualmente, mostrando las 5 superficies disponibles para seleccionar.

## Criterios de Aceptación

### Criterios Funcionales

- [ ] Todas las 32 piezas dentales visibles (adulto) o 20 (infantil)
- [ ] Click en pieza la selecciona visualmente (highlight)
- [ ] Al seleccionar, aparecen las 5 superficies: oclusal, mesial, distal, vestibular, lingual
- [ ] Superficies son clicables
- [ ] Odontograma adulto e infantil son intercambiables
- [ ] La selección es reversible (click en misma pieza para deseleccionar)

### Criterios No Funcionales

- [ ] Renderizado suave (sin parpadeo)
- [ ] Funciona en tablets (touch)
- [ ] Responsive en móvil

### Criterios de UX

- [ ] Efecto hover indica que la pieza es clicable
- [ ] Transición suave al seleccionar
- [ ] Color de selección visible pero no invasivo

## Flujo de Usuario

```
1. Doctor abre ficha de paciente
2. Doctor navega a sección Odontograma
3. Sistema muestra odontograma con todas las piezas
4. Doctor hace clic en pieza #18
5. Sistema resalta pieza #18
6. Sistema muestra panel de superficies
7. Doctor hace clic en superficie "Oclusal"
8. Sistema selecciona superficie
9. Doctor aplica marcador (caries, restauración, etc.)
```

## Notas Técnicas

| Aspecto | Detalle |
|---------|---------|
| Componente | OdontogramCanvas.vue |
| Estado | Pinia store (odontogram) |
| API | GET /api/patients/:id/odontogram |
| Permisos | Doctor, Admin |
| Touch | Hammer.js para gestures |

## Definition of Done

- [x] Código implementado
- [x] Tests de componente
- [ ] Code review
- [ ] Validación UX con doctores
- [ ] Cumple norma Colegio Odontólogos
```

## Tips para BUENAS HU

1. **Una HU = una funcionalidad**: No meter varias cosas en una
2. **Criterios verificables**: Deben poder probarse
3. **Valor de negocio**: Explicar el "para qué"
4. **Independientes**: Deben poder desarrollarse en cualquier orden (si es posible)
