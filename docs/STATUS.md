# STATUS.md — Estado Vivo y Bitácora del Repositorio (ASI)

> [!IMPORTANT]
> Este archivo es la **fuente de verdad viva y bitácora histórica** del repositorio de **Administración de Sistemas de Información (ASI)** — UTN FRRe. Debe consultarse al inicio de cada sesión y mantenerse estrictamente actualizado tras cada cambio estructural, de contenido o de *tooling*.

* **Última actualización**: `2026-11-06`
* **Fase actual**: `Fase 1 Completada (Spec 01 implementada) -> En transición a Spec 02 (Unificación de Toolchain)`
* **Rama activa**: `master`

---

## 1. Radiografía Actual del Repositorio (`AS-IS` vs. `TO-BE`)

| Dominio | Ubicación Actual (`AS-IS`) | Ubicación Canónica (`TO-BE`) | Estado Actual |
| :--- | :--- | :--- | :--- |
| Protocolo rector | `GEMINI.md` | `GEMINI.md` | **Activo y actualizado** |
| Estado vivo y specs | `docs/STATUS.md` + `docs/specs/` | `docs/STATUS.md` + `docs/specs/` | **Spec 01 implementada**; Specs 02 y 03 listas |
| Resguardo temporal | `legacy/` (`estilos/`, `script *`, `herramientas-2026/`, `archivo-2025/`) | *(Se eliminará al validar `toolchain/` y unidades)* | **Completado** (Fase 0 de Spec 01) |
| Apuntes teóricos | `content/unidades/` | `content/unidades/` | **Migrado** (U. III y VI listas; U. I en borradores) |
| Trabajos prácticos y guías | `content/practica/` (`tpi-dvp/`, `tp1-alineamiento/`, `cuestionarios/`) | `content/practica/` | **Migrado y 100% en `.md`** |
| Laboratorios y talleres | `content/labs/` (`cmk/`, `taller-1/`) | `content/labs/` | **Migrado** |
| Recursos gráficos | `assets/` (307 archivos, cero Base64) | `assets/` (único almacén sin Base64) | **Unificado al 100%** |
| Toolchain editorial | En resguardo dentro de `legacy/` | `toolchain/bin/` y `toolchain/pandoc/` | **Próximo paso (Spec 02)** |
| Plantillas y prompts | `plantillas/` | `plantillas/` | **En su lugar** |
| Pipelines CI/CD | *(Inexistente)* | `.github/workflows/` | Pendiente (Spec 03) |

### Métricas Auditadas del Árbol Actual (Post-Spec 01)

* **Archivos binarios PDF/EPUB/DOCX en el repositorio**: **0 archivos** (se eliminaron los 12 artefactos compilados propios y se convirtieron previamente a Markdown los 14 documentos de cátedra/entregas aplicando la **Opción A** de la Spec 01).
* **Imágenes Base64 incrustadas en Markdown**: **0** (se extrajeron las 62 imágenes Base64 de `APUNTE 2 parcial.md` hacia `assets/apunte2-img-01.png` ... `62.png`, reduciendo el archivo de **4,1 MB a 321 KB**).
* **Recursos gráficos centralizados en `assets/`**: **307 archivos** (incluyendo las 62 imágenes de 2026, las 150 de `otros/img/`, las 20 de `assets/consignas-2025/`, las 4 de cuestionarios de autoestudio, las 8 extraídas de `apunte0.docx`, las 62 extraídas de `APUNTE 2 parcial.md` y `graficos.drawio`).

---

## 2. Estado de Cobertura Académica y Práctica

| Componente / Unidad | Tema Principal | Ubicación Actual | Estado Editorial |
| :--- | :--- | :--- | :--- |
| **Unidad I** | Los SI en la Empresa, Cadena de Valor y Estrategia SI/TI | `content/unidades/unidad-1-borradores/` + `legacy/archivo-2025/2025/par_1/u1/` | En borradores (4 `.md` en `unidad-1-borradores/`, incluye cátedra convertido) |
| **Unidad II** | Subsistema de Provisión (RRHH y SI/TI) *(orden 2026 a confirmar)* | `legacy/archivo-2025/2025/u4/` + `legacy/archivo-2025/APUNTE 2 parcial.md` | En crudo (ya limpio de Base64 y PDFs pasados a `.md`) |
| **Unidad III** | Subsistema de Aplicación (RRHH, RUO y Rendimiento/Capacidad) | `content/unidades/Unidad III - Subsistema de Aplicación.md` | **Consolidado** (1.826 líneas) |
| **Unidad IV** | Mantenimiento y Desarrollo de RRHH *(orden 2026 a confirmar)* | `legacy/archivo-2025/2025/u6/` + `legacy/archivo-2025/APUNTE 2 parcial.md` | En crudo (ya limpio de Base64) |
| **Unidad V** | Subsistema de Seguimiento / Control (Monitores, Benchmarking, Amdahl) | `legacy/archivo-2025/2025/par_1/u2/` | Fragmentado |
| **Unidad VI** | Seguridad y Auditoría de SI/TI (Riesgos, ALE, Control Interno) | `content/unidades/Unidad VI - Seguridad y Auditoría.md` | **Consolidado** (1.604 líneas, rutas actualizadas a `../../assets/`) |
| **TPI (DVP)** | Caso Dirección de Vialidad Provincial del Chaco (ERP, GeoVial, SiCC) | `content/practica/tpi-dvp/` | **Completo en `.md`** (`Explicación del TPI.md` + `TPI Parte 2.md`) |
| **TP1 Alineamiento** | Guías, presentaciones y consignas del TP1 de Alineamiento Estratégico | `content/practica/tp1-alineamiento/` | **Completo en `.md`** (9 archivos `.md`) |
| **Cuestionarios** | Enunciados y resoluciones de Unidad I, Aplicación de Recursos y Seguridad | `content/practica/cuestionarios/` | **Completos en `.md`** (5 archivos `.md`, rutas a `../../../assets/`) |
| **Lab Checkmk** | Monitoreo con Checkmk Raw 2.3 en Docker + `http_ping.py` | `content/labs/cmk/` y `content/labs/taller-1/` | **Migrado y funcional** |

