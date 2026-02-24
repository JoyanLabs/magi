---
id: PROP-PERUINTERCORP-0025-0153
title: "Cotización PERUINTERCORP-0025-N°0153 - Desarrollo de Herramienta Digital para Gestión de Odontogramas, Servicios Clínicos, Evolución del Paciente y Tratamientos Dentales"
type: propuesta
version: "1.0.0"
fecha: "2026-01-20"
cliente: "SAN IGNACIO DE PIURA S.A.C."
consultor: "PERU INTERNATIONAL CORPORATION E.I.R.L."
estado: activo
---

# Cotización PERUINTERCORP-0025-N°0153

## Desarrollo de una Herramienta Digital para la Gestión de: Odontogramas, Servicios Clínicos, Evolución del Paciente y Tratamientos Dentales

---

## 1. Detalle del Servicio

### Información de la Empresa Cliente

| Campo | Valor |
|-------|-------|
| **Razón Social** | SAN IGNACIO DE PIURA S.A.C. |
| **RUC** | 20526539673 |
| **Dirección** | Pj. 19 Mza. D Lote. 16 Urb. Tallanes, Piura - Piura - Piura |

### Servicios Solicitados

| Servicio | Descripción |
|----------|-------------|
| DESARROLLO DE GESTIÓN CLÍNICA CORE | Desarrollo del sistema principal de gestión |
| MÓDULOS DE INTELIGENCIA DE NEGOcio | Herramientas de análisis y CRM |
| GESTIÓN DOCUMENTAL Y ARQUITECTURA CLOUD | Almacenamiento y arquitectura en la nube |

### Resumen de la Propuesta

Nuestra empresa desarrollará una plataforma integral diseñada para potenciar la eficiencia operativa de la clínica. La solución se centra en digitalizar el flujo de atención, desde el registro y agendamiento del paciente hasta el análisis financiero de los tratamientos, incorporando herramientas de inteligencia de negocios para el seguimiento y retención de pacientes, todo bajo una arquitectura segura y de uso interno.

---

## 2. Objetivo del Servicio

### 2.1. Objetivo Principal

> Implementar una herramienta digital centralizada que optimice la gestión administrativa y médica, permitiendo un control detallado de los tratamientos, costos y el seguimiento proactivo de los pacientes para maximizar la ocupación de la agenda.

### 2.2. Objetivos Específicos

| # | Objetivo Específico | Descripción |
|---|---------------------|-------------|
| 1 | **Centralización de Información** | Digitalizar el registro de pacientes, historias clínicas y documentación en un repositorio seguro |
| 2 | **Optimización del Agendamiento** | Implementar un sistema de agendamiento inteligente que facilite la gestión de citas y la comunicación efectiva con el paciente |
| 3 | **Control Financiero** | Visualizar costos dinámicos y rentabilidad real por cada servicio o tratamiento realizado |
| 4 | **Gestión Documental en la Nube** | Almacenamiento seguro de radiografías, documentos y archivos adjuntos con escalabilidad garantizada y costos eficientes |

---

## 3. Propuesta Técnica

### 3.1. Arquitectura General

La solución será una **plataforma web unificada** con control de acceso basado en roles (RBAC) para:
- Doctores
- Administradores

---

### 3.2. Módulo de Gestión Clínica y Agenda

Administración eficiente del flujo diario de la clínica.

| Funcionalidad | Descripción |
|--------------|-------------|
| **Registro y Filiación de Pacientes** | Base de datos completa con información personal, antecedentes y datos de contacto |
| **Historia Clínica Digital** | Repositorio centralizado donde se registran las atenciones, diagnósticos y notas de evolución de forma textual y ordenada |
| **Registro de Servicios y Tratamientos** | Interfaz ágil para imputar los procedimientos realizados al paciente durante la consulta, vinculándolos a su historial |
| **Gestión de Citas (Agenda)** | Calendario para la programación, reprogramación y control de estados de citas (confirmada, asistida, cancelada) |

