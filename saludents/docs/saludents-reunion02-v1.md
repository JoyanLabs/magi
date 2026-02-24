---
id: REUN-002
title: "Reunión 2 - Validación de Alcance y Prototipos"
type: reunion
version: "1.0.0"
fecha: 2025-02-07
cliente: Saludents
estado: activo
participantes:
  - nombre: "Josué Medina"
    rol: "Equipo técnico - Perú Intercop"
  - nombre: "Alieska Castilla"
    rol: "Representante - Saludents"
  - nombre: "Natalie Mayorga"
    rol: "Asesora - hermana de propietaria"
tags:
  - alcance
  - prototipos
  - recursos-humanos
  - odontograma
  - consentimientos
---

# Reunión 2: Validación de Alcance y Planificación de Prototipos

**Fecha:** Sábado 7 de febrero de 2025  
**Duración:** Reunión técnica de levantamiento de información  
**Lugar:** Remoto (víaMeet/Zoom)

---

## 1. Participantes

| Nombre | Rol | Organización |
|--------|-----|--------------|
| Josué Medina | Equipo técnico | Perú Intercop |
| Alieska Castilla | Representante legal | Saludents |
| Natalie Mayorga | Asesora | Saludents |

---

## 2. Objetivo de la Reunión

Validar el alcance del sistema propuesto y gestionar una nueva reunión para presentar prototipos visuales que permitan validar lo plantado de forma más tangible.

---

## 3. Validación del Alcance del Sistema

### 3.1 Módulos Incluidos en la Propuesta

Se validaron los siguientes módulos que **SÍ están contemplados** dentro del alcance actual del proyecto:

| Módulo | Estado | Descripción |
|--------|--------|-------------|
| Portal de citas web | ✓ Incluido | Reserva de citas online por parte de los pacientes |
| Agenda unificada | ✓ Incluido | Visualización centralizada para doctores y usuarios de recepción |
| Recordatorios de citas | ✓ Incluido | Envío de notificaciones para reducir el ausentismo |
| Control de caja | ✓ Incluido | Gestión de ingresos y costos de tratamientos |
| Inventarios | ✓ Incluido | Control de stock de materiales |
| Repositorio de imágenes | ✓ Incluido | Guardado de fotografías antes/después y placas radiográficas |
| Página web corporativa | ✓ Incluido | Landing page con información de la clínica y sección de agendamiento |

### 3.2 Módulos Adicionales Identificados (Fuera del Alcance Actual)

Los siguientes módulos fueron identificados como **necesarios pero fuera del alcance** inicial:

| Módulo | Descripción | Prioridad sugerida |
|--------|-------------|-------------------|
| **Módulo de Recursos Humanos** | Gestión de vacaciones, permisos, horas extras, faltas para 13-15 trabajadores | Media-Alta |
| **Odontograma gráfico interactivo** | Evaluación visual de cada pieza dental con hallazgos clínicos | Alta |
| **Consentimientos con firma digital** | Generación automática de documentos con firma digital | Media |
| **Descuentos dinámicos y fidelización (CRM)** | Promociones por campañas, precios diferenciados por convenios | Media |
| **Historial estadístico de cancelaciones** | Registro de pacientes que faltan o cancelan citas | Baja |

---

## 4. Decisiones Tomadas

### 4.1 Prioridad de Implementación

Se estableció el siguiente orden de prioridad para el desarrollo de módulos:

```
1. Núcleo médico (paciente y doctor) ← PRIMERO
2. Funcionalidades administrativas ← SEGUNDO
3. Recursos Humanos ← AL FINAL
```

### 4.2 Gestión de Agendas

| Decisión | Detalle |
|----------|---------|
| Agenda centralizada | Recepción centraliza toda la agenda de la clínica |
| Agenda individual del doctor | Cada doctor tendrá su propia agenda visible en el sistema |
| Agendamiento por doctor | Los doctores pueden agendar sus propias citas después de la primera atención |
| Visualización cruzada | Recepción puede ver lo que los doctores agendan |

### 4.3 Sistema de Consentimientos

Se definió un **sistema híbrido** para el manejo de consentimientos:

1. Imprimir el consentimiento
2. Firmar en físico
3. Escanear el documento firmado
4. Subir al sistema asociado a la historia clínica del paciente

> **Nota:** La firma digital no está contemplada en el alcance actual debido a su complejidad técnica y legal.

### 4.4 Integración de Radiografías

