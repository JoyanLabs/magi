# Roadmap 2026-05: Engram Cloud + Magi Ecosystem

> Rama: `roadmap-2026-05` | Creado: 2026-04-26
> Estado: 🟡 En planificación

## Visión

Construir un **ecosistema de conocimiento vivo** para JoyanLabs donde:
1. Los devs alimentan una KB compartida con **Engram Cloud**.
2. **Magi** la analiza, puntúa y la usa como contexto para sus decisiones.
3. Se crea un **segundo agente especializado en desarrollo** basado en ese conocimiento.
4. Todo crece de forma autónoma usando la metodología de `autoresearch`.

---

## Fases

### 🔹 Fase 1: Infraestructura Engram Cloud + Onboarding Devs

**Objetivo:** Levantar la base de conocimiento compartida y que los devs de JoyanLabs comiencen a alimentarla.

- [ ] **Provisión de VPS** — elegir specs, región, OS para el servidor de Engram Cloud.
- [ ] **Deploy de Engram Cloud v1.13.1** — runtime + dashboard web.
  - Repo: https://github.com/Gentleman-Programming/engram
  - Release: https://github.com/Gentleman-Programming/engram/releases/tag/v1.13.1
- [ ] **Configuración de Netbird** — VPN para acceso seguro de los devs al dashboard y servicios.
- [ ] **Integración con Gentle AI** — instalar/configurar en los equipos de los devs.
  - Repo: https://github.com/Gentleman-Programming/gentle-ai
  - Incluye: SDD (Software Defined Development), OpenCode, y herramientas de subida a Engram.
- [ ] **Documentación de onboarding para devs** — guía paso a paso:
  - Cómo usar `engram sync` (push/pull).
  - Cómo usar el dashboard cloud.
  - Cómo usar Gentle AI + SDD para estructurar proyectos.
- [ ] **Obsidian Brain beta** — navegación gráfica de la memoria como grafo (incluido en Gentle AI + Engram v1.13).

**Issues relacionados:** `infra: Despliegue Engram Cloud + Netbird para JoyanLabs`

---

### 🔹 Fase 2: Magi + Sistema de Scoring & Reputación

**Objetivo:** Que Magi consuma y analice la KB de Engram Cloud para enriquecer sus decisiones.

- [ ] **MCP/CLI tool para Engram Cloud** — que Magi pueda consultar la API/HTTP de Engram.
- [ ] **Pipeline de ingestión** — Magi escanea nuevas memorias/commits en la KB.
- [ ] **Sistema de puntuación/reputación** (borrador):
  - Métricas iniciales: calidad del código, reutilización de patrones, impacto en proyectos.
  - Algoritmo de scoring: reglas heurísticas → evoluciona a ML.
- [ ] **Magi usa el scoring** para priorizar qué conocimiento usar en sus respuestas/tareas.

**Issues relacionados:** `magi: Integración con Engram Cloud & Sistema de Scoring`

---

### 🔹 Fase 3: Kit de Herramientas + Plantillas de Proyecto + CI/CD

**Objetivo:** Magi como operativo real — que trabaje en los repos de JoyanLabs con herramientas y plantillas estandarizadas.

- [ ] **Plantilla de proyecto** — monorepo con Nuxt (inicial), extensible a otros frameworks según feedback del equipo.
  - Magi trabaja bajo esta plantilla para mantener consistencia.
- [ ] **Skills para Magi** — crear skills que codifiquen las plantillas y workflows del equipo.
- [ ] **MCPs para Git/GitHub** — clonar, branchear, PRs, code review.
- [ ] **CI/CD automatizado por IA** — Magi ejecuta tests, lint, build. Si pasa, se sube/mergea.
  - Pipeline: Magi recibe feature → consulta Engram KB → implementa → tests → PR.
- [ ] **Investigación de logging/auditoría** — cómo trackear las acciones de Magi en los repos. Se definirá conforme avancemos.

**Issues relacionados:** `tooling: Kit de Herramientas para Magi + Plantillas + CI/CD`

---

### 🔹 Fase 4: Plataforma de Onboarding Web

**Objetivo:** Plataforma web para nuevos devs/members de JoyanLabs.

- [ ] **Framework** — a definir (Next.js, SvelteKit, etc. — se debatirá con el equipo).
- [ ] **Backend** — a definir según necesidades.
- [ ] **UI/UX básica** — registro, perfil, dashboard personal.
- [ ] **Dashboard personal** — progreso, scoring, contribuciones a Engram.
- [ ] **Flujo de onboarding guiado** — conexión con Magi, setup de Engram local, primeros pasos.
- [ ] **Integración con sistema de reputación** — visible en la plataforma.

**Issues relacionados:** `platform: Portal de Onboarding de Usuarios`

---

### 🔹 Fase 5: DevAgent + Metodología Autoresearch (Investigación)

**Objetivo:** Crear un segundo agente especializado en desarrollo basado en el conocimiento acumulado.

- [ ] **Investigación: Arquitectura de DevAgent** — ¿fine-tuning de modelo base vs. RAG + MCPs?
- [ ] **Entrenamiento con KB de Engram** — extraer patrones de código exitosos de JoyanLabs.
- [ ] **Adaptar loop de `autoresearch`** (Karpathy) para Magi:
  - `program.md` adaptado → hipótesis de mejora para Magi/DevAgent.
  - Loop: implementar → testear en proyecto real → medir métricas → iterar.
- [ ] **Plan de fine-tuning** — se definirá cuando tengamos GPU y dataset suficiente.
  - Repo autoresearch: https://github.com/karpathy/autoresearch
  - Métrica de evaluación: `val_bpb` (bits por byte) → adaptable a métricas de desarrollo.

**Issues relacionados:** `agent: DevAgent + Autoresearch (Investigación)`

---

## Notas

- **Netbird** es la VPN elegida para conectividad segura.
- **Gentle AI** es la herramienta principal de desarrollo: https://github.com/Gentleman-Programming/gentle-ai
- **Engram Cloud** v1.13.1: https://github.com/Gentleman-Programming/engram/releases/tag/v1.13.1
- **TubeMaster** v0.1.0 (bonus): manejador de YouTube ops — https://github.com/Gentleman-Programming/tubemaster/releases/tag/v0.1.0
- La Fase 5 (DevAgent) se abordará de forma incremental conforme veamos resultados de las fases anteriores.

---

## Referencias

- Engram Cloud v1.13.0 release notes: https://github.com/Gentleman-Programming/engram/releases/tag/v1.13.0
- Engram Cloud v1.13.1 patch: https://github.com/Gentleman-Programming/engram/releases/tag/v1.13.1
- Gentle AI repo: https://github.com/Gentleman-Programming/gentle-ai
- Autoresearch (Karpathy): https://github.com/karpathy/autoresearch
