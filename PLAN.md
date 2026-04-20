# MAGI — Plan de Implementación

> El Sistema Operativo de Ecosistema Comunitario — Roadmap basado en Teoría de Juegos

---

## Filosofía de Diseño

MAGI se construye sobre tres pilares de Teoría de Juegos aplicados a un ecosistema económico:

1. **Cooperación emergente** — Las reglas del sistema hacen que cooperar sea la estrategia dominante a largo plazo, tanto para miembros individuales como para proyectos completos
2. **Perdón estructurado** — Generous Tit for Tat previene espirales de venganza por "ruido" (malentendidos, errores, información incompleta)
3. **Redención codificada** — La reputación se recupera con acciones verificables, no con promesas
4. **Rueda de Valor** — Cada vuelta del ciclo (Proyectos → Ejecución → Ganancia → Reinversión → Automatización) fortalece todo el ecosistema

---

## Matriz de Puntos Actualizada

| Eje | Acción | Puntos |
|-----|--------|--------|
| `Technical` | PR aprobado | +10 |
| `Technical` | Code review significativo | +5 |
| `Technical` | Arquitectura propuesta y adoptada | +30 |
| `Technical` | Bug crítico corregido | +15 |
| `Strategic` | Roadmap aprobado por comunidad | +25 |
| `Strategic` | Branding/posicionamiento implementado | +20 |
| `Stewardship` | Presupuesto gestionado exitosamente | +20 |
| `Stewardship` | Infraestructura nueva o mejorada | +25 |
| `Community` | Mentoría exitosa documentada | +15 |
| `Community` | Mediación de conflicto resuelta | +20 |
| `Community` | Onboarding de nuevo miembro | +10 |
| `Architecture` | Nuevo agente diseñado e implementado | +50 |
| `Architecture` | MCP creado e integrado | +40 |
| `Architecture` | Mejora de infraestructura de MAGI | +30 |
| `Entrepreneurship` | Lanzamiento de nuevo proyecto comunitario | +100 |
| `Entrepreneurship` | Inyección de liquidez al ecosistema | +50 |
| `Entrepreneurship` | Conexión con oportunidad externa | +30 |

---

## Fase 0 — Roles y Protección Comunitaria

**Objetivo:** Formalizar los roles del ecosistema, definir reputación multidimensional (6 ejes) e implementar mecanismos de protección contra dinámicas problemáticas.

### Componentes

#### Reputación Multidimensional (6 Ejes)

| Eje | Rol | Qué se mide |
|-----|-----|-------------|
| `Technical` | Desarrollador / Arquitecto | PRs, code review, arquitectura, deuda técnica |
| `Strategic` | Líder Estratégico / Visionario | Roadmap, branding, posicionamiento, visión de producto |
| `Stewardship` | Steward / Patrono / Financiero | Presupuesto, infraestructura, sostenibilidad, recursos |
| `Community` | Mentor / Mediador / Facilitador | Mentoría, mediación, onboarding, cohesión |
| `Architecture` | Arquitecto de Agentes | Diseño/mejora de MAGI, agentes, infraestructura de automatización |
| `Entrepreneurship` | Emprendedor / Conector | Proyectos nuevos, liquidez inyectada, conexiones externas |

- Cada eje se calcula con métricas propias y decaimiento temporal independiente
- No existe un "score total": un miembro puede ser `Technical: 95, Entrepreneurship: 10`
- Las decisiones de gobernanza requieren quórum en el eje relevante

#### Checks and Balances entre Ejes

- **Veto Estratégico:** El rol con mayor `Strategic` puede vetar decisiones técnicas que comprometan la visión del producto
- **Veto Financiero:** El rol con mayor `Stewardship` puede vetar decisiones estratégicas que comprometan la sostenibilidad
- **Veto Comunitario:** El rol con mayor `Community` activa revisión obligatoria ante impacto negativo documentado
- **Veto Arquitectónico:** El rol con mayor `Architecture` puede vetar cambios que comprometan la integridad de la infraestructura de agentes
- **Sobreescritura:** Los vetos pueden ser sobreescritos por quórum cualificado (2/3) de los ejes combinados

