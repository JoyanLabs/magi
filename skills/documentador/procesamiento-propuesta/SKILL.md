---
name: procesamiento-propuesta
description: >
  Optimiza la Propuesta Comercial a formato Markdown AI-Ready.
  Trigger: Cuando se crea o actualiza una propuesta comercial para el cliente.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Procesando propuesta comercial"
allowed-tools: Read, Edit, Write, notebooklm_*, question
---

## Propósito

La Propuesta Comercial es el documento que presenta la solución al cliente. Este skill la optimiza para:
1. Mantener registro de lo que se ofreció al cliente
2. Comparar con el contrato final (detectar cambios)
3. Consultar funcionalidades comprometidas

---

## Cuándo Usar Este Skill

- Cuando se crea una nueva propuesta comercial
- Cuando se modifica una propuesta (nueva versión)
- Cuando se necesita consultar qué se ofreció al cliente

---

## Pasos de Procesamiento

### 1. Análisis de la Propuesta

**Identificar:**
- Solución propuesta (overview)
- Módulos incluidos
- Tecnología recomendada
- Cronograma propuesto
- Inversión/Presupuesto
- Condiciones de pago
- Validez de la propuesta
- Versión de la propuesta

### 2. Extracción de Información

```
| Sección | Información Extraída |
|---------|---------------------|
| Solución | {Descripción de la solución} |
| Módulos | {Lista de módulos} |
| Tecnología | {Stack tecnológico} |
| Cronograma | {Fechas de inicio/fin} |
| Inversión | {Monto total} |
| Condiciones | {Forma de pago} |
| Validez | {Fecha límite} |
```

### 3. Transformación a Markdown

```markdown
---
id: PROP-{codigo}
title: "Propuesta Comercial - {nombre-proyecto}"
type: propuesta
version: "1.0.0"
fecha: {fecha-propuesta}
cliente: {nombre-cliente}
estado: {v1|v2|v3|aprobada|rechazada}
relacion-tdr: {id-tdr}
---

# Propuesta Comercial - {nombre-proyecto}

## Información General

| Campo | Valor |
|-------|-------|
| Cliente | {nombre} |
| Proyecto | {nombre} |
| Fecha | {fecha} |
| Versión | {versión} |
| Estado | {v1/aprobada} |
| TDR Relacionado | {id} |

## Resumen de la Solución

{Descripción breve de la solución propuesta}

## Alcance de la Propuesta

### Módulos Incluidos

| Módulo | Descripción | Prioridad |
|--------|------------|-----------|
| {modulo-1} | {descripción} | Incluido |
| {modulo-2} | {descripción} | Incluido |
| {modulo-3} | {descripción} | Opcional |

### Módulos Excluidos

| Módulo | Razón |
|--------|-------|
| {modulo} | {razón} |

## Tecnología Propuesta

| Componente | Tecnología | Justificación |
|------------|------------|---------------|
| Frontend | {tech} | {razón} |
| Backend | {tech} | {razón} |
| Base de Datos | {tech} | {razón} |
| Hosting | {tech} | {razón} |
| Otros | {tech} | {razón} |

## Cronograma

| Fase | Descripción | Duración | Inicio | Fin |
|------|-------------|----------|--------|-----|
| 1 | {fase 1} | {semanas} | {fecha} | {fecha} |
| 2 | {fase 2} | {semanas} | {fecha} | {fecha} |
| 3 | {fase 3} | {semanas} | {fecha} | {fecha} |

## Inversión

### Resumen

| Concepto | Monto |
|----------|-------|
| Desarrollo | {S/. XXX} |
| Implementación | {S/. XXX} |
| Capacitación | {S/. XXX} |
| **Total** | **{S/. XXX}** |

### Forma de Pago

| Cuota | Condición | Porcentaje | Monto |
|-------|-----------|------------|-------|
| 1 | Inicio del proyecto | 30% | {S/. XXX} |
| 2 | Entrega fase 2 | 40% | {S/. XXX} |
| 3 | Entrega final | 30% | {S/. XXX} |

## Validez de la Propuesta

- **Válida hasta:** {fecha}
- **Condiciones:** {condiciones especiales}

## Supuestos

- {Supuesto 1}
- {Supuesto 2}

## Notas

{Notas adicionales}

---

## Comparación con TDR

| Aspecto | TDR | Propuesta | Diferencia |
|---------|-----|-----------|------------|
| {aspecto} | {del TDR} | {de propuesta} | {diff} |

---

## Metadatos de Control

| Campo | Valor |
|-------|-------|
| Procesado por | Documentador |
| Fecha procesamiento | {fecha-actual} |
| Versión propuesta | {n} |
| Cambios respecto a versión anterior | {descripción} |
```

---

## Ejemplo: Propuesta San Ignacio

### Input (Raw)
```
PROPUESTA 0025-153 - SAN IGNACIO

Cliente: Clínica Dental San Ignacio de Piura
Solución: Sistema de Gestión Clínica con énfasis en reducir ausentismo

Módulos:
1. Gestión de pacientes
2. Odontograma digital
3. Agenda y citas
4. CRM para reducir ausentismo
5. Dashboard

Tech: Nuxt 4 + NestJS + PostgreSQL
Cronograma: 6 meses (Feb-Jul 2026)
Inversión: S/. 45,000 + IGV
```

### Output (Markdown optimizado)

