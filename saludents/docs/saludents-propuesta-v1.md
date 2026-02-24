---
id: PROP-001
title: "Implementación de Plataforma Digital para Comercialización de Servicios Odontológicos"
type: propuesta
version: "1.0.0"
fecha: 2024-01-15
cliente: "Saludents Peru E.I.R.L."
estado: activo
---

# PROPUESTA TÉCNICA

## 1. DETALLE DEL SERVICIO

### Empresa
- **Razón Social:** Saludents Peru E.I.R.L.
- **RUC:** 20601172438
- **Dirección:** Av. Collasuyo Nro. 3319 Int. a-2, Marcavalle – Cusco – Cusco

### Resumen Ejecutivo
Desarrollo e implementación de una **Plataforma Integral de Comercialización y Gestión Clínica** que integra:
- Atracción de pacientes mediante portal comercial moderno con reservas en línea
- Eficiencia operativa mediante digitalización de historia clínica y gestión administrativa
- Infraestructura propia y segura centralizada en la nube

---

## 2. OBJETIVO DEL SERVICIO

### 2.1 Objetivo Principal
Implementar una plataforma tecnológica que integre la gestión comercial y clínica, permitiendo a SaluDents captar nuevos pacientes a través de canales digitales y administrar sus tratamientos, citas y pagos de manera eficiente y centralizada en la nube.

### 2.2 Objetivos Específicos

| Objetivo | Descripción |
|----------|-------------|
| Digitalización Comercial | Implementar vitrina web atractiva con catálogo de servicios, promociones y sistema de reserva de citas en línea |
| Gestión Clínica Centralizada | Migrar historias clínicas físicas a repositorio digital seguro con filiación, antecedentes y evolución de pacientes |
| Optimización de Agenda | Unificar agenda de doctores con solicitudes web, automatizar confirmación de citas y reducir ausentismo |
| Control Administrativo | Digitalizar registro de tratamientos y pagos para claridad financiera sobre la producción de la clínica |

---

## 3. PROPUESTA TÉCNICA

### 3.1 Módulo 1: Portal Web de Comercialización y Citas

| Funcionalidad | Descripción |
|---------------|-------------|
| Landing Page Comercial | Sitio web moderno y adaptable a móviles con catálogo de servicios (Ortodoncia, Implantes, Estética), staff médico y casos de éxito |
| Motor de Reservas Online | Funcionalidad integrada que permite al paciente ver disponibilidad real de horarios por especialidad y reservar directamente desde la web |

### 3.2 Módulo 2: Gestión Clínica y Tratamientos

| Funcionalidad | Descripción |
|---------------|-------------|
| Registro y Filiación de Pacientes | Base de datos completa con información personal, antecedentes médicos, alergias y datos de contacto |
| Historia Clínica Digital | Repositorio centralizado con registros cronológicos de atenciones, diagnósticos y notas de evolución |
| Registro de Servicios y Tratamientos | Interfaz para imputar procedimientos realizados (Profilaxis, Curación simple), vinculados automáticamente al historial y cuenta corriente |

### 3.3 Módulo 3: Gestión Administrativa, Inventarios y Agenda Inteligente

| Funcionalidad | Descripción |
|---------------|-------------|
| Control de Inventarios e Insumos Médicos | Módulo especializado para gestión logística |
| Kardex Digital | Registro de entradas y salidas de materiales dentales (resinas, guantes, adhesivos) |
| Alertas de Stock Mínimo | Notificaciones automáticas cuando insumo crítico está por agotarse |
| Gestión de Proveedores | Base de datos de proveedores para reabastecimiento |
| Agenda Médica Unificada | Calendario visual que consolida citas web y presenciales/telefónicas |
| Control de Caja y Pagos | Registro de pagos (Efectivo, Tarjeta, Yape/Plin) asociados a tratamientos |
| Recordatorios de Cita | Notificaciones por correo electrónico para reducir ausentismo |

### 3.4 Módulo 4: Gestión Documental y Repositorio

| Funcionalidad | Descripción |
|---------------|-------------|
| Expediente Digital | Capacidad de adjuntar archivos (radiografías digitales, resultados de laboratorio, consentimientos informados) |
| Almacenamiento en Nube | Documentación guardada en servicio seguro y escalable, accesible solo por personal autorizado |

### 3.5 Infraestructura Tecnológica

| Componente | Especificación |
|------------|----------------|
| Procesamiento | 4 Núcleos (vCPU) de alto rendimiento |
| Memoria | 8 GB de RAM |
| Almacenamiento | 160 GB SSD (NVMe) para base de datos clínica |

