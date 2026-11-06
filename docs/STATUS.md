# STATUS.md — Estado Vivo y Bitácora del Repositorio (ASI)

> [!IMPORTANT]
> Este archivo es la **fuente de verdad viva y bitácora histórica** del repositorio de **Administración de Sistemas de Información (ASI)** — UTN FRRe. Debe consultarse al inicio de cada sesión y mantenerse estrictamente actualizado tras cada cambio estructural, de contenido o de *tooling*.

* **Última actualización**: `2026-11-06`
* **Fase actual**: `Infraestructura Técnica 100% Completada (Specs 01, 02 y 03-Parte B implementadas) -> En espera de material de estudio para Spec 03-Parte A`
* **Rama activa**: `changes/juani`

---

## 1. Radiografía Actual del Repositorio (`AS-IS` vs. `TO-BE`)

| Dominio | Ubicación Actual (`AS-IS`) | Ubicación Canónica (`TO-BE`) | Estado Actual |
| :--- | :--- | :--- | :--- |
| Protocolo rector | `GEMINI.md` | `GEMINI.md` | **Activo y actualizado** |
| Estado vivo y specs | `docs/STATUS.md` + `docs/specs/` | `docs/STATUS.md` + `docs/specs/` | **Specs 01, 02 y 03-B implementadas**; Spec 03-A a la espera de material |
| Resguardo temporal | `legacy/` (`estilos/`, `script *`, `herramientas-2026/`, `archivo-2025/`) | *(Se eliminará cuando el equipo dé el visto bueno final)* | **Resguardado** |
| Apuntes teóricos | `content/unidades/` | `content/unidades/` | **Migrado y normalizado** (U. III y VI listas; U. I en borradores) |
| Trabajos prácticos y guías | `content/practica/` (`tpi-dvp/`, `tp1-alineamiento/`, `cuestionarios/`) | `content/practica/` | **Migrado y 100% en `.md`** |
| Laboratorios y talleres | `content/labs/` (`cmk/`, `taller-1/`) | `content/labs/` | **Migrado** |
| Recursos gráficos | `assets/` (307 archivos, cero Base64) | `assets/` (único almacén sin Base64) | **Unificado al 100%** |
| Toolchain editorial | `toolchain/bin/` (`mdnorm`, `md2pdf`) y `toolchain/pandoc/` | `toolchain/bin/` y `toolchain/pandoc/` | **Implementado y validado** (PDF LuaLaTeX + EPUB3) |
| Plantillas y prompts | `plantillas/` | `plantillas/` | **En su lugar** |
| Pipelines CI/CD | `.github/workflows/editorial-ci.yml` | `.github/workflows/` | **Implementado y validado localmente** (`lint` + `build` + Releases) |

### Métricas Auditadas del Árbol Actual (Post-Spec 02)

* **Archivos binarios PDF/EPUB/DOCX en el repositorio**: **0 archivos** (regla de cero artefactos activa en `.gitignore`).
* **Imágenes Base64 incrustadas en Markdown**: **0**.
* **Recursos gráficos centralizados en `assets/`**: **307 archivos**.
* **Toolchain autocontenido (`toolchain/`)**:
  * `toolchain/bin/mdnorm`: Linter y normalizador en Bash + Perl con soporte `-y`, `-v` y `--check` (`-n`) para CI.
  * `toolchain/bin/md2pdf`: Compilador unificado en Bash + Perl + Pandoc con soporte `--pdf`, `--epub` y `--all`, salida limpia a `build/`, resolución automática de `assets/` y normalización `NFKC` de letras matemáticas Unicode.
  * `toolchain/pandoc/`: `defaults/pdf.yaml`, `defaults/epub.yaml`, `defaults/metadatos.yaml` (`Latin Modern Roman` por defecto), `templates/estilo.tex`, `templates/estilo-epub.css` y los 3 filtros Lua (`preambulo.lua`, `cortar-formulas.lua`, `centrar-imagenes.lua`).

---

## 2. Estado de Cobertura Académica y Práctica

