# Administración de Sistemas de Información (ASI-test)

[![Editorial CI/CD (PDF & EPUB)](https://github.com/Gez-Schegtel/ASI-test/actions/workflows/editorial-ci.yml/badge.svg)](https://github.com/Gez-Schegtel/ASI-test/actions/workflows/editorial-ci.yml)

Repositorio colaborativo y fuente de verdad canónica de apuntes, trabajos prácticos y laboratorios de **Administración de Sistemas de Información (ASI-test)** — Ingeniería en Sistemas de Información (UTN FRRe).

Mantenido como bóveda de **Obsidian** y con compilación editorial **100 % automatizada** a **PDF** y **EPUB3** mediante GitHub Actions (Pandoc + LuaLaTeX).

---

## 📥 Descargar Apuntes Listos (PDF y EPUB3)

**No necesitás instalar nada, ni compilar por tu cuenta, ni iniciar sesión en GitHub para estudiar.** Cada vez que se actualiza un apunte, el repositorio publica automáticamente todos los PDFs y EPUBs organizados por unidad en la sección **[Releases](https://github.com/Gez-Schegtel/ASI-test/releases)**.

> [!TIP]
> ### Atajos directos por Unidad y Práctica
> Hacé clic en el nombre de una unidad para bajar sus archivos `.pdf` o `.epub` individuales, o en **`[📥 Descargar ZIP]`** para bajar la unidad completa en un clic:
>
> * 📘 **[Unidad I — Los SI en la Empresa y Estrategia SI/TI](https://github.com/Gez-Schegtel/ASI-test/releases/tag/unidad-i)** — Cuestionario de autoestudio resuelto y borradores · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/download/unidad-i/Unidad-I-Completa.zip)**
> * 📘 **[Unidad III — Subsistema de Aplicación](https://github.com/Gez-Schegtel/ASI-test/releases/tag/unidad-iii)** — Apunte teórico completo, cuestionario resuelto y enunciado · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/download/unidad-iii/Unidad-III-Completa.zip)**
> * 📘 **[Unidad VI — Seguridad y Auditoría de SI/TI](https://github.com/Gez-Schegtel/ASI-test/releases/tag/unidad-vi)** — Apunte teórico completo, cuestionario resuelto y enunciado · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/download/unidad-vi/Unidad-VI-Completa.zip)**
> * 🛠️ **[Práctica — TPI (Vialidad Provincial - DVP)](https://github.com/Gez-Schegtel/ASI-test/releases/tag/practica-tpi)** — Trabajo Práctico Integrador (Partes 1 y 2) · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/download/practica-tpi/Practica-TPI-DVP.zip)**
> * 🛠️ **[Práctica — TP1 (Alineamiento Estratégico de SI/TI)](https://github.com/Gez-Schegtel/ASI-test/releases/tag/practica-tp1)** — Consigna, presentaciones y guías explicativas · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/download/practica-tp1/Practica-TP1-Alineamiento.zip)**
>
> 👉 **[Ver todas las Unidades en la página de Releases](https://github.com/Gez-Schegtel/ASI-test/releases)**

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
│   ├── Dockerfile          <- Imagen precompilada (ghcr.io/gez-schegtel/asi-toolchain) con Pandoc y LuaLaTeX
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
    ghcr.io/gez-schegtel/asi-toolchain:latest \
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