### 3.6 Seguridad y Respaldo

| Medida | Descripción |
|--------|-------------|
| Cifrado SSL | Conexión segura (HTTPS) para proteger datos en tránsito |
| Backups Automáticos | Copias de seguridad diarias almacenadas en ubicación externa |
| Acceso por Roles | Sistema de permisos: Administrador, Doctor, Recepción |

### 3.7 Costos de Almacenamiento en Nube (Cloudflare R2)

| Capacidad | Costo Anual (USD) | Archivos Aproximados |
|-----------|-------------------|---------------------|
| 100 GB | $18.00 USD | ~30,000 - 50,000 archivos |
| 500 GB | $90.00 USD | ~150,000 - 250,000 archivos |
| 1 TB | $180.00 USD | ~300,000 - 500,000 archivos |
| 2 TB | $360.00 USD | ~600,000 - 1M archivos |

**Nota:** No cobra por salida de datos (egress).

---

## 4. SERVICIOS COMPLEMENTARIOS

### 4.1 Capacitación Especializada
Programa práctico dirigido al personal de SALUDENTS PERU E.I.R.L.

### 4.2 Soporte Técnico y Acompañamiento
- Duración: 3 meses después de implementado
- Incluye: Monitorización de infraestructura, actualizaciones de seguridad, asistencia ante incidencias
- Gestión mediante sistema de tickets

### 4.3 Infraestructura en la Nube
- Provisión y configuración del servidor
- Hosting y servicios necesarios para primer año
- Certificados de seguridad (SSL) incluidos

---

## 5. METODOLOGÍA Y FASES DEL PROYECTO

Metodología: **Ágil (Scrum)** con entregables funcionales cada 3-4 semanas (Sprints)

| Fase | Descripción | Duración |
|------|-------------|----------|
| **Fase 1:** Análisis y Diseño | Definición de identidad visual, flujos de atención, prototipos UX/UI, estructura de Historia Clínica | Mes 1 |
| **Fase 2:** Desarrollo Portal Comercial | Landing Page, catálogo de servicios, motor de reservas integrado a base de datos | Mes 2-3 |
| **Fase 3:** Sistema de Gestión Clínica | Historia Clínica, Filiación, Tratamientos, Agenda Unificada, Control de pagos, Inventarios | Mes 4-5 |
| **Fase 4:** Integración y Pruebas | Pruebas de flujo completo (Reserva Web → Agenda → Atención → Pago), ajustes de seguridad | Mes 5 |
| **Fase 5:** Capacitación y Cierre | Capacitación a doctores y personal, Go-Live, entrega de manuales y credenciales | Mes 5 |

**Duración Total: 5 Meses**

---

## 6. PROPUESTA ECONÓMICA

| Entregable | Descripción | Monto (S/) |
|------------|-------------|------------|
| 1 | Portal Web de Comercialización y Citas Online - Diseño y desarrollo con motor de reservas integrado | 18,000.00 |
| 2 | Plataforma de Gestión Clínica y Administrativa - Historia Clínica, tratamientos, inventarios, agenda, control de caja | 23,000.00 |
| 3 | Capacitación y Transferencia de Conocimiento | Incluido |
| 4 | Infraestructura, Soporte y Mantenimiento (3 meses post-implementación) | Incluido |
| **TOTAL** | | **S/ 41,000.00** |

### Condiciones
- **Validez:** 30 días
- **IGV:** Incluido
- **Propiedad:** La plataforma y base de datos de pacientes son propiedad exclusiva de SALUDENTS PERU E.I.R.L.
- **Sin Licencias:** No hay cobro mensual por usuario
- **Infraestructura:** Servidor cubierto por el primer año

### Forma de Pago
| Hito | Porcentaje | Condición |
|------|------------|-----------|
| Inicio | 40% | Firma del contrato y aprobación del plan de trabajo |
| Avance | 30% | Entrega funcional de módulos clave e integración |
| Final | 30% | Conformidad final, capacitación y cierre del proyecto |

---

## 7. ENTREGABLES

- ✅ Portal Web Comercial operativo con citas en línea
- ✅ Plataforma de Gestión Clínica (Historia + Tratamientos)
- ✅ Módulo de Agenda y Pagos configurado
- ✅ Manuales de Usuario y Personal Capacitado
- ✅ 01 informe parcial a los 2 meses
- ✅ 01 informe final evidenciando logros
- ✅ 01 informe de madurez Digital