---

### 3.3. Módulo de Agendamiento Inteligente

Herramienta proactiva para la gestión de la relación con el paciente. Este módulo permite visualizar y gestionar las interacciones con los pacientes para asegurar la continuidad de los tratamientos y reducir el ausentismo.

#### A. Línea de Tiempo del Paciente

Vista cronológica unificada que muestra todo el historial de interacciones:
- Fecha de registro
- Citas asistidas
- Citas canceladas
- Intentos de llamada
- Notas de seguimiento

> **Beneficio:** Facilita al personal entender el contexto del paciente rápidamente

#### B. Bitácora de Comunicaciones

Registro manual de acciones de contacto:
- Ejemplos: "Llamada sin respuesta", "Buzón de voz", "Confirmó asistencia"
- Gestión de estados de contacto para evitar pérdida de seguimiento en pacientes difíciles de ubicar

#### C. Semáforo de Acción

Panel visual que prioriza qué pacientes necesitan atención o contacto.

**Criterios de Alerta:**
- Pacientes pendientes de agendar retorno
- Pacientes inactivos por un periodo determinado (para campañas de reactivación)
- Pacientes con interacciones pendientes (ej. "Llamar mañana")

> **El sistema resaltará pacientes según reglas de negocio**

---

### 3.4. Módulo de Analítica de Costos y Rentabilidad

Inteligencia financiera aplicada a los tratamientos.

| Funcionalidad | Descripción |
|--------------|-------------|
| **Estructura de Costos por Servicio** | Configuración de costos base asociados a cada tipo de tratamiento (insumos, gastos operativos) |
| **Costos Dinámicos** | Funcionalidad que permite ajustar los costos registrados en un tratamiento específico si ocurrieron eventualidades (ej. mayor uso de material), permitiendo reflejar el costo real de esa atención sin alterar el tarifario general |
| **Dashboard de Rentabilidad** | Reportes interactivos que comparan el Precio de Venta vs. Costo Real, análisis de márgenes de ganancia por tratamiento y especialidad |

---

### 3.5. Gestión Documental e Imágenes

Funcionalidad de almacenamiento en nube.

| Funcionalidad | Descripción |
|--------------|-------------|
| **Expediente Digital de Archivos** | Capacidad para subir y almacenar cualquier tipo de archivo relacionado al paciente (PDFs, resultados de laboratorio, consentimientos firmados, etc) |
| **Repositorio de Imágenes** | Carga y visualización de radiografías y fotografías clínicas dentro de la historia del paciente |

---

### 3.6. Proyección de Costos de Almacenamiento en Nube

Para el almacenamiento masivo de imágenes y documentos, recomendamos el uso de **Cloudflare R2** debido a su alta eficiencia en costos y la eliminación de tarifas por ancho de banda.

| Capacidad de Almacenamiento | Costo Estimado Anual (USD) | Cantidad Aprox. de Archivos/Imágenes |
|----------------------------|----------------------------|---------------------------------------|
| 100 GB | $ 18.00 USD | ~30,000 - 50,000 archivos |
| 500 GB | $ 90.00 USD | ~150,000 - 250,000 archivos |
| 1 TB (1000 GB) | $ 180.00 USD | ~300,000 - 500,000 archivos |
| 2 TB (2000 GB) | $ 360.00 USD | ~600,000 - 1M archivos |

#### Notas Importantes

| Nota | Detalle |
|------|---------|
| **Nota 1** | A diferencia de otros proveedores, Cloudflare R2 no cobra por la salida de datos (egress), lo que significa que visualizar o descargar las imágenes no genera costos adicionales |
| **Nota 2** | El costo operativo (lectura/escritura) es marginal ($0.36 por millón de lecturas) y no representa un impacto significativo en la facturación mensual para el volumen de una clínica |
| **Nota 3** | Se implementarán estrategias de compresión para optimizar el espacio sin perder calidad diagnóstica |

---

## 4. Servicios Complementarios

### 4.1. Capacitación Especializada

