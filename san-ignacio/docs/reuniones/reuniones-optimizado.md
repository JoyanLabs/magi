---
title: Levantamiento de Información - Reuniones
id: reuniones
tipo: analisis
fuente: reunion
estado: completado
prioridad: 5
proyecto: san-ignacio
---

# Levantamiento de Información - Reuniones

## Resumen de Reuniones Realizadas

### Reunion 1: Levantamiento Inicial
**Objetivo:** Primer contacto con el cliente para entender los procesos actuales de la clínica.

**Temas Tratados:**
- Presentación del proyecto y objetivos
- Procesos actuales de la clínica dental
- Necesidades de sistematización
- Requisitos generales del sistema

---

### Reunion 2: Prototipos Visuales
**Objetivo:** Mostrar prototipos visuales para validación del cliente.

**Temas Tratados:**
- Presentación de prototipos de interfaz
- Flujos clínicos y procesos de atención
- Revisión del diseño del Odontograma
- Comentarios y observaciones del cliente
- Análisis del flujo actual de recepción (llamadas telefónicas y agenda física)

---

### Reunion 3: Validación y Ajustes
**Objetivo:** Validar observaciones y definir ajustes finales.

**Temas Tratados:**
- Revisión de prototipos de: agendamiento, registro de pacientes, catálogo de tratamientos, odontograma interactivo
- Decisiones sobre sistematización de procesos
- Validación de identidad visual

---

## Procesos Identificados para Sistematizar

### Procesos Clínicos

#### 1. Agendamiento de Citas
- Transformar la agenda de papel en calendario digital
- Manejar dos turnos: 8:00 am a 2:00 pm y 2:00 pm a 8:00 pm
- Permitir agendar según disponibilidad de los 3 odontólogos y sus especialidades (Ortodoncia, Endodoncia, Odontopediatría, Rehabilitación, etc.)
- Tipos de atención: Consulta, Tratamiento, Control

#### 2. Odontograma Digital Interactivo
- Sistematizar el dibujo en papel para selección de diente y cara (oclusal, palatina, etc.)
- Guardar histórico de odontogramas de cada sesión
- **Lógica de colores obligatoria:**
  - 🔴 **Rojo:** Diagnósticos/tratamientos por realizar (lo malo/pendiente)
  - 🔵 **Azul:** Tratamientos ya realizados (lo bueno/curado)
  - Cruz roja para extracciones pendientes
  - Azul para dientes ya extraídos/ausentes

#### 3. Gestión de Archivos y Consentimientos
- Centralizar radiografías y escáneres intraorales
- Subir consentimientos informados escaneados/fotografiados
- Adjuntar a historia clínica digital

#### 4. Historia Clínica
- Registro de datos de filiación (incluyendo menor de edad y datos del apoderado)
- Preguntas obligatorias: enfermedades, medicamentos actuales, cirugías recientes, embarazos, contacto de emergencia
- Bitácora de evolución médica

---

### Procesos Administrativos

#### 1. Gestión de Citas
- Programación y reprogramación
- Control de estados (confirmada, asistida, cancelada)
- Seguimiento de ausentismo (llamadas manuales para reprogramar)

#### 2. Control de Pagos (Caja)
- Digitalizar cuaderno de ingresos y egresos
- Registrar "amortizaciones" o "pagos a cuenta" para tratamientos largos (ej. ortodoncia)
- Sistema de alertas para pagos pendientes

#### 3. Seguimiento de Pacientes (CRM)
- Asociación de días de seguimiento a cada tratamiento
- Alertas automáticas para que recepción contacte pacientes
- Reducción del ausentismo
- Bandejas de trabajo para seguimiento

---

## Requerimientos Específicos del Cliente

### Requisitos Funcionales

| Requisito | Detalle |
|-----------|---------|
| **Gestión de roles** | Administrador, Doctor, Recepcionista con permisos diferenciados |
| **Catálogo de tratamientos** | CRUD con nombre, precio, duración, días de seguimiento |
| **Campos obligatorios en agenda** | Especialista asignado, campo de comentario/referencia |
| **Odontograma por superficies** | Registro cara por cara del estado del diente |
| **Histórico de odontogramas** | Mantener historial de cada sesión |
| **Gestión de archivos** | Subir imágenes, radiografías, consentimientos |
| **Dashboard** | Reportes financieros y KPIs de productividad |

### Requisitos de Diseño

| Aspecto | Detalle |
|---------|---------|
| **Identidad visual** | Logotipo de la clínica, color institucional "celestito suave" y letras plateadas |
| **Terminología** | "Pago a cuenta" en lugar de "Amortización" |
| **Nomenclatura dental** | Símbolos y siglas según normativa del Colegio Odontológico del Perú |

### Requisitos Legales

| Aspecto | Detalle |
|---------|---------|
| **Odontograma** | Debe cumplir con Norma Técnica del Colegio Odontológico del Perú |
| **Consentimientos** | Sistema para escanear/fotografiar consentimientos físicos firmados |

---

## Decisiones Tomadas

1. **Adaptación de Consentimientos:** Se decidió habilitar un módulo para escanear/subir consentimientos físicos como PDF/imágenes (firma digital fuera de alcance)

2. **Vigencia del Odontograma:**
   - Si el paciente regresa en periodo corto (semanas): actualizar mismo odontograma (rojo → azul)
   - Si el paciente regresa después de 1 año: generar odontograma completamente nuevo

3. **Validación de Nomenclatura:** El cliente proporcionará diseño del odontograma en PDF para validar símbolos y colores

---

## Estado del Proyecto

| Sprint | Fechas | Estado |
|--------|--------|--------|
| Sprint 0 | 12-18 Feb | ✅ Completado |
| Sprint 1 | 19-25 Feb | 🔄 En progreso |

**Sprint 0 completado:**
- Setup técnico (repositorios, CI/CD, PostgreSQL)
- Validación de prototipos visuales (agenda y odontograma)

**Sprint 1 en progreso:**
- Autenticación y gestión de roles
- Catálogo de tratamientos (CRUD)
- Seguridad (invalidar caché al cambiar contraseña)

---

## Notas

*Documento creado a partir de transcripciones de reuniones y queries a NotebookLM.*

---

## Estado de Optimización

| Aspecto | Estado |
|---------|--------|
| Extracción de información | ✅ Completado |
| Estructuración en Markdown | ✅ Completado |
| Validación con cliente | ✅ Confirmado en reuniones |
| Información enriquecida | ✅ Con detalles de transcripciones |