| Componente / Unidad | Tema Principal | Ubicación Actual | Estado Editorial |
| :--- | :--- | :--- | :--- |
| **Unidad I** | Los SI en la Empresa, Cadena de Valor y Estrategia SI/TI | `content/unidades/unidad-1-borradores/` + `legacy/archivo-2025/2025/par_1/u1/` | En borradores (4 `.md` en `unidad-1-borradores/`, incluye cátedra convertido) |
| **Unidad II** | Subsistema de Provisión (RRHH y SI/TI) *(orden 2026 a confirmar)* | `legacy/archivo-2025/2025/u4/` + `legacy/archivo-2025/APUNTE 2 parcial.md` | En crudo (ya limpio de Base64 y PDFs pasados a `.md`) |
| **Unidad III** | Subsistema de Aplicación (RRHH, RUO y Rendimiento/Capacidad) | `content/unidades/Unidad III - Subsistema de Aplicación.md` | **Consolidado, normalizado y compilación PDF/EPUB validada** |
| **Unidad IV** | Mantenimiento y Desarrollo de RRHH *(orden 2026 a confirmar)* | `legacy/archivo-2025/2025/u6/` + `legacy/archivo-2025/APUNTE 2 parcial.md` | En crudo (ya limpio de Base64) |
| **Unidad V** | Subsistema de Seguimiento / Control (Monitores, Benchmarking, Amdahl) | `legacy/archivo-2025/2025/par_1/u2/` | Fragmentado |
| **Unidad VI** | Seguridad y Auditoría de SI/TI (Riesgos, ALE, Control Interno) | `content/unidades/Unidad VI - Seguridad y Auditoría.md` | **Consolidado, normalizado y compilación PDF/EPUB validada** |
| **TPI (DVP)** | Caso Dirección de Vialidad Provincial del Chaco (ERP, GeoVial, SiCC) | `content/practica/tpi-dvp/` | **Completo en `.md`** (`Explicación del TPI.md` + `TPI Parte 2.md`) |
| **TP1 Alineamiento** | Guías, presentaciones y consignas del TP1 de Alineamiento Estratégico | `content/practica/tp1-alineamiento/` | **Completo en `.md`** (9 archivos `.md`) |
| **Cuestionarios** | Enunciados y resoluciones de Unidad I, Aplicación de Recursos y Seguridad | `content/practica/cuestionarios/` | **Completos en `.md`** (5 archivos `.md`) |
| **Lab Checkmk** | Monitoreo con Checkmk Raw 2.3 en Docker + `http_ping.py` | `content/labs/cmk/` y `content/labs/taller-1/` | **Migrado y funcional** |

---

## 3. Especificaciones Activas (`docs/specs/`)

1. **[01-reestructuracion-y-resguardo-legacy.md](specs/01-reestructuracion-y-resguardo-legacy.md)** — *Estado: **Implementada** (2026-11-06)*. Resguardo en `legacy/`, migración a `content/` y `assets/`, conversión de los 14 PDFs/DOCX de cátedra a `.md` (Opción A), extracción de las 62 imágenes Base64 y nuevo `.gitignore`.
2. **[02-unificacion-toolchain-pandoc.md](specs/02-unificacion-toolchain-pandoc.md)** — *Estado: **Implementada** (2026-11-06)*. Construcción de `toolchain/bin/mdnorm`, `toolchain/bin/md2pdf` (`--pdf`, `--epub`, `--all`), `toolchain/pandoc/` (`defaults/`, `templates/`, `filters/`) y `toolchain/README.md`, 100% autocontenido y con `Latin Modern Roman` como fuente predeterminada.
3. **[03-consolidacion-unidades-y-ci-cd.md](specs/03-consolidacion-unidades-y-ci-cd.md)** — *Estado: **Parte B (CI/CD) implementada** (2026-11-06); **Parte A (Unidades faltantes)** en espera de material de estudio*. Pipeline `.github/workflows/editorial-ci.yml` activo para `lint` (`mdnorm --check` + control de binarios/Base64) y `build` (`md2pdf --all` -> Artifacts y GitHub Releases).

---