#### Proveedores Externos

- Rol transaccional sin derecho a voto ni gobernanza
- Reputación binaria: cumple o no cumple
- Contratos documentados con entregables verificables

### Casos Humanos Complejos

#### El Desarrollador Reticente (Miedo a explotar)

**Mecanismos:**
- **Atribución Inmutable:** Autoría registrada automáticamente, forks citan al autor original
- **Forking Rights:** Bifurcación manteniendo autoría sin obligación de cooperar
- **Credit Splitting:** PRs co-creados suman reputación para todos los contribuyentes

#### La Estrella Técnica (Burnout / Sobrecarga)

**Mecanismos:**
- **Mentorship Tax:** Para mantener status "Senior" en `Technical`, se requiere score mínimo en `Community`
- **Degrado de Dependencia:** Detección automática si >60% de contribuciones activas vienen de una persona
- **Credit Splitting:** Gana reputación `Community` por mentorizar, reduciendo presión individual

#### El Desarrollador Racional (Free rider)

**Mecanismos:**
- **Contribución Mínima Configurada:** Umbral mínimo para mantener privilegios de voto
- **Reputación Comunitaria como Red de Seguridad:** Miembros con alto `Community` pueden prestar reputación temporalmente

### Entregables

- [ ] Módulo `roles/` con definición de perfiles multidimensionales (6 ejes)
- [ ] Sistema de atribución inmutable con registro de autoría
- [ ] Motor de forking rights con gestión de líneas de desarrollo
- [ ] Mecanismo de mentorship tax con decaimiento condicional
- [ ] Detector automático de dependencia de contribuidor único
- [ ] Sistema de credit splitting para PRs co-creados
- [ ] Tests de simulación de casos humanos complejos

---

## Fase 1 — Governing Engine

**Objetivo:** Implementar el motor central de decisiones basado en estrategias de Teoría de Juegos.

### Componentes

- **Tit for Tat Engine** — Estrategia base: cooperar en primera interacción, replicar acción anterior
- **Generous Tit for Tat** — Parámetro de perdón configurable (default: ~10-15%), previene espirales de venganza
- **Simulador de Estrategias** — Validar que Generous Tit for Tat domina en entornos ruidosos

### Entregables

- [ ] Módulo `governing-engine/` con implementación de estrategias
- [ ] Tests de simulación con torneos repetidos
- [ ] Documentación de decisiones de diseño
- [ ] Configuración por defecto de parámetros

---

## Fase 2 — Sistema de Puntos

**Objetivo:** Sistema de reputación dinámico con redención, donde la confianza se construye y recupera con acciones verificables.

### Componentes

- **Score Dinámico** — Puntuación basada en historial de acciones con decaimiento temporal
  - Fórmula: `score = Σ(action_value × time_decay^n)`
- **Mecanismos de Redención** — Acciones verificables que restauran reputación, sin redención automática
- **Integración con Governing Engine** — Scores afectan el peso de interacciones y privilegios de voto
- **Flywheel Tracker** — Seguimiento de cada vuelta de la Rueda de Valor (proyectos iniciados, liquidez generada, inversión en automatización)

### Entregables

- [ ] Módulo `reputation/` con cálculo de scores por eje
- [ ] Base de datos de historial de acciones
- [ ] API de redención con verificación
- [ ] Tests de decaimiento temporal y recuperación
- [ ] Módulo `flywheel/` con tracking de valor generado

---

## Fase 3 — Integración de Proyectos (The Hub)

**Objetivo:** Gestionar proyectos comunitarios como el núcleo del ecosistema, conectando iniciativa, ejecución y reinversión.

### Visión

Los proyectos son el motor económico del ecosistema. Cada proyecto representa una vuelta de la Rueda de Valor: alguien trae una iniciativa (liquidez + idea), la comunidad ejecuta, se genera valor, y parte de ese valor se reinvierte en MAGI.

### Componentes

#### Gestión de Proyectos

