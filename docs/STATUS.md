# STATUS.md — Estado Vivo y Bitácora del Repositorio (ASI)

> [!IMPORTANT]
> Este archivo es la **fuente de verdad viva y bitácora histórica** del repositorio de **Administración de Sistemas de Información (ASI)** — UTN FRRe. Debe consultarse al inicio de cada sesión y mantenerse estrictamente actualizado tras cada cambio estructural, de contenido o de *tooling*.

* **Última actualización**: `2026-11-06`
* **Fase actual**: `Infraestructura Técnica, Organización por Unidad, Imagen Docker GHCR y Publicación en Releases 100% Completadas (Specs 01, 02, 03-B, 04, 05 y 06 implementadas) -> En espera de material de estudio para Spec 03-Parte A`
* **Rama activa**: `main` (`myfork` — `Gez-Schegtel/ASI-test`)

---

## 1. Radiografía Actual del Repositorio (`AS-IS` vs. `TO-BE`)

| Dominio | Ubicación Actual (`AS-IS`) | Ubicación Canónica (`TO-BE`) | Estado Actual |
| :--- | :--- | :--- | :--- |
| Protocolo rector | `GEMINI.md` | `GEMINI.md` | **Activo y actualizado** |
| Estado vivo, guías y specs | `docs/STATUS.md`, `docs/GUIA_SUBIDA_APUNTES.md` + `docs/specs/` | `docs/` | **Specs 01, 02, 03-B, 04, 05 y 06 implementadas** + Guía de subida lista; Spec 03-A a la espera de material |
| Resguardo temporal | `legacy/` (`estilos/`, `script *`, `herramientas-2026/`, `enunciados-cuestionarios/`, `archivo-2025/`) | *(Se eliminará cuando el equipo dé el visto bueno final)* | **Resguardado** |
| Apuntes y cuestionarios por Unidad | `content/unidades/` (`Unidad I/`, `Unidad III/`, `Unidad VI/`) | `content/unidades/<Unidad X>/` | **Organizado por Unidad y normalizado** |
| Trabajos prácticos y guías | `content/practica/` (`tpi-dvp/`, `tp1-alineamiento/`) | `content/practica/` | **Migrado y 100% en `.md`** |
| Laboratorios y talleres | `content/labs/` (`cmk/`, `taller-1/`) | `content/labs/` | **Migrado** |
| Recursos gráficos | `assets/` (307 archivos, cero Base64) | `assets/` (único almacén sin Base64) | **Unificado al 100%** |
| Toolchain editorial | `toolchain/Dockerfile`, `toolchain/bin/` (`mdnorm`, `md2pdf`) y `toolchain/pandoc/` | `toolchain/` | **Implementado y validado** (salida jerárquica en `build/` + imagen en `ghcr.io`) |
| Plantillas y prompts | `plantillas/` | `plantillas/` | **En su lugar** |
| Pipelines CI/CD | `.github/workflows/editorial-ci.yml` | `.github/workflows/` | **Implementado con imagen GHCR (`asi-toolchain`) y Releases automáticos por Unidad (Spec 06)** |

### Métricas Auditadas del Árbol Actual (Post-Spec 06)

