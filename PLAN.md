# MAGI — Plan de Implementación

> Mediador Comunitario de Joyan — Roadmap basado en Teoría de Juegos

---

## Filosofía de Diseño

MAGI se construye sobre tres pilares de Teoría de Juegos:

1. **Cooperación emergente** — Las reglas del sistema hacen que cooperar sea la estrategia dominante a largo plazo
2. **Perdón estructurado** — Generous Tit for Tat previene espirales de venganza por "ruido" (malentendidos, errores)
3. **Redención codificada** — La reputación se recupera con acciones, no con promesas

---

## Fase 0 — Roles y Protección Comunitaria

**Objetivo:** Formalizar los roles comunitarios, definir reputación multidimensional e implementar mecanismos de protección contra dinámicas humanas problemáticas (miedo a explotar, burnout, contribuciones no técnicas).

### Componentes

#### Reputación Multidimensional

Cada miembro tiene cuatro scores independientes que no se agregan en uno solo:

| Eje | Rol | Qué se mide |
|-----|-----|-------------|
| `Technical` | Desarrollador / Arquitecto | PRs, code review, arquitectura, deuda técnica |
| `Strategic` | Líder Estratégico / Visionario | Roadmap, branding, posicionamiento, visión de producto |
| `Stewardship` | Steward / Patrono / Financiero | Presupuesto, infraestructura, sostenibilidad, recursos |
| `Community` | Mentor / Mediador / Facilitador | Mentoría, mediación, onboarding, cohesión |

- Cada eje se calcula con métricas propias y decaimiento temporal independiente
- No existe un "score total": un miembro puede ser `Technical: 95, Community: 15`
- Las decisiones de gobernanza requieren quórum en el eje relevante

#### Checks and Balances entre Roles

- **Veto Estratégico:** El `Strategic Leader` puede vetar decisiones técnicas que comprometan la visión del producto
- **Veto Financiero:** El `Steward` puede vetar decisiones estratégicas que comprometan la sostenibilidad
- **Veto Comunitario:** El rol con mayor `Community` activa revisión obligatoria ante impacto negativo documentado en la comunidad
- **Sobreescritura:** Los vetos pueden ser sobreescritos por quórum cualificado (2/3) de los tres ejes combinados, obligando a negociación y coaliciones

#### Proveedores Externos

- Rol transaccional sin derecho a voto ni gobernanza
- Reputación binaria: cumple o no cumple
- Contratos documentados con entregables verificables
- Contratos mayores a umbral requieren aprobación `Steward` + `Strategic Leader`

---

### Casos Humanos Complejos

MAGI no solo modela agentes racionales abstractos — resuelve problemas reales que aparecen en comunidades de desarrollo:

#### Caso 1: "El Desarrollador Reticente" (Miedo a explotar)

**Problema:** Un desarrollador aporta poco código porque teme que otros se apropien de su trabajo, lo modifiquen sin crédito, o lo usen como base sin compensación. Esto es un dilema clásico de confianza en juegos repetidos: el miedo a ser "el tonto" (sucker) paraliza la cooperación.

**Mecanismo: Atribución Inmutable**
- El código es tuyo para siempre. Si alguien modifica tu contribución, el sistema registra automáticamente la autoría original.
- Los forks o modificaciones requieren citar al autor original con un link al commit/pull request base.
- La reputación `Technical` del modificador se ve afectada negativamente si omite la atribución.
- La reputación `Technical` del autor original se mantiene intacta incluso si otros modifican su código.

**Mecanismo: Forking Rights**
- Si un miembro no está de acuerdo con la dirección que la comunidad toma en su contribución, puede bifurcar (fork) su trabajo.
- El fork mantiene la autoría original y crea una línea de desarrollo independiente.
- La comunidad puede decidir cuál línea adoptar, pero el autor no es obligado a mantener código en contra de su voluntad.
- Esto resuelve el dilema sin necesidad de consenso total: si no podés cooperar, al menos no estás obligado a ser "el tonto".

**Mecanismo: Credit Splitting**
- PRs co-creados suman reputación para todos los contribuyentes, ponderada por aportación.
- El sistema registra quién escribió qué línea (no solo quién hizo commit).
- Esto incentiva la colaboración abierta sin miedo a que otros se apropien del crédito.

#### Caso 2: "La Estrella Técnica" (Burnout / Sobrecarga de Ops)

**Problema:** Un desarrollador excepcional aporta demasiado código, hace toda la arquitectura, y termina quemándose (burnout) porque nadie más puede o quiere asumir la carga. Con el tiempo, este miembro opaca a los demás y la comunidad se vuelve dependiente de una sola persona — un punto único de fallo humano.