- **Registro de Proyectos:** Cada proyecto se registra con su líder, objetivos, aporte inicial y estado
- **Equipo del Proyecto:** Asignación de miembros basado en reputación relevante (ej: `Technical` para desarrollo, `Strategic` para branding)
- **Hitos y Entregables:** Seguimiento de progreso con checkpoints verificables
- **Cierre y Valor Generado:** Al completar, se registra el valor generado (ingresos, código, impacto)

#### Seguimiento de Liquidez y Aportes

- **Pool de Liquidez:** Registro de aportes financieros y no financieros de cada miembro
- **Distribución de Valor:** Al generar valor, se distribuye automáticamente según las reglas del proyecto y del ecosistema
- **Reinversión Automática:** Un porcentaje del valor generado se redirige a la Fase 4 (Herramientas/Agentes)
- **Transparencia:** Dashboard de liquidez visible para todos los miembros

#### Integración con la Rueda de Valor

```
Proyecto Nuevo (Entrepreneurship +100)
    ↓
Aportes Iniciales (Stewardship +50, Entrepreneurship +50)
    ↓
Ejecución por Comunidad (Technical +10/PR, Community +15/mentoría)
    ↓
Valor Generado Registrado
    ↓
Distribución:
  - 60% → Equipo del proyecto
  - 20% → Pool de liquidez del ecosistema
  - 20% → Reinversión en MAGI (Architecture +30-50)
```

### Entregables

- [ ] Módulo `projects/` con gestión de proyectos comunitarios
- [ ] Sistema de registro de liquidez y aportes
- [ ] Motor de distribución de valor generado
- [ ] Dashboard de la Rueda de Valor
- [ ] Tests de flujos de proyecto completo (inicio → ejecución → cierre)

---

## Fase 4 — Ecosistema de Herramientas (MCPs/Agentes)

**Objetivo:** Crear agentes especializados y MCPs que automatizen flujos del ecosistema, escalando la capacidad sin escalar la fricción humana.

### Visión

La reinversión de la Rueda de Valor alimenta la creación de herramientas. Cada vuelta del ciclo genera recursos para construir agentes más inteligentes y MCPs más poderosos. Esto reduce la carga manual en la comunidad y permite ejecutar más proyectos con menos fricción.

### Componentes

#### Agentes Especializados

- **Agente de Branding:** Asiste al rol `Strategic` en desarrollo de identidad visual, copy y posicionamiento de proyectos
- **Agente de Code Review:** Asiste al rol `Technical` en revisión automatizada de calidad, patrones y deuda técnica
- **Agente de Stewardship:** Asiste al rol `Stewardship` en seguimiento de presupuesto, forecasting y alertas de sostenibilidad
- **Agente de Onboarding:** Asiste al rol `Community` en onboarding automatizado de nuevos miembros, con personalización basada en su perfil de reputación

Cada agente se diseña e implementa con **+50 puntos de reputación `Architecture`** para su creador.

#### MCPs (Model Context Protocols)

- **MCP de Git/GitHub:** Integración con repositorios para monitoreo automático de PRs, issues y métricas de contribución
- **MCP de Pagos/Finanzas:** Integración con pasarelas de pago para seguimiento de liquidez y distribución de valor
- **MCP de Comunicación:** Integración con canales de comunicación (Discord, Slack) para monitoreo de actividad comunitaria
- **MCP de Proyectos:** Integración con herramientas de gestión (Linear, Notion, GitHub Projects) para seguimiento de hitos

Cada MCP creado e integrado otorga **+40 puntos de reputación `Architecture`** para su creador.

#### Infraestructura de Agentes

- **Agente Registry:** Catálogo de agentes disponibles, sus capacidades y reputación del creador
- **Agent Communication Bus:** Protocolo para que los agentes hablen entre sí y con MAGI Core
- **Agent Sandbox:** Entorno seguro para probar nuevos agentes antes de desplegarlos en producción

### Entregables

- [ ] Módulo `agents/` con framework de agentes especializados
- [ ] Agente de Branding implementado
- [ ] MCP de Git/GitHub implementado
- [ ] MCP de Pagos/Finanzas implementado
- [ ] Agent Registry con catálogo y descubrimiento
- [ ] Agent Communication Bus con protocolo definido
- [ ] Tests de integración de agentes con MAGI Core

