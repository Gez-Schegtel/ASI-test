# Administración de Sistemas de Información (ASI-test)

[![Editorial CI/CD (PDF & EPUB)](https://github.com/Gez-Schegtel/ASI-test-test/actions/workflows/editorial-ci.yml/badge.svg)](https://github.com/Gez-Schegtel/ASI-test/actions/workflows/editorial-ci.yml)

Repositorio colaborativo y fuente de verdad canónica de apuntes, trabajos prácticos y laboratorios de **Administración de Sistemas de Información (ASI-test)** — Ingeniería en Sistemas de Información (UTN FRRe).

Mantenido como bóveda de **Obsidian** y con compilación editorial **100 % automatizada** a **PDF** y **EPUB3** mediante GitHub Actions (Pandoc + LuaLaTeX).

---

## 📥 Descargar Apuntes Listos (PDF y EPUB3)

**No necesitás instalar nada ni compilar por tu cuenta para estudiar.** Cada vez que se actualiza un apunte, el repositorio genera automáticamente todos los PDFs y EPUBs organizados por unidad y trabajo práctico.

> [!TIP]
> ### Atajo directo a los apuntes compilados
> 1. Entrá a **[Ejecuciones de Editorial CI/CD (GitHub Actions)](https://github.com/Gez-Schegtel/ASI-test/actions/workflows/editorial-ci.yml)** y hacé clic en la primera ejecución con tilde verde (`✔`).
> 2. Bajá hasta el final de esa página, a la sección **Artifacts**, y descargá únicamente la carpeta que necesites (requiere haber iniciado sesión en GitHub):
>    * 📦 **`Unidad-I`** — Cuestionario de autoestudio resuelto y material de la Unidad I.
>    * 📦 **`Unidad-III`** — Apunte teórico completo (*Subsistema de Aplicación*), cuestionario resuelto y enunciado.
>    * 📦 **`Unidad-VI`** — Apunte teórico completo (*Seguridad y Auditoría*), cuestionario resuelto y enunciado.
>    * 📦 **`Practica-TP1-Alineamiento`** — TP1 de Alineamiento Estratégico de SI/TI y guías explicativas.
>    * 📦 **`Practica-TPI-DVP`** — Trabajo Práctico Integrador (Caso Vialidad Provincial - DVP).
>
> También podés consultar las versiones empaquetadas por hito en la sección **[Releases del repositorio](https://github.com/Gez-Schegtel/ASI-test/releases)**.

---

## Estructura del Repositorio

```text
ASI-test/
├── content/
│   ├── unidades/           <- Apuntes teóricos y cuestionarios organizados por Unidad (Unidad I a VI)
│   ├── practica/           <- TPI (Vialidad Provincial - DVP) y TP1 (Alineamiento de SI/TI)
│   └── labs/               <- Laboratorios prácticos y talleres (Checkmk, monitoreo)
├── assets/                 <- Almacén único de imágenes, diagramas y recursos gráficos
├── toolchain/
│   ├── Dockerfile          <- Imagen precompilada (ghcr.io/Gez-Schegtel/asi-toolchain) con Pandoc y LuaLaTeX
│   ├── bin/                <- Ejecutables autocontenidos (mdnorm y md2pdf)
│   └── pandoc/             <- Defaults YAML, fuentes embebidas, plantillas LaTeX/CSS y filtros Lua
├── docs/
│   ├── STATUS.md           <- Estado vivo y bitácora histórica del repositorio
│   └── specs/              <- Especificaciones técnicas de arquitectura, toolchain y CI/CD
├── plantillas/             <- Plantillas de Markdown y guías de redacción de apuntes
├── legacy/                 <- Resguardo temporal de scripts previos y archivo histórico 2025
└── GEMINI.md               <- Protocolo rector y convenciones editoriales del proyecto
```

---

## Cómo editar o compilar localmente (Opcional)

Si querés leer desde las fuentes en Markdown, colaborar en los apuntes o generar tus propios PDFs/EPUBs en tu máquina:

* **En Obsidian**: Abrí la raíz del repositorio como bóveda (*vault*) para que todas las imágenes de [`assets/`](assets/) se resuelvan automáticamente. Tema sugerido: *Blue Topaz*.
* **Compilar usando la imagen Docker del repositorio (sin instalar TeX Live)**:
  ```bash
  docker run --rm --user "$(id -u):$(id -g)" -v "$PWD:/workspace" -w /workspace \
    ghcr.io/Gez-Schegtel/asi-toolchain:latest \
    ./toolchain/bin/md2pdf -y --all "content/unidades/Unidad III/"*.md
  ```
* **Normalizar y compilar de forma nativa**:
  ```bash
  # Normalizar formato de un apunte
  ./toolchain/bin/mdnorm "content/unidades/Unidad III/Unidad III - Subsistema de Aplicación.md"

  # Compilar una unidad completa a PDF y EPUB3 en build/Unidad III/
  ./toolchain/bin/md2pdf -y --all "content/unidades/Unidad III/"*.md
  ```
  Consultá [`toolchain/README.md`](toolchain/README.md) para ver el detalle de dependencias y opciones.
* **Estado del proyecto y hoja de ruta**: Consultá [`docs/STATUS.md`](docs/STATUS.md) para ver el avance de cada unidad y las especificaciones técnicas en [`docs/specs/`](docs/specs/).