```markdown
---
id: PROP-SANIGNACIO-001
title: "Propuesta Comercial - Sistema de Gestión Clínica"
type: propuesta
version: "1.0.0"
fecha: "2025-11-20"
cliente: "Clínica Dental San Ignacio de Piura"
estado: v1
relacion-tdr: TDR-SANIGNACIO-001
---

# Propuesta Comercial - Sistema de Gestión Clínica

## Información General

| Campo | Valor |
|-------|-------|
| Cliente | Clínica Dental San Ignacio de Piura |
| Proyecto | Sistema de Gestión Clínica |
| Fecha | 2025-11-20 |
| Versión | 1.0.0 |
| Estado | v1 (en negociación) |
| TDR Relacionado | TDR-SANIGNACIO-001 |

## Resumen de la Solución

Desarrollo de un sistema de gestión clínica odontológica integral que permite la administración de pacientes, odontograma digital interactivo, gestión de citas y un módulo CRM orientado a reducir el ausentismo de pacientes mediante seguimiento automatizado.

## Alcance de la Propuesta

### Módulos Incluidos

| Módulo | Descripción | Prioridad |
|--------|------------|-----------|
| Gestión de Pacientes | Registro, historia clínica, datos filiatorios | Incluido |
| Odontograma Digital | Odontograma por superficies con evolución | Incluido |
| Agenda y Citas | Calendario, agendamiento, reprogramación | Incluido |
| CRM - Reducción Ausentismo | Bandejas de seguimiento, alertas, triggers | Incluido |
| Dashboard | KPIs, productividad, ingresos | Incluido |

### Módulos Excluidos

| Módulo | Razón |
|--------|-------|
| App móvil pacientes | No solicitado en TDR |
| Integración con seguros | Fuera de alcance inicial |
| Teleconsulta | No solicitado |

## Tecnología Propuesta

| Componente | Tecnología | Justificación |
|------------|------------|---------------|
| Frontend | Nuxt 4 | Moderno, SSR, SEO friendly |
| Backend | NestJS | Escalable, TypeScript, arquitectura modular |
| Base de Datos | PostgreSQL | Robusta, relacional, libre |
| ORM | Prisma | Type-safe, migraciones fáciles |
| Auth | Better Auth | Open source, completo |

## Cronograma

| Fase | Descripción | Duración | Inicio | Fin |
|------|-------------|----------|--------|-----|
| 1 | Configuración y Base | 2 sem | Feb 2026 | Feb 2026 |
| 2 | Módulos Core (Pacientes, Odontograma) | 4 sem | Mar 2026 | Abr 2026 |
| 3 | Recepción y CRM | 4 sem | Abr 2026 | May 2026 |
| 4 | Dashboard y Cierre | 4 sem | Jun 2026 | Jul 2026 |

## Inversión

### Resumen

| Concepto | Monto |
|----------|-------|
| Desarrollo | S/. 38,000 |
| Implementación | S/. 5,000 |
| Capacitación | S/. 2,000 |
| **Subtotal** | **S/. 45,000** |
| IGV (18%) | S/. 8,100 |
| **Total** | **S/. 53,100** |

### Forma de Pago

| Cuota | Condición | Porcentaje | Monto |
|-------|-----------|------------|-------|
| 1 | Inicio del proyecto | 30% | S/. 13,500 + IGV |
| 2 | Entrega fase 2 | 40% | S/. 18,000 + IGV |
| 3 | Entrega final | 30% | S/. 13,500 + IGV |

## Validez de la Propuesta

- **Válida hasta:** 30 días desde emisión
- **Condiciones:** Sujeto a disponibilidad de recursos

## Supuestos

- El cliente provee acceso a infraestructura necesaria
- Las reuniones de validación se realizan en máximo 5 días hábiles
- No hay cambios de alcance sin aprobación de adicionales

---

## Comparación con TDR

| Aspecto | TDR | Propuesta | Diferencia |
|---------|-----|-----------|------------|
| Odontograma | Mencionado | Por superficies | Mejorado |
| Ausentismo | No mencionado | Módulo CRM | Añadido |
| App móvil | No | No | Coincide |

---

## Metadatos de Control

| Campo | Valor |
|-------|-------|
| Procesado por | Documentador |
| Fecha procesamiento | 2026-02-19 |
| Versión propuesta | 1 |
| Cambios respecto a versión anterior | N/A (primera versión) |
```

---

## Human in the Loop

**SIEMPRE** preguntar antes de indexar:

```markdown
📄 Propuesta Procesada: {nombre-proyecto}

📊 Resumen:
- Versión: {v1/v2/aprobada}
- Módulos incluidos: {n}
- Inversión: {monto}
- Estado: {en negociación/aprobada/rechazada}

⚠️ NOTA: Esta propuesta está en estado "{estado}"
- ¿Deseas continuar con la indexación?

¿ACCIÓN?
1) Indexar en NotebookLM (solo este documento)
2) Indexar + guardar en repositorio (docs/propuestas/)
3) Comparar con versión anterior (si existe)
4) Revisar antes de guardar
5) Cancelar
```

---

## Recursos

- **Template**: Ver [assets/](assets/) para ejemplo completo
- **Skill relacionado**: [optimizacion-md](../optimizacion-md/SKILL.md)
- **Skill relacionado**: [procesamiento-tdr](../procesamiento-tdr/SKILL.md)
- **Siguiente paso**: [procesamiento-diagnostico](../procesamiento-diagnostico/SKILL.md)