* **Archivos binarios PDF/EPUB/DOCX en el repositorio**: **0 archivos** (regla de cero artefactos activa en `.gitignore`).
* **Imágenes Base64 incrustadas en Markdown**: **0**.
* **Recursos gráficos centralizados en `assets/`**: **307 archivos**.
* **Toolchain autocontenido (`toolchain/`)**:
  * `toolchain/Dockerfile`: Imagen Docker (`ghcr.io/gez-schegtel/asi-toolchain`) basada en `ubuntu:24.04` con Pandoc, TeX Live (`LuaLaTeX`) y el caché global de fuentes de `luaotfload` (`/var/cache/texmf-var`) precalentado.
  * `toolchain/bin/mdnorm`: Linter y normalizador en Bash + Perl con soporte `-y`, `-v` y `--check` (`-n`) para CI.
  * `toolchain/bin/md2pdf`: Compilador unificado en Bash + Perl + Pandoc con soporte `--pdf`, `--epub` y `--all`, salida limpia a `build/`, resolución automática de `assets/` y normalización `NFKC` de letras matemáticas Unicode.
  * `toolchain/pandoc/`: `defaults/pdf.yaml`, `defaults/epub.yaml`, `defaults/metadatos.yaml` (`scrartcl` por defecto), `fonts/` (`Libertinus Serif`, `Inter` y `JetBrains Mono` embebidas en el repositorio), `templates/estilo.tex`, `templates/estilo-epub.css` y los 3 filtros Lua (`preambulo.lua`, `cortar-formulas.lua`, `centrar-imagenes.lua`).

---

## 2. Estado de Cobertura Académica y Práctica

| Componente / Unidad | Tema Principal | Ubicación Actual | Estado Editorial |
| :--- | :--- | :--- | :--- |
| **Unidad I** | Los SI en la Empresa, Cadena de Valor y Estrategia SI/TI | `content/unidades/Unidad I/` + `legacy/archivo-2025/2025/par_1/u1/` | Cuestionario resuelto en raíz + 4 borradores en `Unidad I/borradores/` |
| **Unidad II** | Subsistema de Provisión (RRHH y SI/TI) *(orden 2026 a confirmar)* | `legacy/archivo-2025/2025/u4/` + `legacy/archivo-2025/APUNTE 2 parcial.md` | En crudo (ya limpio de Base64 y PDFs pasados a `.md`) |
| **Unidad III** | Subsistema de Aplicación (RRHH, RUO y Rendimiento/Capacidad) | `content/unidades/Unidad III/` | **Completa** (Apunte teórico + Cuestionario de autoestudio resuelto) |
| **Unidad IV** | Mantenimiento y Desarrollo de RRHH *(orden 2026 a confirmar)* | `legacy/archivo-2025/2025/u6/` + `legacy/archivo-2025/APUNTE 2 parcial.md` | En crudo (ya limpio de Base64) |
| **Unidad V** | Subsistema de Seguimiento / Control (Monitores, Benchmarking, Amdahl) | `legacy/archivo-2025/2025/par_1/u2/` | Fragmentado |
| **Unidad VI** | Seguridad y Auditoría de SI/TI (Riesgos, ALE, Control Interno) | `content/unidades/Unidad VI/` | **Completa** (Apunte teórico + Cuestionario de autoestudio resuelto) |
| **TPI (DVP)** | Caso Dirección de Vialidad Provincial del Chaco (ERP, GeoVial, SiCC) | `content/practica/tpi-dvp/` | **Completo en `.md`** (`Explicación del TPI.md` + `TPI Parte 2.md`) |
| **TP1 Alineamiento** | Guías, presentaciones y consignas del TP1 de Alineamiento Estratégico | `content/practica/tp1-alineamiento/` | **Completo en `.md`** (9 archivos `.md`) |
| **Lab Checkmk** | Monitoreo con Checkmk Raw 2.3 en Docker + `http_ping.py` | `content/labs/cmk/` y `content/labs/taller-1/` | **Migrado y funcional** |

---

## 3. Especificaciones Activas (`docs/specs/`)