---

## Fase 5 — Automatización Total

**Objetivo:** Hermes como sensor permanente del ecosistema, cerrando el ciclo de la Rueda de Valor con monitoreo en tiempo real y respuestas automáticas.

### Visión

Hermes es el sistema nervioso del ecosistema. Mientras MAGI Core es el cerebro que decide, Hermes es lo que ve, escucha y siente. Juntos, forman un sistema autónomo que monitorea, alerta y actúa — reduciendo la fricción humana al mínimo y permitiendo que la comunidad se enfoque en lo que mejor hace: crear valor.

### Componentes

#### Hermes — El Sensor

- **Monitoreo en Tiempo Real:** Escucha todos los canales (Git, Discord, MCPs, proyectos) y detecta eventos relevantes
- **Alertas Inteligentes:** Genera alertas basadas en patrones, no en reglas estáticas. Detecta burnout, conflictos, oportunidades
- **Event Stream:** Publica eventos normalizados que MAGI Core consume para tomar decisiones
- **Health Checks:** Monitorea la salud del ecosistema (participación, liquidez, progreso de proyectos, reputación)

#### MAGI Core — El Cerebro Automático

- **Reglas Adaptativas:** MAGI ajusta sus propias reglas basándose en datos de Hermes (no requiere votación manual para ajustes menores)
- **Respuestas Automatizadas:** Acciones automáticas para eventos comunes (ej: si un miembro baja de umbral → notificación automática de mentoría)
- **Flywheel Optimizer:** Analiza la eficiencia de la Rueda de Valor y sugiere optimizaciones

#### Ciclo Cerrado

```
Hermes detecta evento → MAGI analiza → MAGI decide → Acción automática → Hermes verifica → MAGI ajusta
```

### Entregables

- [ ] Módulo `hermes/` con sensor de monitoreo en tiempo real
- [ ] Event stream normalizado con todos los tipos de eventos del ecosistema
- [ ] Motor de reglas adaptativas en MAGI Core
- [ ] Sistema de respuestas automatizadas configurables
- [ ] Flywheel Optimizer con análisis de eficiencia
- [ ] Dashboard de automatización y salud del ecosistema

---

## Arquitectura Técnica

```
┌─────────────────────────────────────────────────────────────────────┐
│                        MAGI ECOSYSTEM                                │
│                                                                      │
│  ┌──────────────────┐    ┌──────────────────┐    ┌───────────────┐  │
│  │     Hermes       │    │   MAGI Core      │    │   Proyectos   │  │
│  │   (Sensor)       │    │   (Cerebro)      │    │     (Hub)     │  │
│  │                  │    │                  │    │               │  │
│  │ ┌──────────────┐ │    │ ┌──────────────┐ │    │ ┌───────────┐ │  │
│  │ │ Event        │ │    │ │ Governing    │ │    │ │ Project   │ │  │
│  │ │ Collectors   │ │◄───►│ │ Engine       │ │◄───►│ │ Manager   │ │  │
│  │ │ (Git, Discord│ │    │ │ (Tit for Tat │ │    │ │ (Liquidez │ │  │
│  │ │  MCPs, APIs) │ │    │ │  + Reputation│ │    │ │  + Valor) │ │  │
│  │ └──────┬───────┘ │    │ │  + Flywheel) │ │    │ └────┬──────┘ │  │
│  │        │         │    │ └──────┬───────┘ │    │    │       │  │
│  │ ┌──────▼───────┐ │    │ ┌──────▼───────┐ │    │ ┌──▼───────┐ │  │
│  │ │ Pattern      │ │    │ │ Policy      │ │    │ │ MCP      │ │  │
│  │ │ Detection    │ │    │ │ Layer       │ │    │ │ Gateway  │ │  │
│  │ │ (Alerts,     │ │    │ │ (Voting,    │ │    │ │ (Git,    │ │  │
│  │ │  Health      │ │    │ │  Ostrom,    │ │    │ │  Payments│ │  │
│  │ │  Checks)     │ │    │ │  Adaptive   │ │    │ │  Comms)  │ │  │
│  │ └──────────────┘ │    │ │  Rules)     │ │    │ └──────────┘ │  │
│  └────────┬─────────┘    └──────┬───────┘    └──────┬────────┘  │
│           │                     │                   │             │
│           └──────────┬──────────┼───────────────────┘             │
│                      │          │                                  │
│           ┌──────────▼──────────▼──────────────────┐              │
│           │        Agent Communication Bus          │              │
│           │   (Agent Registry + Inter-Agent Protocol)│              │
│           │                                          │              │
│           │  ┌──────────┐  ┌──────────┐  ┌────────┐ │              │
│           │  │ Branding │  │ Code     │  │Steward-│ │              │
│           │  │ Agent    │  │ Review   │  │ship     │ │              │
│           │  │          │  │ Agent    │  │ Agent   │ │              │
│           │  └──────────┘  └──────────┘  └────────┘ │              │
│           └──────────────────────────────────────────┘              │
│                                                                      │
│  ┌────────────────────────────────────────────────────────────────┐  │
│  │                  Community Interface                           │  │
│  │  - Flywheel Dashboard  - Transparency Log  - Member Profiles   │  │
│  └────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────┘
```

