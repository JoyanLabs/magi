---
id: REUN-001
title: "Reunión de Levantamiento de Requerimientos - Saludents Peru"
type: reunion
version: "1.0.0"
fecha: 2024-01-10
cliente: "Saludents Peru E.I.R.L."
estado: activo
---

# RESUMEN DE REUNIÓN

## Información General

| Campo | Detalle |
|-------|---------|
| **Cliente** | Saludents Peru E.I.R.L. |
| **Ubicación** | Av. Collasuyo Nro. 3319, Marcavalle – Cusco |
| **Antigüedad** | 25 años |
| **Sistema Actual** | GemaSoft (solo ingresos y gastos) |

---

## 1. SISTEMA ACTUAL

### 1.1 GemaSoft
- **Funcionalidad:** Solo gestiona ingresos y gastos
- **Parámetros de consulta:** Por fechas, doctor, especialidad, ingresos y gastos
- **Exportación:** Disponible en Excel
- **Decisión:** Migrar a sistema completo e integral

---

## 2. DATOS DE PACIENTES

### 2.1 Información Registrada
- Nombre
- Apellido
- Número de DNI
- Fecha de nacimiento
- Lugar de nacimiento
- Ocupación
- Alergias

### 2.2 Categorización de Pacientes

| Categoría | Descripción |
|-----------|-------------|
| **Potencial** | Paciente nuevo que inicia con la clínica |
| **Fidelizado** | Paciente constante que siempre asiste |
| **Intermedio** | Paciente que asiste ocasionalmente |

### 2.3 Sistema de Recomendaciones
- Pacientes pueden recomendar a otros pacientes
- El paciente recomendador recibe beneficios

---

## 3. GESTIÓN DE CITAS

### 3.1 Canales Actuales
| Canal | Estado |
|-------|--------|
| Llamadas telefónicas | Principal |
| Mensajes de texto | Secundario |
| Presencial | Ocasional |
| Reserva web | **Por implementar** |

### 3.2 Estados de Citas

| Estado | Descripción |
|--------|-------------|
| Pendiente | Reserva realizada, sin confirmar |
| Confirmada | Confirmada telefónicamente |
| Cancelada | Cancelada por teléfono o por inasistencia (15-20 min) |
| En espera | Paciente presente, esperando atención |

### 3.3 Funcionalidades Solicitadas
- Reserva web con selección de especialidad y doctor
- Recordatorios por mensaje
- Registro de historial de cancelaciones por paciente
- Agenda visual por doctor con filtrado

---

## 4. HISTORIA CLÍNICA

### 4.1 Estructura del Acto Médico

| Sección | Descripción |
|---------|-------------|
| Motivo de consulta | Dolor, chequeo general, etc. |
| Antecedentes | Historial médico del paciente |
| Odontograma | Revisión detallada pieza por pieza |
| Diagnóstico | Profilaxis, curaciones, radiografías, etc. |

### 4.2 Documentación Adicional

| Tipo | Estado |
|------|--------|
| Fotografías antes/después | **Por implementar** |
| Radiografías digitales | **Por implementar** (actualmente en CD físico) |
| Consentimientos informados | Por tratamiento (Ortodoncia, Endodoncia, Rehabilitación, Implantes) |

### 4.3 Consentimientos Informados Requeridos
- Consentimiento general (historia clínica)
- Consentimiento para Ortodoncia
- Consentimiento para Endodoncia
- Consentimiento para Rehabilitación
- Consentimiento para Implantes
- Acta de conformidad (al finalizar tratamiento)

---

## 5. PROCESO DE COBROS

### 5.1 Flujo
1. Doctor indica tratamientos en historia clínica
2. Recepción recibe la historia con indicaciones
3. Recepción calcula costos por fase de tratamiento
4. Paciente recibe información (no se da copia, solo cotización si la pide)

### 5.2 Catálogo de Servicios
- Lista de precios definida
- Descuentos por categoría de paciente
- Campañas promocionales (ej: Día de los Enamorados, Día de la Madre)

### 5.3 Descuentos
| Tipo | Descripción |
|------|-------------|
| Por categoría | Aplicado según tipo de paciente |
| Por campaña | Porcentaje variable (5%, 10%, etc.) |
| Por volumen | Ej: 5 tratamientos = 10% descuento |

### 5.4 Métodos de Pago
- Efectivo
- Tarjeta
- Yape/Plin

---

## 6. STAFF MÉDICO

### 6.1 Especialistas

| Especialidad | Cantidad | Tipo |
|--------------|----------|------|
| Odontopediatra | 1 | Permanente |
| Odontología General | 2 | Permanente |
| Rehabilitadora | 2 | Permanente |
| Ortodoncista | 2 | Permanente |
| Endodoncista | 1 | Permanente |
| Implantólogo | 1 | Por visita (solo casos especiales) |
| Periodoncista | 1 | Por visita (solo casos especiales) |

### 6.2 Flujo de Atención
1. Paciente nuevo → Atención por odontología general/odontopediatría
2. Diagnóstico → Referencia a especialidad correspondiente
3. Paciente fidelizado → Puede agendar directamente con especialista

---

## 7. INFRAESTRUCTURA FÍSICA

- **Ubicación:** Segundo nivel (primer nivel alquilado)
- **Áreas:** Consultorios, recepción, sala de espera
- **Proyección:** Expansión de ambientes en los próximos años

---

## 8. REQUERIMIENTOS IDENTIFICADOS

### 8.1 Prioritarios
- [ ] Portal web comercial con catálogo de servicios
- [ ] Sistema de reservas en línea
- [ ] Historia clínica digital
- [ ] Agenda médica unificada
- [ ] Control de citas y recordatorios
- [ ] Gestión de cobros y pagos
- [ ] Sistema de inventario

### 8.2 Secundarios
- [ ] Almacenamiento de fotografías clínicas
- [ ] Adjuntar radiografías digitales
- [ ] Consentimientos informados digitales
- [ ] Sistema de recomendaciones entre pacientes
- [ ] Descuentos por campañas promocionales

---

## 9. NOTAS ADICIONALES

- La clínica trabaja con laboratorio externo para radiografías (envío virtual mediante links)
- El sistema actual (GemaSoft) puede exportar datos en Excel
- Se requiere mantener respaldos de toda la información clínica
- Acceso debe ser por roles (Administrador, Doctor, Recepción)

---

## 10. ASISTENTES

| Rol | Descripción |
|-----|-------------|
| Orador 1 | Consultor / Analista de requisitos |
| Orador 2 | Representante de Saludents |
| Orador 3 | Asistente adicional |