1. **[01-reestructuracion-y-resguardo-legacy.md](specs/01-reestructuracion-y-resguardo-legacy.md)** — *Estado: **Implementada** (2026-11-06)*. Resguardo en `legacy/`, migración a `content/` y `assets/`, conversión de los 14 PDFs/DOCX de cátedra a `.md` (Opción A), extracción de las 62 imágenes Base64 y nuevo `.gitignore`.
2. **[02-unificacion-toolchain-pandoc.md](specs/02-unificacion-toolchain-pandoc.md)** — *Estado: **Implementada** (2026-11-06)*. Construcción de `toolchain/bin/mdnorm`, `toolchain/bin/md2pdf` (`--pdf`, `--epub`, `--all`), `toolchain/pandoc/` (`defaults/`, `fonts/`, `templates/`, `filters/`) y `toolchain/README.md`, 100% autocontenido y con `Libertinus Serif`, `Inter` y `JetBrains Mono` embebidas en `toolchain/pandoc/fonts/`.
3. **[03-consolidacion-unidades-y-ci-cd.md](specs/03-consolidacion-unidades-y-ci-cd.md)** — *Estado: **Parte B (CI/CD) implementada** (2026-11-06); **Parte A (Unidades faltantes)** en espera de material de estudio*. Pipeline `.github/workflows/editorial-ci.yml` activo para `lint` (`mdnorm --check` + control de binarios/Base64) y `build` (`md2pdf --all` -> Artifacts y GitHub Releases).
4. **[04-organizacion-unidades-y-artefactos.md](specs/04-organizacion-unidades-y-artefactos.md)** — *Estado: **Implementada** (2026-11-06)*. Agrupación por Unidad en `content/unidades/<Unidad X>/` (uniendo teoría y cuestionarios de cada unidad), preservación de subcarpetas en `build/` desde `toolchain/bin/md2pdf` y empaquetado de Artifacts separados por Unidad y Práctica (Modalidad B) en GitHub Actions.
5. **[05-imagen-docker-toolchain-ghcr.md](specs/05-imagen-docker-toolchain-ghcr.md)** — *Estado: **Implementada** (2026-11-06)*. Creación de `toolchain/Dockerfile` con Pandoc, LuaLaTeX y caché global de `luaotfload` (`/var/cache/texmf-var`) precalentado, e integración con GitHub Container Registry (`ghcr.io/gez-schegtel/asi-toolchain`) en `.github/workflows/editorial-ci.yml`.
6. **[06-publicacion-ordenada-en-releases.md](specs/06-publicacion-ordenada-en-releases.md)** — *Estado: **Implementada** (2026-11-06)*. Publicación automática y continua de las Unidades y Trabajos Prácticos en **GitHub Releases** individuales (`unidad-i` a `unidad-vi`, `practica-tpi`, `practica-tp1`) en cada push a `main` / `master`, permitiendo descarga pública en 1 clic sin requerir inicio de sesión.

---

## 4. Tablero de Pendientes y Decisiones Abiertas

### Decisiones resueltas
- [x] **14 PDFs/DOCX de cátedra sin `.md`**: Resuelto con **Opción A** (convertidos todos a `.md` y desversionados los binarios de Git).
- [x] **Archivo histórico `2025/` y `APUNTE 2 parcial.md`**: Alojados en `legacy/archivo-2025/` limpios de Base64 y binarios.
- [x] **Ubicación de `estilo.tex` y normalización Perl en Spec 02**: `estilo.tex` en `toolchain/pandoc/templates/estilo.tex` y motor Perl con normalización `NFKC` de letras matemáticas Unicode.
- [x] **Tipografía estándar en `toolchain/`**: Embebidas `Libertinus Serif` (texto), `Inter` (títulos) y `JetBrains Mono` (código) directamente en `toolchain/pandoc/fonts/` y cargadas por defecto desde `estilo.tex` + `preambulo.lua` sin depender del gestor de paquetes de cada distribución Linux.
- [x] **Organización por Unidad y Modalidad de Artifacts en Spec 04**: Implementada **Modalidad B** y compilación de **todos** los `.md` de `content/unidades/` y `content/practica/`.
- [x] **Eliminación de tiempos de instalación de TeX Live en CI/CD (Spec 05)**: Implementada imagen Docker precompilada en GitHub Container Registry (`ghcr.io/gez-schegtel/asi-toolchain`) con caché de fuentes `luaotfload` precalentado.
- [x] **Publicación directa por Unidad en GitHub Releases (Spec 06)**: Implementada **Modalidad A** (un Release independiente por Unidad y Trabajo Práctico con sus `.pdf`/`.epub` sueltos y un `.zip` de la unidad completa) + eliminación de *Actions Artifacts* redundantes en `main`.

