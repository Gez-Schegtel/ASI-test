# Administración de Sistemas de Información (ASI-test)

[![Editorial CI/CD (PDF & EPUB)](https://github.com/Gez-Schegtel/ASI-test/actions/workflows/editorial-ci.yml/badge.svg)](https://github.com/Gez-Schegtel/ASI-test/actions/workflows/editorial-ci.yml)

Repositorio colaborativo y fuente de verdad canónica de apuntes, trabajos prácticos y laboratorios de **Administración de Sistemas de Información (ASI-test)** — Ingeniería en Sistemas de Información (UTN FRRe).

Mantenido como bóveda de **Obsidian** y con compilación editorial **100 % automatizada** a **PDF** y **EPUB3** mediante GitHub Actions (Pandoc + LuaLaTeX).

---

## 📥 Descargar Apuntes Listos (PDF y EPUB3)

**No necesitás instalar nada, ni compilar por tu cuenta, ni iniciar sesión en GitHub para estudiar.** Cada vez que se actualiza un apunte, el repositorio publica y mantiene al día un único **[Release Principal (`/releases/latest`)](https://github.com/Gez-Schegtel/ASI-test/releases/latest)** con tablas ordenadas por Unidad y Trabajo Práctico, mientras que los cierres de parcial o cursada quedan resguardados como snapshots inmutables en **[Releases](https://github.com/Gez-Schegtel/ASI-test/releases)**.

> [!TIP]
> ### Atajos directos por Unidad y Trabajo Práctico Integrador
> En el **[Índice de la Última Versión (`/releases/latest`)](https://github.com/Gez-Schegtel/ASI-test/releases/latest)** podés bajar cualquier `.pdf` o `.epub` individual en un clic, o usar estos enlaces permanentes para bajar el paquete `.zip` completo de cada unidad:
>
> * 📋 **Programa Oficial — Planificación Académica 2026** — Programa analítico, régimen de aprobación y cronograma · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/latest/download/Programa-Oficial-2026.zip)** · [PDF/EPUB sueltos](https://github.com/Gez-Schegtel/ASI-test/releases/latest)
>
> * 📘 **Unidad 0 — Conceptos Previos e Introducción** — Apunte introductorio completo y temario · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/latest/download/Unidad-0-Completa.zip)** · [PDF/EPUB sueltos](https://github.com/Gez-Schegtel/ASI-test/releases/latest)
>
> * 📘 **Unidad I — Los SI en la Empresa y Estrategia SI/TI** — Apunte teórico completo, aclaraciones de cátedra, temario y cuestionario resuelto · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/latest/download/Unidad-I-Completa.zip)** · [PDF/EPUB sueltos](https://github.com/Gez-Schegtel/ASI-test/releases/latest)
>
> * 📘 **Unidad III — Subsistema de Aplicación** — Apunte teórico completo, temario y cuestionario resuelto · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/latest/download/Unidad-III-Completa.zip)** · [PDF/EPUB sueltos](https://github.com/Gez-Schegtel/ASI-test/releases/latest)
>
> * 📘 **Unidad VI — Seguridad y Auditoría de SI/TI** — Apunte teórico completo, temario y cuestionario resuelto · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/latest/download/Unidad-VI-Completa.zip)** · [PDF/EPUB sueltos](https://github.com/Gez-Schegtel/ASI-test/releases/latest)
>
> * 🛠️ **Trabajo Práctico Integrador — Parte 1: Alineación Estratégica de SI/TI (Caso DVP Chaco)** — Consigna, presentaciones y guías explicativas · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/latest/download/TPI-Parte-1-Alineamiento.zip)** · [PDF/EPUB sueltos](https://github.com/Gez-Schegtel/ASI-test/releases/latest)
>
> * 🛠️ **Trabajo Práctico Integrador — Parte 2: Aplicación de Recursos de SI/TI (Caso DVP Chaco)** — Organigrama, diccionario de competencias y presentación · **[`[📥 Descargar ZIP]`](https://github.com/Gez-Schegtel/ASI-test/releases/latest/download/TPI-Parte-2-DVP.zip)** · [PDF/EPUB sueltos](https://github.com/Gez-Schegtel/ASI-test/releases/latest)
>
> 👉 **[Ir a la Última Versión con todos los PDFs y EPUBs individuales (`/releases/latest`)](https://github.com/Gez-Schegtel/ASI-test/releases/latest)** · [Ver versiones históricas](https://github.com/Gez-Schegtel/ASI-test/releases)

---

## Estructura del Repositorio

```text
ASI/
├── content/
│   ├── programa/                 <- Planificación Académica Oficial 2026 (programa, régimen y cronograma)
│   ├── unidades/                 <- Apuntes teóricos y cuestionarios resueltos por unidad (unidad-0 a unidad-6)
│   ├── trabajo-practico/         <- Guías, presentaciones y resoluciones del Trabajo Práctico Integrador (parte-1 y parte-2)
│   └── labs/                     <- Laboratorios prácticos y talleres (Checkmk, monitoreo)
├── assets/                       <- Almacén único de imágenes, diagramas y recursos gráficos
├── toolchain/
│   ├── Dockerfile                <- Imagen precompilada (ghcr.io/gez-schegtel/asi-toolchain) con Pandoc y LuaLaTeX
│   ├── bin/                      <- Ejecutables autocontenidos (mdnorm, md2pdf, mkrelease y pdf2md)
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
    ./toolchain/bin/md2pdf -y --all "content/unidades/unidad-3/"*.md
  ```

* **Normalizar y compilar de forma nativa**:
  ```bash
  # Normalizar formato de un apunte
  ./toolchain/bin/mdnorm "content/unidades/unidad-3/Unidad III - Subsistema de Aplicación.md"

  # Compilar una unidad completa a PDF y EPUB3 en build/unidad-3/
  ./toolchain/bin/md2pdf -y --all "content/unidades/unidad-3/"*.md
  ```
  Consultá [`toolchain/README.md`](toolchain/README.md) para ver el detalle de dependencias y opciones.

* **Estado del proyecto y hoja de ruta**: Consultá [`docs/STATUS.md`](docs/STATUS.md) para ver el avance de cada unidad y las especificaciones técnicas en [`docs/specs/`](docs/specs/).

---

## 🛠️ Herramientas del Toolchain Editorial

El repositorio cuenta con una suite de herramientas en `toolchain/bin/` pensadas para mantener la calidad técnica y la automatización sin dependencias externas:

| Herramienta | Propósito | Características clave |
| :--- | :--- | :--- |
| **`mdnorm`** | Linter y normalizador | Corrige espaciados, tablas rotas, listas anidadas, cabeceras YAML, caracteres matemáticos Unicode (`NFKC`) y rutas relativas a `assets/`. Modo auditoría con `--check`. |
| **`md2pdf`** | Compilador universal | Compila a PDF (`LuaLaTeX`), EPUB3 o ambos (`--all`) en una pasada. Traduce al vuelo sintaxis de Obsidian (`![[...]]`, callouts, wikilinks) y organiza la salida limpia en `build/`. |
| **`pdf2md`** | Descompilador inverso | Convierte PDFs de cátedra a Markdown editable reconstruyendo títulos, tablas con grilla, fórmulas LaTeX y deduplicando imágenes automáticamente en `assets/`. |
| **`mkrelease`** | Publicador de Releases | Empaqueta por unidad en `.zip`, crea el índice dinámico en 1 clic y actualiza el release continuo (`apuntes-al-dia`) de forma atómica y sin enlaces caídos. |

> 👉 *Para ver opciones avanzadas, parámetros y dependencias, consultá [`toolchain/README.md`](toolchain/README.md).*

---

## 🎨 Estilo Editorial y Tipografía (Pandoc + LuaLaTeX)

El diseño visual está calibrado para garantizar legibilidad académica tanto en pantalla como impreso:

* **Motor de composición**: **LuaLaTeX** vía Pandoc, con renderizado nativo de emojis a color (`Noto Color Emoji:mode=harf;`) y símbolos técnicos (`DejaVu Sans`).

* **Tipografías embebidas** (100% autocontenido en `toolchain/pandoc/fonts/`):

  * **Cuerpo de texto**: *Libertinus Serif* (10 pt con interlineado optimizado).

  * **Títulos y encabezados**: *Inter* (clase KOMA-Script `scrartcl` con numeración `1.`, `1.1.`).

  * **Código fuente**: *JetBrains Mono* con coloreado sintáctico *Tango* y corte inteligente de líneas (`fvextra`).

* **Filtros Lua dinámicos** (`toolchain/pandoc/filters/`):

  * **`tablas-listas.lua`**: Transforma viñetas en celdas de tablas a listas nativas (`\begin{itemize}` en LaTeX / `<ul><li>` en EPUB).

  * **`preambulo.lua`**: Inyecta paquetes LaTeX y resuelve tipografías con respaldo de emojis sin romper personalizaciones de notas.

  * **`centrar-imagenes.lua`**: Centra figuras y respeta clases de alineación (`{.derecha}`, `{.izquierda}`).

  * **`cortar-formulas.lua`**: Divide ecuaciones display extensas para que nunca desborden los márgenes.

* **Cajas de avisos (Callouts)**: Compatibilidad total con Obsidian (`> [!NOTE]`, `> [!WARNING]`, `> [!IMPORTANT]`, `> [!TIP]`) transformados en cajas estilizadas con `tcolorbox`.