Se brindará un programa de capacitación práctico dirigido al personal de SAN IGNACIO DE PIURA S.A.C.:

- [ ] Uso del Odontograma Digital para registro de tratamientos
- [ ] Gestión de la Agenda y módulo de imágenes
- [ ] Entrega de manuales de operación detallados

### 4.2. Soporte Técnico y Acompañamiento

Una vez implementada la solución, se brindará un servicio de soporte técnico (**3 meses**) para garantizar la continuidad operativa.

**Incluye:**
- Monitorización de la infraestructura web
- Actualizaciones de seguridad
- Asistencia ante incidencias
- Gestionado mediante sistema de tickets

### 4.3. Infraestructura en la Nube (Hosting y Servicios)

Provisión y configuración del servidor y servicios en la nube necesarios para:
- Alojar la plataforma web
- Herramientas de gestión durante el primer año
- Velocidad asegurada
- Certificados de seguridad (SSL) incluidos

---

## 5. Metodología y Fases del Proyecto

El proyecto se trabajó mediante la metodología **Scrum**, reemplazando la estructura de fases rígidas por un enfoque más iterativo, teniendo un entregable funcional cada 3-4 semanas (Sprints).

> **Nota:** Esta estructura considera el compromiso por parte de SAN IGNACIO DE PIURA S.A.C. para interacturar en las presentaciones y brindar retroalimentación.

### Fase 1: Análisis y Levantamiento de Información

| Aspecto | Detalle |
|---------|---------|
| **Objetivo** | Comprender los flujos clínicos actuales, definir los requerimientos funcionales de la Historia Clínica y estructurar campos base |
| **Actividades** | Reunión de kick-off y alineación de objetivos; Mapeo de procesos de admisión, triaje y consulta odontológica; Diseño UX/UI de la interfaz del Sistema; Elaboración del documento de requerimientos funcionales (Backlog) |
| **Entregables** | Documento de levantamiento de información; Prototipos Visuales del Sistema |

### Fase 2: Diseño y Desarrollo del Sistema Core

| Aspecto | Detalle |
|---------|---------|
| **Objetivo** | Construir los módulos Core de la plataforma clínica |
| **Módulos** | Desarrollo del Sistema Core y Gestión de Pacientes; Desarrollo de la Agenda Médica y módulo de Citas; Integración de la Historia Clínica Digital y Registro de Tratamientos |
| **Entregables** | Plataforma en entorno de pruebas (Beta); Módulo Clínico Funcional |

### Fase 3: Implementación de Inteligencia de Negocio

| Aspecto | Detalle |
|---------|---------|
| **Objetivo** | Desplegar las herramientas avanzadas de gestión y costos |
| **Actividades** | Desarrollo del Módulo de Seguimiento Inteligente (CRM) y Línea de Tiempo; Desarrollo del Módulo de Costos y Rentabilidad Dinámica; Integración del Repositorio de Imágenes y documentos en la nube; Pruebas unitarias, de integración y de aceptación por el usuario (UAT) |
| **Entregables** | Sistema Operativo completo (Agendamiento + Costos + Clínica) |

### Fase 4: Capacitación y Migración

| Aspecto | Detalle |
|---------|---------|
| **Objetivo** | Transferir el conocimiento al personal médico y administrativo |
| **Actividades** | Configuración inicial de doctores, consultorios y tarifas base; Capacitación por roles (Odontólogos, Recepción, Administrador); Entrega de guías y manuales operativos |
| **Entregables** | Personal capacitado; Manuales de Usuario entregados |

### Fase 5: Soporte Técnico y Estabilización

| Aspecto | Detalle |
|---------|---------|
| **Objetivo** | Garantizar la continuidad operativa |
| **Actividades** | Monitoreo del funcionamiento general; Atención de incidencias y ajustes menores |
| **Entregables** | Sistema estabilizado; Informe de Cierre |

---

## 6. Cronograma de Ejecución

