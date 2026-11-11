# Spec 03 — Consolidación de Unidades Académicas y Pipeline CI/CD

* **Estado**: En ejecución (Parte B implementada el 2026-11-06; Parte A pendiente de material de estudio)

* **Fecha**: 2026-11-06

* **Alcance**: Plan editorial para consolidar las Unidades I a VI en `content/unidades/` bajo las convenciones de `GEMINI.md`, e implementación de integración y entrega continua en `.github/workflows/`.

---

## 1. Parte A: Consolidación Editorial de Unidades (`content/unidades/`)

### 1.1. Estándar de Nomenclatura y Estructura por Unidad

Todas las unidades teóricas consolidadas en `content/unidades/` seguirán una convención uniforme:

* `Unidad I - <Título Oficial>.md`

* `Unidad II - <Título Oficial>.md`

* `Unidad III - Subsistema de Aplicación.md`

* `Unidad IV - <Título Oficial>.md`

* `Unidad V - <Título Oficial>.md`

* `Unidad VI - Seguridad y Auditoría.md`

Cada archivo contará con:

1. Frontmatter YAML limpio (`title`, `subtitle`, `author`, `date`, `toc: true`, `numbersections: true`).

2. Referencia explícita a los autores canónicos de cátedra en cada bloque temático (*Chiavenato*, *Robson*, *Andreu/Ricart/Valor*, *Molero*, *Lardent*, *Piattini*, *Martha Alles*).

3. Callouts estándar de Obsidian (`> [!NOTE]`, `> [!IMPORTANT]`, `> [!WARNING]`, `> [!EXAMPLE]`).

4. Imágenes referenciadas exclusivamente desde `assets/` (sin Base64) y validación obligatoria con `toolchain/bin/mdnorm`.

### 1.2. Mapa de Fuentes para Completar las Unidades Faltantes

| Unidad Destino | Estado Actual | Fuentes Disponibles en el Repositorio para Consolidar |
| :--- | :--- | :--- |
| **Unidad I** | Parcial | `2026/Unidad I/` (3 notas `.md` + PDF cátedra), `2025/par_1/u1/` (49 notas atómicas: Tavistock, McFarlan, fases 1-4 de Andreu/Ricart/Valor, costos/beneficios) y `2025/par_1-RECUPERATORIO/`. |
| **Unidad II** *(orden a confirmar)* | En crudo | Si corresponde a **Provisión (RRHH + HW/SW)**: `2025/u4/TEORIA/` (`4-1`, `4-2`, esquemas y aclaraciones) más el bloque inicial de `APUNTE 2 parcial.md` (Mercado Laboral/RRHH, Rotación, Ausentismo, Reclutamiento, Selección, RDP y Adquisición). |
| **Unidad III** | **Consolidada** | `2026/Unidad III - Subsistema de Aplicación.md`: solo requiere normalización con `mdnorm`, conversión de citas sueltas a callouts estándar si aplica y limpieza del frontmatter redundante. |
| **Unidad IV** *(orden a confirmar)* | En crudo | Si corresponde a **Mantenimiento y Desarrollo de RRHH**: `2025/u6/TEORÍA/` (`6-1`, `6-2`) más las secciones finales de `APUNTE 2 parcial.md` (Aprendizaje, Entrenamiento, Desarrollo Organizacional, Plan de Carrera y Salarios). |
| **Unidad V** *(orden a confirmar)* | Fragmentada | Si corresponde a **Seguimiento / Control**: `2025/par_1/u2/` (Subsistema de control, etapas, auditoría de personal, Monitores HW/SW/Híbridos, Benchmarking, Cuello de botella y Ley de Amdahl). |
| **Unidad VI** | **Consolidada** | `2026/Unidad VI - Seguridad y Auditoría.md`: requiere pasada de `mdnorm`, quitar negritas redundantes en títulos `## **...**` y estandarizar rutas de imágenes con `Unidad III`. |

> [!NOTE]
> En `Unidad I/Los Sistemas de Informacion en la Empresa.md` el texto actual utiliza analogías informales de estudio (*Minecraft*). Al consolidar el apunte canónico de la Unidad I se reescribirá manteniendo el tono académico, riguroso y formal exigido por la Sección 5.2 de `GEMINI.md` (conservando ejemplos empresariales claros acordes a la cátedra).

---

## 2. Parte B: Integración y Entrega Continua (`.github/workflows/`)

Para cumplir con el Principio 2 de `GEMINI.md` (*Cero artefactos en Git; compilación delegada a GitHub Actions como artefactos de CI o GitHub Releases*), se implementarán dos flujos automatizados (o un único workflow multi-etapa `editorial-ci.yml`):

### 2.1. Job 1: `lint` (Rápido, en cada `push` y `pull_request`)

* **Entorno**: `ubuntu-latest` (solo requiere `bash` y `perl`, ejecuta en < 10 segundos).

* **Acciones**:

  1. Verifica que no se hayan commiteado archivos prohibidos (`.pdf`, `.epub`, o imágenes fuera de `assets/` o Base64 `data:image/` dentro de `content/`).

  2. Ejecuta `toolchain/bin/mdnorm --check` sobre todos los archivos `.md` de `content/` y `docs/`.

### 2.2. Job 2: `build` (Compilación PDF + EPUB y publicación)

* **Entorno**: `ubuntu-latest` con `pandoc`, `texlive-luatex`, `texlive-latex-recommended`, `texlive-latex-extra`, `texlive-fonts-recommended`, `texlive-lang-spanish`, `lmodern`, `fonts-noto-color-emoji` y `fonts-dejavu-core`.

* **Acciones**:

  1. Ejecuta `toolchain/bin/md2pdf -y --all` sobre `content/unidades/*.md`, `content/practica/cuestionarios/*Resolución*.md`, `content/practica/tpi-dvp/*.md` y `content/practica/tp1-alineamiento/TP1*.md`.

  2. Sube el directorio `build/` generado (todos los `.pdf` y `.epub`) como **GitHub Actions Artifact** (`apuntes-asi-pdf-epub`) descargable desde cualquier commit/PR.

  3. **Publicación automática en Releases**: Cuando se pushea un tag semántico (`v*`, ej. `v2026.1`), crea o actualiza automáticamente un **GitHub Release** adjuntando todos los PDFs y EPUBs listos para estudiar en PC, celular o e-reader.

---

## 3. Decisiones Abiertas para Revisar con el Equipo

1. **Orden oficial del programa 2026 (Unidades I a VI)**: En 2025 el orden era distinto (`u2` Monitores/Control, `u4` Provisión, `u5` Aplicación, `u6` Desarrollo/Mantenimiento), mientras que en 2026 *Aplicación* pasó a ser **Unidad III** y *Seguridad y Auditoría* es **Unidad VI**. ¿Me confirmás a qué número exacto corresponden en el programa 2026 **Provisión**, **Mantenimiento**, **Desarrollo** y **Seguimiento/Control**?

2. **Prioridad de ejecución**: Una vez ejecutadas las Specs `01` (reestructuración + `legacy/`) y `02` (`toolchain/` unificado), ¿querés que habilitemos primero el workflow de GitHub Actions con las Unidades III y VI ya listas, y luego vayamos consolidando unidad por unidad las restantes?