## 4. Tablero de Pendientes y Decisiones Abiertas

### Decisiones resueltas
- [x] **14 PDFs/DOCX de cátedra sin `.md`**: Resuelto con **Opción A** (convertidos todos a `.md` y desversionados los binarios de Git).
- [x] **Archivo histórico `2025/` y `APUNTE 2 parcial.md`**: Alojados en `legacy/archivo-2025/` limpios de Base64 y binarios.
- [x] **Ubicación de `estilo.tex` y normalización Perl en Spec 02**: `estilo.tex` en `toolchain/pandoc/templates/estilo.tex` y motor Perl con normalización `NFKC` de letras matemáticas Unicode.
- [x] **Tipografía estándar en `toolchain/`**: Definida `Latin Modern Roman` por defecto en `estilo.tex` / `metadatos.yaml`, permitiendo que cualquier nota la personalice con `mainfont`.

### Decisiones pendientes (para Spec 03)
- [ ] **Numeración oficial 2026 de Unidades II, IV y V**: confirmar el orden exacto de *Provisión*, *Mantenimiento*, *Desarrollo* y *Seguimiento/Control* en el programa 2026.

### Próximas tareas técnicas en cola
- [x] Ejecutar **Fase 0 (Spec 01)**: crear `legacy/` y resguardar `script conversor/`, `script normalizador/`, `estilos/` y `2026/herramientas/`.
- [x] Ejecutar **Fases 1 a 3 (Spec 01)**: migrar a `content/` y `assets/`, convertir los 14 documentos de cátedra a `.md`, extraer las 62 imágenes Base64 de `APUNTE 2 parcial.md` y aplicar el nuevo `.gitignore`.
- [x] Implementar **Spec 02**: construir `toolchain/bin/mdnorm`, `toolchain/bin/md2pdf` (`--pdf`, `--epub`, `--all`) y `toolchain/pandoc/`.
- [x] Implementar **Spec 03 (Parte B)**: configurar `.github/workflows/editorial-ci.yml` (`lint` + `build` PDF/EPUB + publicación en Artifacts y Releases).
- [ ] Implementar **Spec 03 (Parte A)**: consolidar las unidades teóricas faltantes cuando esté listo el material de estudio.

---

## 5. Bitácora de Sesiones

### `2026-11-06` — Implementación de Spec 03 - Parte B (`.github/workflows/editorial-ci.yml`)

* **Contexto**: Con el `toolchain/` unificado y validado, y dado que el material de estudio de las unidades restantes aún se encuentra en preparación, se avanzó con la implementación técnica de la **Parte B de la Spec 03** (Integración y Entrega Continua).
* **Acciones ejecutadas**:
  * Creación de `.github/workflows/editorial-ci.yml` con dos *jobs* encadenados:
    * **`lint`**: verifica que no existan binarios prohibidos (`.pdf`, `.epub`, `.docx`) en Git, que no haya imágenes fuera de `assets/`, que no existan imágenes Base64 (`data:image/`) en `content/` y ejecuta `./toolchain/bin/mdnorm --check` sobre los 24 archivos `.md` de `content/`.
    * **`build`**: instala `pandoc`, `texlive-luatex`, `texlive-latex-recommended`, `texlive-latex-extra`, `texlive-fonts-recommended`, `texlive-lang-spanish`, `lmodern`, `fonts-noto-color-emoji` y `fonts-dejavu-core`; compila con `./toolchain/bin/md2pdf -y --all` las unidades consolidadas (`content/unidades/*.md`), resoluciones de cuestionarios (`content/practica/cuestionarios/*Resolución*.md`), TPI (`content/practica/tpi-dvp/*.md`) y TP1 (`content/practica/tp1-alineamiento/TP1*.md`); publica el paquete `apuntes-asi-pdf-epub` como **GitHub Actions Artifact** y adjunta todos los `.pdf` y `.epub` a un **GitHub Release** cuando se pushea un tag `v*`.
  * **Validación local de extremo a extremo**: se ejecutaron localmente tanto los chequeos del job `lint` como la compilación `--all` (PDF + EPUB) de los 8 documentos incluidos en el job `build`, confirmando salida exitosa (`exit 0`) en el 100% de los casos y limpiando `build/` al finalizar.

