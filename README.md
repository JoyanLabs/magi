# MAGI

> Mediador Comunitario de Joyan — Gobernanza basada en Teoría de Juegos

---

## ¿Qué es MAGI?

MAGI es un mediador comunitario de Joyan diseñado para facilitar la coordinación, resolución de conflictos y gobernanza colectiva. En lugar de imponer decisiones centralizadas, MAGI aplica principios de **Teoría de Juegos** para crear sistemas donde la cooperación emerge de forma natural, los incentivos están alineados y los conflictos se resuelven mediante mecanismos justos y transparentes.

MAGI opera bajo la premisa de que las comunidades son sistemas multi-agente donde cada participante toma decisiones racionales basadas en incentivos — y que, con las reglas adecuadas, la cooperación a largo plazo siempre supera a la traición.

---

## Principios — Teoría de Juegos

### Tit for Tat (Ojo por Ojo)

La estrategia más robusta en dilemas repetidos: cooperar en la primera interacción, luego replicar la acción anterior del otro. Es clara, amable, provocadora e indulgente. MAGI implementa esta lógica como base para relaciones de confianza entre miembros de la comunidad.

### Generous Tit for Tat

Variante del Ojo por Ojo que introduce perdón controlado. En un mundo con "ruido" (malentendidos, errores, información incompleta), el Tit for Tat puro puede entrar en espirales de venganza infinita. Generous Tit for Tat perdona una fracción de las deserciones, rompiendo esos ciclos y preservando la cooperación a largo plazo.

### Sistema de Reputación con Redención

La reputación no es permanente ni binaria. MAGI implementa un sistema de reputación dinámico donde:

- Las acciones positivas y negativas se ponderan en el tiempo
- Los miembros pueden recuperar reputación perdida mediante acciones verificables
- La reputación afecta el peso del voto y la capacidad de propuesta
- La redención está codificada en las reglas, no es discrecional

### Gobernanza Policéntrica (Ostrom)

Inspirado en el trabajo de Elinor Ostrom (Premio Nobel de Economía 2024), MAGI adopta principios de gobernanza de bienes comunes:

1. **Límites claros** — quién pertenece a la comunidad
2. **Reglas proporcionales** — las normas coinciden con las necesidades locales
3. **Collective-choice** — los miembros participan en la modificación de reglas
4. **Monitoreo mutuo** — la vigilancia es recíproca, no jerárquica
5. **Sanciones graduadas** — las respuestas al incumplimiento escalan con la severidad
6. **Resolución de conflictos accesible** — mecanismos de mediación de bajo costo
7. **Reconocimiento de derechos** — la comunidad reconoce su derecho a organizarse

---

## Roles y Dinámicas Comunitarias

### Reputación Multidimensional

La reputación en MAGI no se reduce a una sola métrica. Cada miembro posee un perfil de reputación con cuatro ejes independientes que reflejan contribuciones en dominios distintos:

| Eje | Rol asociado | Qué mide |
|-----|-------------|----------|
| `Technical` | Desarrollador / Arquitecto | Calidad, cantidad y mantenibilidad del código aportado |
| `Strategic` | Líder Estratégico / Visionario | Visión del producto, branding, posicionamiento, roadmap |
| `Stewardship` | Steward / Patrono / Financiero | Gestión de recursos, finanzas, infraestructura, sostenibilidad |
| `Community` | Mentor / Mediador / Facilitador | Mentoría, mediación de conflictos, onboarding, cohesión del grupo |

Cada eje se calcula de forma independiente con sus propios scores, decaimiento temporal y mecanismos de redención. Un miembro puede ser `Technical: 95` y `Community: 20` sin que uno afecte al otro. Esto evita que la dominancia en un área opaque deficiencias en otra.

**Implicación en gobernanza:** Diferentes decisiones requieren diferentes perfiles de reputación. Un cambio de roadmap requiere quórum de reputación `Strategic`. Una decisión de presupuesto requiere quórum de reputación `Stewardship`. Un cambio de arquitectura requiere quórum de reputación `Technical`.

### Checks and Balances

Para prevenir la concentración de poder y los escenarios de explotación, MAGI implementa mecanismos de veto cruzado entre roles:

- **Veto Estratégico:** El `Strategic Leader` (Líder Estratégico) puede vetar decisiones técnicas que comprometan la visión del producto o la experiencia del usuario, incluso si el eje `Technical` aprueba la propuesta.
- **Veto Financiero:** El `Steward` (Patrono/Financiero) puede vetar decisiones estratégicas que comprometan la sostenibilidad financiera o el uso de recursos, incluso si el eje `Strategic` las aprueba.
- **Veto Comunitario:** El rol con mayor reputación en `Community` puede activar una revisión obligatoria cuando una decisión (técnica, estratégica o financiera) genere un impacto negativo documentado en la cohesión o bienestar de la comunidad.