**Mecanismo: Mentorship Tax**
- Para mantener o aumentar el status "Senior" en el eje `Technical`, un miembro debe mantener un score mínimo en el eje `Community` (mentoría).
- Si un miembro tiene `Technical: 95` pero `Community: 10`, su score `Technical` comienza a decaer más rápido que el normal.
- La lógica: un desarrollador senior que no forma a otros está extrayendo valor neto de la comunidad a largo plazo.
- El decaimiento acelerado es predecible y transparente: el miembro sabe exactamente qué debe hacer para recuperar su reputación técnica.

**Mecanismo: Credit Splitting (aplicado a código)**
- PRs co-creados suman reputación para ambos contribuyentes.
- La estrella técnica gana reputación `Community` por mentorizar, lo que reduce la presión de tener que hacer todo sola.
- La reputación `Technical` de otros miembros crece al participar, reduciendo la dependencia del sistema en una sola persona.

**Mecanismo: Degrado de Dependencia**
- El sistema detecta automáticamente si una sola persona tiene >60% de las contribuciones `Technical` activas.
- Cuando se activa esta alerta, el sistema recomienda (no impone) redistribuir responsabilidades.
- La redistribución se negocia via collective-choice (Fase 4), pero la alerta es automática e ineludible.

#### Caso 3: "El Desarrollador Racional" (Contribuye poco, usa mucho)

**Problema:** Un miembro consume los frutos del trabajo comunitario sin aportar proporcionalmente. Es racional desde el punto de vista individual (free rider), pero dañino para la cooperación a largo plazo.

**Mecanismo: Contribución Mínima Configurada**
- La comunidad define un umbral mínimo de contribución (en cualquiera de los 4 ejes) para mantener privilegios de voto.
- Si un miembro está por debajo del umbral por un período prolongado, entra en modo "observación": puede leer y participar en mediación, pero no vota en decisiones con impacto en recursos o arquitectura.
- Esto no es punitivo: el miembro puede recuperar privilegios en cualquier momento con una contribución verificable en cualquier eje.

**Mecanismo: Reputación Comunitaria como Red de Seguridad**
- Un miembro con `Community: 80` puede "prestar" parte de su reputación comunitaria para que otros recuperen privilegios temporalmente.
- Esto incentiva a los miembros activos a mentorizar y apoyar a los reticentes, en lugar de simplemente expulsarlos.

---

### Entregables

- [ ] Módulo `roles/` con definición de perfiles multidimensionales
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

- **Tit for Tat Engine**
  - Estrategia base: cooperar en primera interacción, replicar acción anterior
  - Claramente programable para que todos entiendan las reglas
  - Base para relaciones de confianza miembro-miembro

- **Generous Tit for Tat**
  - Parámetro de perdón configurable (default: ~10-15% de perdón)
  - Previene espirales de venganza por ruido en la comunicación
  - Balance entre justicia y preservación de cooperación

- **Simulador de Estrategias**
  - Validar que Tit for Tat generoso domina en entornos ruidosos
  - Probar contra estrategias alternativas (All-C, All-D, Random, Grudger)
  - Ajustar parámetros de perdón basados en resultados

### Entregables

- [ ] Módulo `governing-engine/` con implementación de estrategias
- [ ] Tests de simulación con torneos repetidos
- [ ] Documentación de decisiones de diseño
- [ ] Configuración por defecto de parámetros

---

## Fase 2 — Reputation System

**Objetivo:** Sistema de reputación dinámico con redención, donde la confianza se construye y recupera con acciones.

### Componentes

- **Score Dinámico**
  - Puntuación basada en historial de acciones (no binaria)
  - Decaimiento temporal: acciones antiguas pierden peso
  - Fórmula ponderada: `score = Σ(action_value × time_decay^n)`

- **Mecanismos de Redención**
  - Acciones verificables que restauran reputación
  - Progreso visible y medible hacia la recuperación
  - Sin redención automática — requiere acción demostrada
  - Umbral mínimo para recuperar privilegios

- **Integración con Governing Engine**
  - Scores afectan el peso de interacciones
  - Membresía con reputación baja entra en modo "observación"
  - Reputación alta otorga mayor peso en decisiones colectivas

### Entregables

- [ ] Módulo `reputation/` con cálculo de scores
- [ ] Base de datos de historial de acciones
- [ ] API de redención con verificación
- [ ] Tests de decaimiento temporal y recuperación

---

## Fase 3 — Quality Gates

**Objetivo:** Filtros que aseguran la calidad de propuestas y acciones comunitarias, evitando la degradación del sistema.

### Componentes

- **Entry Gates (Filtros de Entrada)**
  - Validación mínima para nuevas propuestas
  - Verificación de información básica
  - Prevención de spam y propuestas sin fundamento

- **Review Gates (Revisiones por Pares)**
  - Mecanismo de revisión entre miembros
  - Basado en reputación: miembros con mayor reputación tienen más peso
  - Plazos definidos para evitar cuellos de botella