### `2026-11-06` — Implementación y Validación de Spec 02 (`toolchain/` Unificado)

* **Contexto**: Tras el commit `e435c2a` de la Spec 01, se implementó la arquitectura completa de `toolchain/` definida en la Spec 02.
* **Acciones ejecutadas**:
  * **Configuración Pandoc (`toolchain/pandoc/`)**:
    * Creación de `defaults/metadatos.yaml`, `defaults/pdf.yaml` y `defaults/epub.yaml` utilizando `${.}` para rutas relativas sin depender de `~/.local/share/pandoc`.
    * Configuración de `templates/estilo.tex` (con `Latin Modern Roman` por defecto y soporte de emojis/símbolos en LuaLaTeX) y `templates/estilo-epub.css` (con cajas celestes para callouts equivalentes a las del PDF).
    * Migración de `filters/preambulo.lua` (apuntando a `templates/estilo.tex`), `filters/cortar-formulas.lua` y `filters/centrar-imagenes.lua`.
  * **Ejecutables (`toolchain/bin/`)**:
    * Construcción de `toolchain/bin/mdnorm` (portado a Bash estándar manteniendo el motor Perl completo, agregando `--check` para CI, normalización matemática `NFKC` y preservación de wikilinks con atributos `|300` para no ensuciar Obsidian).
    * Construcción de `toolchain/bin/md2pdf` (compilador unificado en Bash + Perl con banderas `--pdf`, `--epub`, `--all`, `-y`, `-o` y `-i`, salida por defecto a `build/` e inclusión automática de `assets/`).
  * **Limpieza, auditoría y pruebas reales**:
    * Se simplificaron los frontmatters redundantes de `Unidad III` y `Unidad VI`, se eliminaron los 3 atributos residuales `{width=...}` que ensuciaban Obsidian (reemplazándolos por wikilinks limpios `![[...|ancho]]` o dejando el `80%` por defecto) y se normalizaron los **24 archivos `.md`** de `content/` con `toolchain/bin/mdnorm -y` (`mdnorm --check` pasa al 100% con código de salida `0`).
    * Se probó `./toolchain/bin/md2pdf -y --all` sobre `Unidad III - Subsistema de Aplicación.md` (PDF 5,0 MB / EPUB 6,0 MB), `Unidad VI - Seguridad y Auditoría.md` (PDF 6,2 MB / EPUB 6,7 MB) y `Aplicación de recursos - Resolución.md` (PDF 4,1 MB / EPUB 3,8 MB), generando todos los artefactos sin errores y limpiando luego `build/`.

### `2026-11-06` — Ejecución Completa de Spec 01 (Reestructuración Física, Opción A y Resguardo en `legacy/`)

* **Contexto**: Con la validación de la Spec 01 y la elección de la **Opción A** (conversión previa a `.md` de los 14 documentos de cátedra/entregas antes de purgar binarios), se ejecutaron las Fases 0, 1, 2 y 3 de la especificación (commit `e435c2a`).
* **Acciones ejecutadas**:
  * Conversión de los 14 binarios de cátedra a Markdown, resguardo en `legacy/`, migración a `content/` y `assets/` (307 archivos), extracción de las 62 imágenes Base64 de `APUNTE 2 parcial.md` y eliminación de los 26 archivos `.pdf`/`.epub`/`.docx` de Git.

### `2026-11-06` — Refinamiento de Spec 02 (Toolchain Editorial)

* **Ajustes en Spec 02**: Ubicación de `estilo.tex` en `toolchain/pandoc/templates/estilo.tex` y normalización `NFKC` de caracteres matemáticos Unicode en el motor Perl.

### `2026-11-05` — Diagnóstico Integral, `GEMINI.md` y Plan Maestro Spec-Driven

* **Contexto**: Relevamiento inicial del repositorio, definición de `GEMINI.md` y `docs/STATUS.md`, y redacción de las especificaciones `01`, `02` y `03`.