### Decisiones pendientes (para Spec 03 - Parte A)
- [ ] **Numeración oficial 2026 de Unidades II, IV y V (Spec 03)**: confirmar el orden exacto de *Provisión*, *Mantenimiento*, *Desarrollo* y *Seguimiento/Control* en el programa 2026.

### Próximas tareas técnicas en cola
- [x] Ejecutar **Fase 0 (Spec 01)**: crear `legacy/` y resguardar `script conversor/`, `script normalizador/`, `estilos/` y `2026/herramientas/`.
- [x] Ejecutar **Fases 1 a 3 (Spec 01)**: migrar a `content/` y `assets/`, convertir los 14 documentos de cátedra a `.md`, extraer las 62 imágenes Base64 de `APUNTE 2 parcial.md` y aplicar el nuevo `.gitignore`.
- [x] Implementar **Spec 02**: construir `toolchain/bin/mdnorm`, `toolchain/bin/md2pdf` (`--pdf`, `--epub`, `--all`) y `toolchain/pandoc/`.
- [x] Implementar **Spec 03 (Parte B)**: configurar `.github/workflows/editorial-ci.yml` (`lint` + `build` PDF/EPUB + publicación en Artifacts y Releases).
- [x] Implementar **Spec 04**: reorganizar `content/unidades/<Unidad X>/` (con sus cuestionarios) y estructurar `build/` por Unidad.
- [x] Implementar **Spec 05**: encapsular el entorno Pandoc + LuaLaTeX en `toolchain/Dockerfile` y publicarlo automáticamente en `ghcr.io/gez-schegtel/asi-toolchain`.
- [x] Implementar **Spec 06**: publicar automáticamente un Release independiente por Unidad y Trabajo Práctico en GitHub Releases (`unidad-i` a `unidad-vi`, `practica-tpi`, `practica-tp1`).
- [ ] Implementar **Spec 03 (Parte A)**: consolidar las unidades teóricas faltantes cuando esté listo el material de estudio.

---

## 5. Bitácora de Sesiones

### `2026-11-06` — Guía de Subida de Apuntes, Unificación de Cuestionarios y Limpieza de Releases

* **Contexto**: Con el objetivo de facilitar la carga futura de las unidades restantes (**Spec 03 — Parte A**) y dejar los Releases de GitHub completamente limpios (únicamente con el apunte teórico y el cuestionario resuelto de cada unidad), se normalizaron los nombres y se redactó la guía operativa para colaboradores.
* **Acciones ejecutadas**:
  * **Creación de `docs/GUIA_SUBIDA_APUNTES.md`**: guía paso a paso con estructura de carpetas por unidad, plantillas YAML listas para copiar (apunte teórico y cuestionario resuelto), reglas de `assets/` y uso de `mdnorm`.
  * **Unificación de nombres de cuestionarios resueltos**:
    * `Unidad III/Aplicación de recursos - Resolución.md` $\rightarrow$ `Unidad III/Unidad III - Cuestionario de Autoestudio - Resolución.md`.
    * `Unidad VI/Seguridad y auditoría - Resolución.md` $\rightarrow$ `Unidad VI/Unidad VI - Cuestionario de Autoestudio - Resolución.md`.
  * **Limpieza de enunciados vacíos y borradores en Releases**:
    * Traslado de los enunciados sin resolver (`AdmSI-CUESTIONARIOS*`) a `legacy/enunciados-cuestionarios/`.
    * Exclusión de subcarpetas `*/borradores/*` en la compilación del job `build` (`.github/workflows/editorial-ci.yml`) para que solo se publiquen en Releases los apuntes y cuestionarios definitivos.
  * Actualización de `README.md`, `GEMINI.md`, `docs/specs/06-publicacion-ordenada-en-releases.md` y `docs/STATUS.md`.