### Flujo de Datos

1. **Hermes** captura eventos de todos los canales (Git, Discord, MCPs, proyectos)
2. **Pattern Detection** analiza eventos en busca de patrones relevantes (burnout, oportunidades, conflictos)
3. **Event Stream** normaliza y publica eventos al bus de comunicación
4. **MAGI Core** consume eventos, actualiza reputación, ejecuta governing engine y aplica reglas adaptativas
5. **Agentes Especializados** intervienen en flujos específicos (branding, code review, stewardship)
6. **Proyectos (Hub)** gestionan liquidez, valor generado y reinversión en la Rueda de Valor
7. **Community Interface** expone todo para transparencia y participación

---

## Integración entre Fases

```
Fase 0: Roles y Protección Comunitaria
    ↓ (define perfiles multidimensionales — 6 ejes)
Fase 1: Governing Engine
    ↓ (provece scores de cooperación por eje)
Fase 2: Sistema de Puntos
    ↓ (provece reputación para ponderación + Flywheel Tracker)
Fase 3: Integración de Proyectos (The Hub)
    ↓ (conecta iniciativa → ejecución → ganancia → reinversión)
Fase 4: Ecosistema de Herramientas
    ↓ (agentes especializados + MCPs escalan la capacidad)
Fase 5: Automatización Total
    ↓ (Hermes cierra el ciclo con monitoreo en tiempo real)
```

Cada fase construye sobre la anterior. Sin roles definidos, no tiene sentido calcular reputación. Sin reputación, no tiene sentido ponderar votos. Sin proyectos gestionados, no hay valor que reinvertir. Sin agentes y MCPs, la escala está limitada por la fricción humana. Sin Hermes, el sistema no puede ser verdaderamente autónomo.

---

## Validación y Testing

### Simulaciones de Teoría de Juegos
- Torneos repetidos entre estrategias (Tit for Tat, Generous Tit for Tat, All-C, All-D, Random, Grudger)
- Medir cooperación a largo plazo en entornos con ruido
- Validar que Generous Tit for Tat es óptimo con >10% de error

### Simulaciones de Gobernanza
- Simular comunidades de 10-1000 miembros
- Probar resistencia a ataques de spam, colusión, degradación
- Validar que los principios de Ostrom previenen la tragedia de los comunes

### Simulaciones de la Rueda de Valor
- Simular ciclos completos: proyecto nuevo → ejecución → valor → reinversión
- Validar que la reinversión en automatización mejora la eficiencia de futuras vueltas
- Medir impacto de agentes y MCPs en la fricción del ecosistema

### Tests de Integración
- Flujo completo: acción → reputación → governing decision → quality gate → governance rule → flywheel update
- Casos edge: redención, sanciones, conflictos, burnout detection
- Flujo Hermes→MAGI→Proyectos: evento detectado → decisión → acción → verificación

---

**Versión:** 1.0.0
**Última actualización:** 2026-04-19
**Ecosistema:** Joyan
