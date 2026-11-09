# Administración de Sistemas de Información (ASI-test)

[![Editorial CI/CD (PDF & EPUB)](https://github.com/Gez-Schegtel/ASI-test/actions/workflows/editorial-ci.yml/badge.svg)](https://github.com/Gez-Schegtel/ASI-test/actions/workflows/editorial-ci.yml)

Repositorio colaborativo y fuente de verdad canónica de apuntes, trabajos prácticos y laboratorios de **Administración de Sistemas de Información (ASI-test)** — Ingeniería en Sistemas de Información (UTN FRRe).

Mantenido como bóveda de **Obsidian** y con compilación editorial **100 % automatizada** a **PDF** y **EPUB3** mediante GitHub Actions (Pandoc + LuaLaTeX).

---

## 📥 Descargar Apuntes Listos (PDF y EPUB3)

**No necesitás instalar nada, ni compilar por tu cuenta, ni iniciar sesión en GitHub para estudiar.** Cada vez que se actualiza un apunte, el repositorio publica y mantiene al día un único **[Release Principal (`/releases/latest`)](https://github.com/Gez-Schegtel/ASI-test/releases/latest)** con tablas ordenadas por Unidad y Trabajo Práctico, mientras que los cierres de parcial o cursada quedan resguardados como snapshots inmutables en **[Releases](https://github.com/Gez-Schegtel/ASI-test/releases)**.

> [!TIP]
> ### Atajos directos por Unidad y Práctica
> En el **[Índice de la Última Versión (`/releases/latest`)](https://github.com/Gez-Schegtel/ASI-test/releases/latest)** podés bajar cualquier `.pdf` o `.epub` individual en un clic, o usar estos enlaces permanentes para bajar el paquete `.zip` completo de cada unidad:
>
> * 📘 **Unidad I — Los SI en la Empresa y Estrategia SI/TI** — Apunte teórico completo y temario · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/latest/download/Unidad-I-Completa.zip)** · [PDF/EPUB sueltos](https://github.com/Gez-Schegtel/ASI-test/releases/latest)
> * 📘 **Unidad III — Subsistema de Aplicación** — Apunte teórico completo, temario y cuestionario resuelto · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/latest/download/Unidad-III-Completa.zip)** · [PDF/EPUB sueltos](https://github.com/Gez-Schegtel/ASI-test/releases/latest)
> * 📘 **Unidad VI — Seguridad y Auditoría de SI/TI** — Apunte teórico completo, temario y cuestionario resuelto · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/latest/download/Unidad-VI-Completa.zip)** · [PDF/EPUB sueltos](https://github.com/Gez-Schegtel/ASI-test/releases/latest)
> * 🛠️ **Práctica — TPI (Vialidad Provincial - DVP)** — Trabajo Práctico Integrador (Partes 1 y 2) · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/latest/download/Practica-TPI-DVP.zip)** · [PDF/EPUB sueltos](https://github.com/Gez-Schegtel/ASI-test/releases/latest)
> * 🛠️ **Práctica — TP1 (Alineamiento Estratégico de SI/TI)** — Consigna, presentaciones y guías explicativas · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/latest/download/Practica-TP1-Alineamiento.zip)** · [PDF/EPUB sueltos](https://github.com/Gez-Schegtel/ASI-test/releases/latest)
>
> 👉 **[Ir a la Última Versión con todos los PDFs y EPUBs individuales (`/releases/latest`)](https://github.com/Gez-Schegtel/ASI-test/releases/latest)** · [Ver versiones históricas](https://github.com/Gez-Schegtel/ASI-test/releases)

---

## Estructura del Repositorio

```text
ASI-test/
├── content/
│   ├── unidades/                 <- Apuntes teóricos y cuestionarios resueltos por Unidad (Unidad I a VI)
│   ├── practica/                 <- TPI (Vialidad Provincial - DVP) y TP1 (Alineamiento de SI/TI)
│   └── labs/                     <- Laboratorios prácticos y talleres (Checkmk, monitoreo)
├── assets/                       <- Almacén único de imágenes, diagramas y recursos gráficos
├── toolchain/
│   ├── Dockerfile                <- Imagen precompilada (ghcr.io/gez-schegtel/asi-toolchain) con Pandoc y LuaLaTeX
│   ├── bin/                      <- Ejecutables autocontenidos (mdnorm, md2pdf y mkrelease)
│   └── pandoc/                   <- Defaults YAML, fuentes embebidas, plantillas LaTeX/CSS y filtros Lua
├── docs/
│   ├── GUIA_SUBIDA_APUNTES.md    <- Guía paso a paso para agregar o editar unidades y apuntes
│   ├── STATUS.md                 <- Estado vivo y bitácora histórica del repositorio
│   └── specs/                    <- Especificaciones técnicas de arquitectura, toolchain y CI/CD
├── plantillas/                   <- Plantillas de Markdown y guías de redacción de apuntes
├── legacy/                       <- Resguardo temporal de scripts previos, enunciados crudos y archivo 2025
└── GEMINI.md                     <- Protocolo rector y convenciones editoriales del proyecto
```

---

## Cómo subir apuntes o compilar localmente (Opcional)

Si querés colaborar subiendo unidades nuevas, editar apuntes en Markdown o generar tus propios PDFs/EPUBs en tu máquina:

* **📝 Subir o editar apuntes**: Leé la **[Guía paso a paso para subir apuntes (`docs/GUIA_SUBIDA_APUNTES.md`)](docs/GUIA_SUBIDA_APUNTES.md)** (incluye las plantillas de portada, reglas de imágenes en `assets/` y el comando de normalización).
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