### `2026-11-06` — Implementación de Spec 06 (Publicación Ordenada por Unidad en GitHub Releases)

* **Contexto**: Para eliminar la fricción de navegar a la pestaña *Actions* y exigir inicio de sesión en GitHub al descargar *Actions Artifacts*, se redactó e implementó la **Spec 06** con **Modalidad A** y **Opción 1**.
* **Acciones ejecutadas**:
  * Redacción e implementación de `docs/specs/06-publicacion-ordenada-en-releases.md`.
  * Actualización de `.github/workflows/editorial-ci.yml` para que en cada `push` (y `workflow_dispatch`) publique y mantenga actualizados automáticamente Releases separados por Unidad y Trabajo Práctico (`unidad-i` a `unidad-vi`, `practica-tpi`, `practica-tp1`) ordenados de arriba hacia abajo en `/releases`, adjuntando en cada uno tanto el paquete `.zip` completo de esa unidad como sus `.pdf` y `.epub` individuales (y dejando `actions/upload-artifact` únicamente para vistas previas en Pull Requests).
  * Actualización de `README.md` con enlaces directos en 1 clic a cada Unidad y su `.zip` correspondiente en Releases, y sincronización de `docs/STATUS.md`.

### `2026-11-06` — Implementación de Spec 05 (Imagen Docker del Toolchain en GHCR)

* **Contexto**: Para evitar demoras de instalación de paquetes `texlive-*` en GitHub Actions por degradación de mirrors de Ubuntu/Azure, desempaquetado de ~30.000 archivos con `dpkg` y regeneración en frío de `luaotfload` y `fmtutil-sys`, se redactó e implementó la **Spec 05**.
* **Acciones ejecutadas**:
  * Redacción de `docs/specs/05-imagen-docker-toolchain-ghcr.md`.
  * Creación de `toolchain/Dockerfile` sobre `ubuntu:24.04` con `Dpkg::Options::="--force-unsafe-io"`, `Acquire::ForceIPv4=true` y precalentamiento del caché global de fuentes (`TEXMFVAR=/var/cache/texmf-var`, `TEXMFCACHE=/var/cache/texmf-var`) compilando las tablas `.luc` de `Libertinus Serif`, `Inter`, `JetBrains Mono`, `Latin Modern Math`, `DejaVu Sans` y `Noto Color Emoji` durante el `docker build`.
  * Actualización de `.github/workflows/editorial-ci.yml` (`permissions: packages: write`) para calcular un hash determinista (`TAG_HASH`) sobre `toolchain/Dockerfile` y `toolchain/pandoc/`: si `ghcr.io/gez-schegtel/asi-toolchain:<TAG_HASH>` existe en GHCR la descarga en segundos (`docker pull`), y solo si no existe aún (primera ejecución o cambio en `toolchain/`) la construye y publica automáticamente en `ghcr.io`, ejecutando luego `md2pdf` mediante `docker run`.
  * Actualización de `GEMINI.md`, `README.md`, `toolchain/README.md` y `docs/STATUS.md`.

### `2026-11-06` — Implementación de Spec 04 (Organización por Unidad y Artifacts Separados en CI/CD)

