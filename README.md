# Administración de Sistemas de Información (ASI)

Repositorio colaborativo y fuente de verdad canónica de apuntes, trabajos prácticos y laboratorios de **Administración de Sistemas de Información (ASI)** — Ingeniería en Sistemas de Información (UTN FRRe).

Mantenido como bóveda de **Obsidian** y optimizado para compilación editorial a PDF y EPUB3 mediante Pandoc y LuaLaTeX.

---

## Estructura del Repositorio

```text
ASI/
├── content/
│   ├── unidades/           <- Apuntes teóricos consolidados (Unidades I a VI)
│   ├── practica/           <- TPI (Vialidad Provincial - DVP), TP1 y cuestionarios de autoestudio
│   └── labs/               <- Laboratorios prácticos y talleres (Checkmk, monitoreo)
├── assets/                 <- Almacén único de imágenes, diagramas y recursos gráficos
├── toolchain/
│   ├── bin/                <- Ejecutables autocontenidos (mdnorm y md2pdf)
│   └── pandoc/             <- Defaults YAML, plantillas LaTeX/CSS y filtros Lua
├── docs/
│   ├── STATUS.md           <- Estado vivo y bitácora histórica del repositorio
│   └── specs/              <- Especificaciones técnicas de arquitectura, toolchain y CI/CD
├── plantillas/             <- Plantillas de Markdown y guías de redacción de apuntes
├── legacy/                 <- Resguardo temporal de scripts previos y archivo histórico 2025
└── GEMINI.md               <- Protocolo rector y convenciones editoriales del proyecto
```

---

## Cómo usar este repositorio

* **En Obsidian**: Abrí la raíz del repositorio como bóveda (*vault*) para que todas las imágenes de [`assets/`](assets/) se resuelvan automáticamente. Tema sugerido: *Blue Topaz*.
* **Normalizar y compilar apuntes a PDF / EPUB3**:
  ```bash
  # Normalizar formato de un apunte
  ./toolchain/bin/mdnorm "content/unidades/Unidad III - Subsistema de Aplicación.md"

  # Compilar a PDF y EPUB3 en build/
  ./toolchain/bin/md2pdf -y --all content/unidades/*.md
  ```
  Consultá [`toolchain/README.md`](toolchain/README.md) para ver el detalle de dependencias y opciones.
* **Estado del proyecto y hoja de ruta**: Consultá [`docs/STATUS.md`](docs/STATUS.md) para ver el avance de cada unidad y las especificaciones técnicas en [`docs/specs/`](docs/specs/).