---

## 3. Especificaciones Activas (`docs/specs/`)

1. **[01-reestructuracion-y-resguardo-legacy.md](specs/01-reestructuracion-y-resguardo-legacy.md)** — *Estado: **Implementada** (2026-11-06)*. Resguardo en `legacy/`, migración a `content/` y `assets/`, conversión de los 14 PDFs/DOCX de cátedra a `.md` (Opción A), extracción de las 62 imágenes Base64 y nuevo `.gitignore`.
2. **[02-unificacion-toolchain-pandoc.md](specs/02-unificacion-toolchain-pandoc.md)** — *Estado: Lista para implementar*. Fusión de `compilar*.sh` + `md2pdf` + `mdnorm` + `estilos/` dentro de `toolchain/` (`estilo.tex` en `templates/`, normalización matemática Unicode en el motor Perl, LuaLaTeX + EPUB3, autocontenido sin `~/.local/share/pandoc`).
3. **[03-consolidacion-unidades-y-ci-cd.md](specs/03-consolidacion-unidades-y-ci-cd.md)** — *Estado: En revisión*. Plan de redacción/unificación de Unidades I, II, IV y V, y pipeline de GitHub Actions (Artifacts + Releases).

---

## 4. Tablero de Pendientes y Decisiones Abiertas

### Decisiones resueltas
- [x] **14 PDFs/DOCX de cátedra sin `.md`**: Resuelto con **Opción A** (convertidos todos a `.md` —incluyendo transcripción completa de los 2 PDFs escaneados de parcial/práctica 2025— y desversionados los binarios de Git).
- [x] **Archivo histórico `2025/` y `APUNTE 2 parcial.md`**: Alojados en `legacy/archivo-2025/` limpios de Base64 y binarios.
- [x] **Ubicación de `estilo.tex` y normalización Perl en Spec 02**: `estilo.tex` queda en `toolchain/pandoc/templates/estilo.tex` y el motor Perl incorpora la normalización `NFKC` de letras matemáticas Unicode.

### Decisiones pendientes (para Spec 02 y Spec 03)
- [ ] **Tipografía estándar en `toolchain/`**: elegir entre `Libertinus Serif` + `Inter` + `JetBrains Mono` (actual en Unidades III y VI) o `Latin Modern Roman` (default en `legacy/estilos/`).
- [ ] **Numeración oficial 2026 de Unidades II, IV y V**: confirmar el orden exacto de *Provisión*, *Mantenimiento*, *Desarrollo* y *Seguimiento/Control* en el programa 2026.

### Próximas tareas técnicas en cola
- [x] Ejecutar **Fase 0 (Spec 01)**: crear `legacy/` y resguardar `script conversor/`, `script normalizador/`, `estilos/` y `2026/herramientas/`.
- [x] Ejecutar **Fases 1 a 3 (Spec 01)**: migrar a `content/` y `assets/`, convertir los 14 documentos de cátedra a `.md`, extraer las 62 imágenes Base64 de `APUNTE 2 parcial.md` y aplicar el nuevo `.gitignore` desversionando todos los PDFs/EPUBs/DOCX.
- [ ] Implementar **Spec 02**: construir `toolchain/bin/mdnorm`, `toolchain/bin/md2pdf` (`--pdf`, `--epub`, `--all`) y `toolchain/pandoc/`.
- [ ] Implementar **Spec 03**: configurar `.github/workflows/` y consolidar las unidades faltantes.

---

## 5. Bitácora de Sesiones

### `2026-11-06` — Ejecución Completa de Spec 01 (Reestructuración Física, Opción A y Resguardo en `legacy/`)