* **Contexto**: A fin de evitar que todos los artefactos se generen mezclados en una única carpeta plana y que los cuestionarios estén separados de sus unidades teóricas, se redactó e implementó la **Spec 04** con **Modalidad B** y compilación de todos los documentos de `content/unidades/` y `content/practica/`.
* **Acciones ejecutadas**:
  * **Reorganización de `content/unidades/`**:
    * `content/unidades/Unidad I/`: `Unidad I - Cuestionario de Autoestudio - Resolución.md` + `borradores/` (4 archivos).
    * `content/unidades/Unidad III/`: `Unidad III - Subsistema de Aplicación.md`, `Aplicación de recursos - Resolución.md` y `AdmSI-CUESTIONARIOS APLICACIÓN DE RECURSOS.md`.
    * `content/unidades/Unidad VI/`: `Unidad VI - Seguridad y Auditoría.md`, `Seguridad y auditoría - Resolución.md` y `AdmSI-CUESTIONARIOS DE ESTUDIO - SEGURIDAD Y AUDITORIA DE SI-TI.md`.
    * Ejecución de `toolchain/bin/mdnorm -y` para actualizar automáticamente todas las rutas relativas hacia `assets/` (`../../../assets/`).
  * **Preservación de jerarquía en `toolchain/bin/md2pdf`**: actualización de `calcular_salida()` para que genere los PDFs y EPUBs respetando la subcarpeta de la Unidad (`build/Unidad I/`, `build/Unidad III/`, `build/Unidad VI/`) y de Práctica (`build/Practica/tp1-alineamiento/`, `build/Practica/tpi-dvp/`).
  * **Modalidad B en `.github/workflows/editorial-ci.yml`**: compilación unificada (`./toolchain/bin/md2pdf -y --all "${archivos_compilar[@]}"`) de todos los `.md` de `content/unidades/` y `content/practica/` sobre `ubuntu-24.04` (preservando la búsqueda de fuentes del sistema en `OSFONTDIR` dentro de `md2pdf` y evitando condiciones de carrera en el caché de `luaotfload`), y publicación de Artifacts individuales descargables por cada Unidad (`Unidad-I` a `Unidad-VI`) y trabajo práctico (`Practica-TP1-Alineamiento`, `Practica-TPI-DVP`).

### `2026-11-06` — Implementación de Spec 03 - Parte B (`.github/workflows/editorial-ci.yml`)

* **Contexto**: Con el `toolchain/` unificado y validado, y dado que el material de estudio de las unidades restantes aún se encuentra en preparación, se avanzó con la implementación técnica de la **Parte B de la Spec 03** (Integración y Entrega Continua).
* **Acciones ejecutadas**:
  * Creación de `.github/workflows/editorial-ci.yml` con dos *jobs* encadenados:
    * **`lint`**: verifica que no existan binarios prohibidos (`.pdf`, `.epub`, `.docx`) en Git, que no haya imágenes fuera de `assets/`, que no existan imágenes Base64 (`data:image/`) en `content/` y ejecuta `./toolchain/bin/mdnorm --check` sobre los 24 archivos `.md` de `content/`.
    * **`build`**: instala `pandoc`, `texlive-luatex`, `texlive-latex-recommended`, `texlive-latex-extra`, `texlive-fonts-recommended`, `texlive-lang-spanish`, `lmodern`, `fonts-noto-color-emoji` y `fonts-dejavu-core`; compila con `./toolchain/bin/md2pdf -y --all` las unidades consolidadas (`content/unidades/*.md`), resoluciones de cuestionarios (`content/practica/cuestionarios/*Resolución*.md`), TPI (`content/practica/tpi-dvp/*.md`) y TP1 (`content/practica/tp1-alineamiento/TP1*.md`); publica el paquete `apuntes-asi-pdf-epub` como **GitHub Actions Artifact** y adjunta todos los `.pdf` y `.epub` a un **GitHub Release** cuando se pushea un tag `v*`.
  * **Inclusión de fuentes en `toolchain/pandoc/fonts/`**: se embebieron las variantes `.ttf` de `Libertinus Serif`, `Inter` y `JetBrains Mono` dentro de `toolchain/pandoc/fonts/` (cargadas por ruta desde `preambulo.lua` + `estilo.tex`), manteniendo intactas las cabeceras YAML originales de los apuntes y cuestionarios y garantizando que compilen sin depender del gestor de paquetes de cada distribución.
  * **Validación local de extremo a extremo**: se ejecutaron localmente tanto los chequeos del job `lint` como la compilación `--all` (PDF + EPUB) de los 8 documentos incluidos en el job `build`, confirmando salida exitosa (`exit 0`) en el 100% de los casos y limpiando `build/` al finalizar.