La ejecución del proyecto tiene un plazo máximo de **05 meses**, distribuidos en **20 semanas**.

| Fase | Duración | Periodo Estimado | Entregables Principales |
|------|----------|------------------|------------------------|
| Fase 1: Análisis y levantamiento de información | 4 Semanas | 1–4 | Documento de requerimientos, Diseños UX de Flujos Clínicos y Costos |
| Fase 2: Diseño y desarrollo del sistema | 10 Semanas | 5–14 | Plataforma en pruebas (Beta), Historia Clínica y Citas |
| Fase 3: Implementación y pruebas funcionales | 3 Semanas | 15–17 | Sistema Operativo, Módulos de Agendamiento Inteligente y Costos integrados |
| Fase 4: Migración y Capacitación al personal | 1 Semana | 18–19 | Personal capacitado y Manuales entregados |
| Fase 5: Soporte técnico y estabilización | 1 Semana | 19–20 | Sistema estabilizado y cierre de proyecto |

> **Duración total: 20 Semanas (5 Meses)**

---

## 7. Propuesta Económica

Se presenta una propuesta integral a todo costo, ajustada a los requerimientos del TDR. La inversión cubre todos los aspectos necesarios para el éxito del proyecto durante los 05 meses de ejecución.

### Notas Importantes

| Nota | Detalle |
|------|---------|
| **Validez** | La propuesta es válida solo por 30 días |
| **IGV** | El costo incluye IGV |
| **WhatsApp API** | La propuesta incluye la integración técnica. Los costos por consumo de mensajes (conversaciones) son variables y facturados directamente por Meta al cliente |
| **Almacenamiento Cloud** | Se incluye la configuración inicial. Costos de almacenamiento masivo (GBs adicionales) dependen del proveedor cloud |

### Detalle de Costos

| # | Servicio | Monto (S/) | Plazo |
|---|----------|------------|-------|
| 1 | DESARROLLO DE GESTIÓN CLÍNICA CORE | 22,000.00 | 05 meses (Plazo máximo) |
| 2 | MÓDULOS DE INTELIGENCIA DE NEGOCIO | 10,000.00 | - |
| 3 | GESTIÓN DOCUMENTAL Y ARQUITECTURA CLOUD | 4,000.00 | - |
| | **TOTAL** | **S/. 36,000.00*** | |
| 4 | Capacitación y Transferencia de Conocimiento | Incluido | - |
| 5 | Infraestructura, Soporte y Mantenimiento del Sistema | Incluido | 03 Meses (después de terminado el servicio) |

> *Treinta y seis mil con 00/100 soles

---

## 8. Entregables y Formas de Pago

### Entregables del Proyecto

Para el desarrollo del servicio se considera un acompañamiento completo desde la firma del contrato.

- [ ] Plataforma Clínica Web operativa (Historia + Agenda + Costos + Seguimiento)
- [ ] Código Fuente y Manuales de Usuario (Doctores y Admin)
- [ ] 01 informe parcial entregado a los 3 meses de implementación del servicio
- [ ] 01 informe final evidenciando el logro de los alcances requeridos en el item 2 (Objetivos) del presente documento
- [ ] 01 informe de madurez Digital

### Estructura de Pagos

| Concepto | Monto (S/) | Condición |
|----------|------------|------------|
| 50% de Adelanto | 18,000.00 | Al iniciar el servicio y previa aprobación del Plan de Trabajo |
| 50% al Concluir | 18,000.00 | Previa conformidad de la implementación final, capacitación realizada y entrega de informes de cierre |

---

## Referencias del Documento

| Campo | Valor |
|-------|-------|
| **Código de Cotización** | PERUINTERCORP-0025-N°0153 |
| **Fecha** | 20 de enero de 2026 |
| **Consultor** | PERU INTERNATIONAL CORPORATION E.I.R.L. |
| **Cliente** | SAN IGNACIO DE PIURA S.A.C. |
| **Programa** | Concurso MIPYMES DIGITALES - Programa Proinnovate |