Estos vetos no son absolutos: pueden ser sobreescritos por un quórum cualificado (2/3) de los tres ejes combinados, lo que obliga a negociar y construir coaliciones.

### Proveedores Externos

MAGI reconoce que no todos los participantes son miembros de pleno derecho. El rol de **Contratista/Proveedor** es transaccional:

- Aporta bienes o servicios específicos a cambio de compensación
- **No tiene derecho a voto ni participación en gobernanza**
- Su reputación es binaria: cumple o no cumple (sin acumulación de poder)
- Puede ser contratado por el `Steward` con aprobación del `Strategic Leader` si el monto supera un umbral configurado
- Su relación queda documentada en contratos inmutables con entregables verificables

Este rol existe para resolver el problema de los "free riders" profesionales: quienes consumen recursos comunitarios sin contribuir a su gobernanza ni a su sostenibilidad.

---

## Arquitectura

```
┌─────────────────────────────────────────────────────┐
│                   MAGI CORE                          │
│                                                      │
│  ┌──────────────┐  ┌──────────────┐  ┌───────────┐  │
│  │ Governing    │  │ Reputation   │  │ Quality   │  │
│  │ Engine       │  │ System       │  │ Gates     │  │
│  │              │  │              │  │           │  │
│  │ - Tit for    │  │ - Score      │  │ - Entry   │  │
│  │   Tat logic  │  │ - History    │  │   gates   │  │
│  │ - Forgiveness│  │ - Decay      │  │ - Review  │  │
│  │   rate       │  │ - Redemption │  │   gates   │  │
│  └──────────────┘  └──────────────┘  └───────────┘  │
│                                                      │
│  ┌──────────────────────────────────────────────┐    │
│  │            Policy Layer                       │    │
│  │  - Community rules (Ostrom)                   │    │
│  │  - Voting mechanisms                          │    │
│  │  - Dispute resolution                         │    │
│  └──────────────────────────────────────────────┘    │
│                                                      │
│  ┌──────────────────────────────────────────────┐    │
│  │            Community Interface                │    │
│  │  - Member profiles                            │    │
│  │  - Action log                                 │    │
│  │  - Transparency dashboard                     │    │
│  └──────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────┘
```

### Componentes

- **Governing Engine** — Motor central que aplica estrategias de Teoría de Juegos para tomar decisiones de gobernanza
- **Reputation System** — Sistema de reputación con scores dinámicos, decaimiento temporal y mecanismos de redención
- **Quality Gates** — Filtros de entrada y revisión que aseguran la calidad de las propuestas y acciones comunitarias
- **Policy Layer** — Capa de reglas configurables por la comunidad, basada en los principios de Ostrom
- **Community Interface** — Capa de exposición de datos para transparencia y participación

---

## Roadmap

### Fase 0 — Roles y Protección Comunitaria (Nuevo)
- [ ] Definición de reputación multidimensional (4 ejes)
- [ ] Sistema de checks and balances entre roles
- [ ] Definición del rol de Proveedores Externos
- [ ] Mecanismos de protección contra explotación (atribución inmutable, forking rights)
- [ ] Mentorship Tax para prevenir burnout de contribuidores clave

### Fase 1 — Núcleo de Teoría de Juegos

### Fase 1 — Núcleo de Teoría de Juegos
- [ ] Implementación de Tit for Tat y Generous Tit for Tat
- [ ] Motor de decisiones basado en estrategias repetidas
- [ ] Simulaciones para validar comportamiento

### Fase 2 — Sistema de Reputación
- [ ] Scores dinámicos con decaimiento temporal
- [ ] Mecanismos de redención verificable
- [ ] Integración con privilegios y pesos de voto

### Fase 3 — Quality Gates
- [ ] Filtros de entrada para propuestas
- [ ] Revisiones por pares
- [ ] Métricas de calidad comunitaria

### Fase 4 — Gobernanza Policéntrica
- [ ] Implementación de principios de Ostrom
- [ ] Mecanismos de voting y collective-choice
- [ ] Resolución de conflictos con sanciones graduadas

### Fase 5 — Interfaz Comunitaria
- [ ] Dashboard de transparencia
- [ ] Logs de acciones verificables
- [ ] Perfiles de miembros con historial

---

## Cómo Contribuir

MAGI es un proyecto abierto a la comunidad. Para contribuir:

1. **Entender los principios** — Lee sobre Teoría de Juegos, Tit for Tat, y los principios de Ostrom
2. **Proponer ideas** — Abre un issue describiendo tu propuesta
3. **Implementar** — Trabajá en una feature branch siguiendo las convenciones del proyecto
4. **Documentar** — Cada decisión de diseño debe quedar registrada

Las contribuciones más valoradas son aquellas que fortalecen los principios de cooperación, transparencia y gobernanza justa.

---

**Versión:** 1.0.0
**Comunidad:** Joyan