### `2026-11-06` — Implementación y Validación de Spec 02 (`toolchain/` Unificado)

* **Contexto**: Tras el commit `e435c2a` de la Spec 01, se implementó la arquitectura completa de `toolchain/` definida en la Spec 02.
* **Acciones ejecutadas**:
  * **Configuración Pandoc (`toolchain/pandoc/`)**:
    * Creación de `defaults/metadatos.yaml`, `defaults/pdf.yaml` y `defaults/epub.yaml` utilizando `${.}` para rutas relativas sin depender de `~/.local/share/pandoc`.
    * Configuración de `templates/estilo.tex` (con `Libertinus Serif`, `Inter` y `JetBrains Mono` embebidas en `toolchain/pandoc/fonts/` más soporte de emojis/símbolos en LuaLaTeX) y `templates/estilo-epub.css` (con cajas celestes para callouts equivalentes a las del PDF).
    * Migración de `filters/preambulo.lua` (apuntando a `templates/estilo.tex`), `filters/cortar-formulas.lua` y `filters/centrar-imagenes.lua`.
  * **Ejecutables (`toolchain/bin/`)**:
    * Construcción de `toolchain/bin/mdnorm` (portado a Bash estándar manteniendo el motor Perl completo, agregando `--check` para CI, normalización matemática `NFKC` y preservación de wikilinks con atributos `|300` para no ensuciar Obsidian).
    * Construcción de `toolchain/bin/md2pdf` (compilador unificado en Bash + Perl con banderas `--pdf`, `--epub`, `--all`, `-y`, `-o` y `-i`, salida por defecto a `build/` e inclusión automática de `assets/`).
  * **Limpieza, auditoría y pruebas reales**:
    * Se eliminaron los 3 atributos residuales `{width=...}` que ensuciaban Obsidian (reemplazándolos por wikilinks limpios `![[...|ancho]]` o dejando el `80%` por defecto) y se normalizaron los **24 archivos `.md`** de `content/` con `toolchain/bin/mdnorm -y` (`mdnorm --check` pasa al 100% con código de salida `0`), preservando intactas las cabeceras YAML de cada documento.
    * Se probó `./toolchain/bin/md2pdf -y --all` sobre `Unidad III - Subsistema de Aplicación.md` (PDF 5,0 MB / EPUB 6,0 MB), `Unidad VI - Seguridad y Auditoría.md` (PDF 6,2 MB / EPUB 6,7 MB) y `Aplicación de recursos - Resolución.md` (PDF 4,1 MB / EPUB 3,8 MB), generando todos los artefactos sin errores y limpiando luego `build/`.

### `2026-11-06` — Ejecución Completa de Spec 01 (Reestructuración Física, Opción A y Resguardo en `legacy/`)

* **Contexto**: Con la validación de la Spec 01 y la elección de la **Opción A** (conversión previa a `.md` de los 14 documentos de cátedra/entregas antes de purgar binarios), se ejecutaron las Fases 0, 1, 2 y 3 de la especificación (commit `e435c2a`).
* **Acciones ejecutadas**:
  * Conversión de los 14 binarios de cátedra a Markdown, resguardo en `legacy/`, migración a `content/` y `assets/` (307 archivos), extracción de las 62 imágenes Base64 de `APUNTE 2 parcial.md` y eliminación de los 26 archivos `.pdf`/`.epub`/`.docx` de Git.

### `2026-11-06` — Refinamiento de Spec 02 (Toolchain Editorial)

* **Ajustes en Spec 02**: Ubicación de `estilo.tex` en `toolchain/pandoc/templates/estilo.tex` y normalización `NFKC` de caracteres matemáticos Unicode en el motor Perl.

### `2026-11-05` — Diagnóstico Integral, `GEMINI.md` y Plan Maestro Spec-Driven

* **Contexto**: Relevamiento inicial del repositorio, definición de `GEMINI.md` y `docs/STATUS.md`, y redacción de las especificaciones `01`, `02` y `03`.
