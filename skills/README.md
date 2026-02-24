# Skills Library

> Directorio de skills para el MAGI Framework

## Estructura

```
skills/
├── skill-creator/      # Para crear nuevos skills
├── skill-sync/        # Para sincronizar con AGENTS.md
├── patterns/          # Patrones arquitectónicos
├── frameworks/        # Frameworks y librerías
├── integrations/      # Integraciones (MCP, APIs)
└── agents/            # Agentes especializados
```

## Cómo Usar

1. **Crear nuevo skill**: Usa `skill-creator`
2. **Sincronizar**: Ejecuta `./skill-sync/assets/sync.sh` después de crear/modificar skills
3. **Configurar agentes**: Ejecuta `./setup.sh --all` para configurar tus herramientas AI

## Skills Disponibles

### Meta Skills
| Skill | Descripción |
|-------|-------------|
| `skill-creator` | Crea nuevos skills |
| `skill-sync` | Sincroniza metadata |

### Patterns (en desarrollo)
| Skill | Descripción |
|-------|-------------|
| `hexagonal` | Arquitectura hexagonal |
| `cqrs` | Patrón CQRS |
| `repository` | Patrón repositorio |

### Frameworks (en desarrollo)
| Skill | Descripción |
|-------|-------------|
| `nestjs` | NestJS Framework |
| `nuxt` | Nuxt.js |
| `prisma` | Prisma ORM |
| `better-auth` | Better Auth |

### Integrations (en desarrollo)
| Skill | Descripción |
|-------|-------------|
| `mcp` | Model Context Protocol |
| `plane` | Plane PM |
| `github` | GitHub |
| `notebooklm` | NotebookLM |

### Agents (en desarrollo)
| Skill | Descripción |
|-------|-------------|
| `arquitecto` | Define sistemas |
| `scrum-master` | Gestiona sprints |
| `documentador` | Genera docs |

---

**Estado**: En construcción (Fase 0 → Fase 1)