- **Quality Metrics**
  - Métricas de calidad comunitaria (participación, resolución, satisfacción)
  - Dashboard de transparencia con indicadores
  - Alertas tempranas de degradación

### Entregables

- [ ] Módulo `quality-gates/` con entry y review gates
- [ ] Configuración de umbrales mínimos
- [ ] Dashboard de métricas de calidad
- [ ] Tests de flujos de revisión

---

## Fase 4 — Gobernanza Policéntrica (Ostrom)

**Objetivo:** Implementar los 8 principios de Elinor Ostrom para gobernanza de bienes comunes.

### Componentes

- **Límites Claros**
  - Definición de pertenencia a la comunidad
  - Registro de miembros con verificación
  - Mecanismos de incorporación y salida

- **Reglas Proporcionales**
  - Normas adaptadas al contexto local
  - Configurables por la comunidad vía collective-choice
  - Versionado y historial de cambios a reglas

- **Collective-Choice**
  - Mecanismos de votación ponderada por reputación
  - Propuestas de modificación de reglas
  - Quórums y mayorías configurables

- **Monitoreo Mutuo**
  - Logs verificables de todas las acciones
  - Capacidad de cualquier miembro de auditar
  - Herramientas de reporte y alerta

- **Sanciones Graduales**
  - Escalona respuesta al incumplimiento: advertencia → restricción → suspensión → expulsión
  - Proporcional a la severidad y frecuencia
  - Transparente y predecible

- **Resolución de Conflictos Accesible**
  - Mediación interna de bajo costo
  - Plazos definidos para resolución
  - Registro de conflictos y resoluciones

- **Reconocimiento de Derechos**
  - La comunidad reconoce su derecho a organizarse
  - Interfaz con sistemas externos si es necesario
  - Documentación de autonomía

### Entregables

- [ ] Módulo `governance/` con implementación de principios Ostrom
- [ ] Sistema de voting con ponderación por reputación
- [ ] Motor de sanciones graduadas
- [ ] Sistema de mediación y resolución de conflictos
- [ ] Tests de simulación de gobernanza

---

## Fase 5 — Interfaz Comunitaria

**Objetivo:** Exponer los datos del sistema de forma transparente para que cualquier miembro pueda auditar y participar.

### Componentes

- **Transparency Dashboard**
  - Vista de scores de reputación de todos los miembros
  - Historial de acciones y decisiones
  - Estado actual de reglas y propuestas

- **Member Profiles**
  - Perfil con score, historial de redenciones, contribuciones
  - Línea de tiempo de acciones
  - Badges o reconocimientos por contribuciones

- **Action Log**
  - Registro inmutable de todas las acciones relevantes
  - Consulta y filtrado por tipo, miembro, fecha
  - Exportable para auditoría externa

- **Community API**
  - endpoints para consulta de datos comunitarios
  - Webhooks para eventos relevantes
  - Documentación abierta

### Entregables

- [ ] Módulo `interface/` con dashboard y perfiles
- [ ] API REST/GraphQL para consulta comunitaria
- [ ] Action log con consulta y filtrado
- [ ] Tests de integridad de datos

---

## Integración entre Fases

```
Fase 0: Roles y Protección Comunitaria
    ↓ (define perfiles multidimensionales)
Fase 1: Governing Engine
    ↓ (provece scores de cooperación por eje)
Fase 2: Reputation System
    ↓ (provece reputación para ponderación por eje)
Fase 3: Quality Gates
    ↓ (filtra propuestas para gobernanza)
Fase 4: Gobernanza Policéntrica
    ↓ (genera decisiones y reglas)
Fase 5: Interfaz Comunitaria
    ↓ (expone datos para transparencia)
```

Cada fase construye sobre la anterior. Sin roles definidos, no tiene sentido calcular reputación. Sin reputación, no tiene sentido ponderar votos. Sin governing engine, no hay forma de saber qué acciones son positivas o negativas.

---

## Validación y Testing

### Simulaciones de Teoría de Juegos
- Torneos repetidos entre estrategias (Tit for Tat, Generous Tit for Tat, All-C, All-D, Random, Grudger, Two-Tits)
- Medir cooperación a largo plazo en entornos con ruido
- Validar que Generous Tit for Tat es óptimo con >10% de error

### Simulaciones de Gobernanza
- Simular comunidades de 10-1000 miembros
- Probar resistencia a ataques de spam, colusión, degradación
- Validar que los principios de Ostrom previenen la tragedia de los comunes

### Tests de Integración
- Flujo completo: acción → reputación → governing decision → quality gate → governance rule
- Casos edge: redención, sanciones, conflictos

---

**Versión:** 1.0.0
**Última actualización:** 2026-04-19
**Comunidad:** Joyan