* **Contexto**: Con la validación de la Spec 01 y la elección de la **Opción A** (conversión previa a `.md` de los 14 documentos de cátedra/entregas antes de purgar binarios), se ejecutaron las Fases 0, 1, 2 y 3 de la especificación.
* **Acciones ejecutadas**:
  * **Conversión de los 14 binarios de cátedra a Markdown**:
    * Se transcribieron íntegramente los 2 PDFs escaneados (`Copia de 1er Parcial ADSI 02-07-2025.md` y `PRACTICA-ADMINISTRACION_RIESGOS.md`).
    * Se convirtió `apunte0.docx` a `apunte0.md` vía Pandoc extrayendo sus 8 imágenes a `assets/apunte0-image1..8.png`.
    * Se extrajo y estructuró en `.md` el texto completo de los 11 PDFs restantes (`TPI Parte 2.md`, `U1-Desarrollo de los temas-1.md`, `TP1 - Alineamiento de SI-TI.md`, presentaciones, cuestionarios y guías de simulación de entrevistas).
  * **Fase 0 (`legacy/`)**: Se movieron con `git mv` las carpetas `script conversor/`, `script normalizador/`, `estilos/` y `2026/herramientas/` (`herramientas-2026/`) hacia `legacy/`.
  * **Fase 1 (`content/` y `legacy/archivo-2025/`)**: Se migraron las unidades a `content/unidades/`, las guías y cuestionarios a `content/practica/` (`tpi-dvp/`, `tp1-alineamiento/`, `cuestionarios/`), el laboratorio de Checkmk y taller a `content/labs/`, y el archivo 2025 + `APUNTE 2 parcial.md` a `legacy/archivo-2025/`. Se actualizaron las rutas relativas de imágenes en `Unidad VI` (`../../assets/`) y `Aplicación de recursos - Resolución.md` (`../../../assets/`).
  * **Fase 2 (`assets/` y fin del Base64)**: Se consolidaron todas las imágenes en `assets/` (307 archivos en total), eliminando el PNG duplicado de `par_1-RECUPERATORIO` y extrayendo las 62 imágenes Base64 de `APUNTE 2 parcial.md` a `assets/apunte2-img-01..62.png` (reduciendo el archivo de 4,1 MB a 321 KB).
  * **Fase 3 (Saneamiento de binarios y `.gitignore`)**: Se eliminaron de Git (`git rm`) los 26 archivos `.pdf`, `.epub` y `.docx`, se actualizó el `.gitignore` raíz y se renovó el `README.md` principal.

### `2026-11-06` — Refinamiento de Spec 02 (Toolchain Editorial)

* **Contexto**: Revisión técnica comparativa entre `script conversor/md2pdf` y `2026/herramientas/compilar.sh`.
* **Ajustes en Spec 02**:
  * Se confirmó la ubicación canónica de `estilo.tex` dentro de `toolchain/pandoc/templates/estilo.tex` y se especificó la actualización en `preambulo.lua` para resolver esa ruta vía `pandoc.path.join({ carpeta, 'templates', 'estilo.tex' })`.
  * Se incorporó al motor Perl de `md2pdf` la regla de normalización de caracteres matemáticos Unicode (`NFKC`) tomada de `compilar.sh` (`[\x{1D400}-\x{1D7FF}]`), previniendo errores de glifos faltantes en el motor tipográfico.

### `2026-11-05` — Diagnóstico Integral, `GEMINI.md` y Plan Maestro Spec-Driven

* **Contexto**: Se estableció `GEMINI.md` como protocolo rector del repositorio y se definió `docs/STATUS.md` como bitácora y monitor de estado obligatorio en cada sesión.
* **Hallazgos clave del relevamiento**:
  * Coexistencia de dos sistemas de compilación (`2026/herramientas/` con Bash + XeLaTeX/EPUB3, y `estilos/` + `md2pdf` + `mdnorm` con Zsh + Perl + LuaLaTeX + filtros Lua dependientes de `~/.local/share/pandoc`).
  * Se detectó que `script normalizador/mdnorm` exige el binario `diff` en su chequeo inicial (línea 152) aunque luego puede usar `git diff --no-index`, fallando en entornos mínimos sin `diffutils`.
  * Se inventariaron 26 archivos binarios (12 compilados propios descartables y 14 documentos de cátedra/entregas sin fuente `.md`), 235 imágenes sueltas (con solo 1 colisión idéntica SHA-256) y 62 imágenes Base64 dentro de `APUNTE 2 parcial.md` (4,1 MB).
* **Acciones ejecutadas**:
  * Actualización de `GEMINI.md` incorporando la directiva obligatoria de consultar y mantener siempre al día `docs/STATUS.md`.
  * Creación de `docs/STATUS.md` unificando estado arquitectónico e historial de bitácora.
  * Redacción de las especificaciones `01`, `02` y `03` en `docs/specs/`, incorporando como Fase 0 el resguardo temporal de `script conversor/`, `script normalizador/` y `estilos/` dentro de `legacy/` antes de reestructurar.
* **Estado al cierre**: Árbol original intacto; a la espera de revisión y aprobación de las 3 specs para iniciar la ejecución.