| Proceso | Descripción |
|---------|-------------|
| Recepción del link | El centro de radiografías envía un link para visualizar |
| Descarga manual | El personal descarga la imagen del link proporcionado |
| Subida al sistema | Se sube la imagen al repositorio del sistema |
| Generación de nuevo link | El sistema genera un link propio para compartir con el paciente |

> **Justificación:** No se utiliza el link externo directamente porque puede dejar de estar disponible con el tiempo.

---

## 5. Información Requerida para la Próxima Reunión

### 5.1 Documentación Pendiente

| Documento | Responsable | Estado |
|-----------|-------------|--------|
| Plan de Implementación | Consultantepara revisión | Pendiente |
| Lista de tipos de tratamientos/servicios | Doctora/Saludents | Pendiente |
| Lista de convenios con empresas | Administración | Pendiente |
| Leyenda del odontograma (hallazgos más usados) | Doctora | Pendiente |
| Referencias de páginas web inspiradoras | Alieska/Natalie | Pendiente |

### 5.2 Canales de Captación de Pacientes

Se solicitó información sobre los canales actuales de captación:

- **Referidos:** Pacientes recomendados por otros pacientes
- **Convenios:** Empresas con acuerdos comerciales
- **Campañas:** promociones por fechas especiales (Día de la Madre, Día del Niño, campaña escolar, etc.)
- **Redes sociales:** Pendiente de migración a nuevo community manager

### 5.3 Detalles Adicionales Solicitados

- Lista de servicios y especialidades que ofrece la clínica
- Información que desean mostrar en la página web corporativa
- Fotos de doctores especialistas
- Formatos actuales de historia clínica (ya fueron proporcionados en reunión anterior)

---

## 6. Staff de la Clínica

| Dato | Valor |
|------|-------|
| Total de trabajadores | 13-15 personas |
| Tipo de personal | Mixto (administrativo y operativo) |
| Gestión actual | Documentos físicos (riesgo de extravío) |

---

## 7. Próxima Reunión

| Aspecto | Detalle |
|---------|---------|
| **Fecha propuesta** | Sábado siguiente (8 de febrero de 2025) |
| **Horario** | Mañana |
| **Objetivo** | Validar prototipos visuales del sistema |
| **Agenda prevista** | Revisión de diseño de módulos principales |

---

## 8. Puntos de Acción

| # | Acción | Responsable | Fecha límite |
|---|--------|-------------|--------------|
| 1 | Obtener Plan de Implementación del consultor | Alieska Castilla | Antes de próxima reunión |
| 2 | Preparar lista de tratamientos y servicios | Equipo Saludents | Antes de próxima reunión |
| 3 | Compilar lista de convenios con empresas | Administración | Antes de próxima reunión |
| 4 | Solicitar a doctora la leyenda del odontograma | Alieska Castilla | Antes de próxima reunión |
| 5 | Buscar referencias de páginas web inspiradoras | Alieska/Natalie | Antes de próxima reunión |
| 6 | Reunión con community manager para definir contenido web | Alieska Castilla | Antes de próxima reunión |

---

## 9. Notas Técnicas

### 9.1 Consideraciones sobre el Odontograma

- El odontograma gráfico interactivo **no está incluido** en el alcance inicial
- Se recomienda implementarlo desde el inicio si se desea incluirlo, ya que será difícil agregarlo después
- Se requiere la leyenda de hallazgos más utilizados para una implementación adecuada
- Normativa estándar disponible, pero se priorizarán los más usados por los doctores de la clínica

### 9.2 Consideraciones sobre el Módulo de Recursos Humanos

- Actualmente gestionan vacaciones, permisos y horas extras con documentos físicos
- Existe riesgo de extravío y falta de control sistemático
- Se contará con máquinas de asistencia en cada oficina
- Workflow propuesto: Solicitud → Aprobación por jefe inmediato → Registro en sistema

### 9.3 Integración con Centro de Radiografías

- Actualmente reciben enlaces externos para visualizar radiografías
- El sistema propuesto requiere descargar y volver a subir las imágenes
- Esto garantiza disponibilidad permanente del material en el sistema propio

---

## 10. Anexos

*No se incluyen anexos en esta versión. Los siguientes documentos deberán ser proporcionados antes de la próxima reunión:*

- Plan de Implementación (documento del consultor)
- Lista de servicios y tratamientos
- Lista de convenios empresariales
- Leyenda del odontograma
- Referencias visuales para página web

---

**Estado del documento:** Activo  
**Versión:** 1.0.0  
**Última actualización:** 7 de febrero de 2025  
**Elaborado por:** Equipo Técnico - Perú Intercop
