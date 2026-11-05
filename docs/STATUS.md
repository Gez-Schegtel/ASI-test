# STATUS.md — Estado Vivo y Bitácora del Repositorio (ASI)

> [!IMPORTANT]
> Este archivo es la **fuente de verdad viva y bitácora histórica** del repositorio de **Administración de Sistemas de Información (ASI)** — UTN FRRe. Debe consultarse al inicio de cada sesión y mantenerse estrictamente actualizado tras cada cambio estructural, de contenido o de *tooling*.

* **Última actualización**: `2026-11-05`
* **Fase actual**: `Fase 0 — Diagnóstico y Revisión de Especificaciones (Pre-Reestructuración)`
* **Rama activa**: `master`

---

## 1. Radiografía Actual del Repositorio (`AS-IS` vs. `TO-BE`)

| Dominio | Ubicación Actual (`AS-IS`) | Ubicación Canónica (`TO-BE`) | Estado Actual |
| :--- | :--- | :--- | :--- |
| Protocolo rector | `GEMINI.md` | `GEMINI.md` | Activo y actualizado |
| Estado vivo y specs | `docs/STATUS.md` + `docs/specs/` | `docs/STATUS.md` + `docs/specs/` | Activo (3 specs en revisión) |
| Resguardo temporal | En raíz (`estilos/`, `script *`) y `2026/herramientas/` | `legacy/` (temporal hasta cerrar `toolchain/`) | Pendiente de mover (Fase 0) |
| Apuntes teóricos | `2026/*.md`, `2026/Unidad I/`, `2025/`, `APUNTE 2 parcial.md` | `content/unidades/` | Pendiente de migrar |
| Trabajos prácticos y guías | `2026/Trabajo Práctico/`, `2026/Cuestionarios de Autoestudio/` | `content/practica/` | Pendiente de migrar |
| Laboratorios y talleres | `otros/labs/cmk/`, `otros/taller_1/`, `otros/actividades/` | `content/labs/` | Pendiente de migrar |
| Recursos gráficos | `assets/` (62), `otros/img/` (150), `2025/` (21), Base64 (62) | `assets/` (único almacén sin Base64) | Pendiente de unificar |
| Toolchain editorial | `2026/herramientas/`, `estilos/`, `script conversor/`, `script normalizador/` | `toolchain/bin/` y `toolchain/pandoc/` | Pendiente de unificar |
| Plantillas y prompts | `plantillas/` | `plantillas/` | En su lugar |
| Pipelines CI/CD | *(Inexistente)* | `.github/workflows/` | Pendiente de crear |

### Métricas Auditadas del Árbol Actual

* **Peso total del directorio de trabajo**: ~109 MB.
* **Archivos binarios/documentos no-Markdown detectados (26 archivos)**:
  * **12 artefactos compilados propios** (`.pdf` y `.epub` en `2026/build/`, raíz de `2026/`, `Cuestionarios de Autoestudio/`, `Trabajo Práctico/` y `estilos/examples/`) que ya tienen su fuente `.md` exacta -> *listos para desversionar*.
  * **14 documentos PDF/DOCX de cátedra o entregas grupales** (como `TPI Parte 2.pdf`, `U1-Desarrollo de los temas-1.pdf`, `TP1 - Alineamiento de SI-TI.pdf` y enunciados oficiales) que aún no tienen versión `.md` -> *requiere decisión antes de purgar PDFs*.
* **Recursos gráficos**:
  * `assets/`: 62 imágenes (cursada 2026).
  * `otros/img/`: 150 imágenes (cursada 2025).
  * `2025/par_2/consignas/`: 20 capturas JPEG.
  * `2025/par_1-RECUPERATORIO/`: 1 PNG (duplicado exacto SHA-256 de `otros/img/Pasted image 20251114205618.png`).
  * `otros/gárficos.drawio`: 1 archivo fuente de diagramas.
  * `APUNTE 2 parcial.md`: 62 imágenes embebidas en Base64 (`data:image/...`, 4,1 MB en un solo archivo).

---

## 2. Estado de Cobertura Académica y Práctica

| Componente / Unidad | Tema Principal | Ubicación Actual | Estado Editorial |
| :--- | :--- | :--- | :--- |
| **Unidad I** | Los SI en la Empresa, Cadena de Valor y Estrategia SI/TI | `2026/Unidad I/` + `2025/par_1/u1/` | Fragmentado |
| **Unidad II** | Subsistema de Provisión (RRHH y SI/TI) *(orden 2026 a confirmar)* | `2025/u4/` + `APUNTE 2 parcial.md` | En crudo / Base64 |
| **Unidad III** | Subsistema de Aplicación (RRHH, RUO y Rendimiento/Capacidad) | `2026/Unidad III - Subsistema de Aplicación.md` | **Consolidado** (1.826 líneas) |
| **Unidad IV** | Mantenimiento y Desarrollo de RRHH *(orden 2026 a confirmar)* | `2025/u6/` + `APUNTE 2 parcial.md` | En crudo / Base64 |
| **Unidad V** | Subsistema de Seguimiento / Control (Monitores, Benchmarking, Amdahl) | `2025/par_1/u2/` | Fragmentado |
| **Unidad VI** | Seguridad y Auditoría de SI/TI (Riesgos, ALE, Control Interno) | `2026/Unidad VI - Seguridad y Auditoría.md` | **Consolidado** (1.604 líneas) |
| **TPI (DVP)** | Caso Dirección de Vialidad Provincial del Chaco (ERP, GeoVial, SiCC) | `2026/Trabajo Práctico/` | Guía `.md` lista + `TPI Parte 2.pdf` |
| **Cuestionarios** | Resoluciones de Aplicación de Recursos y Seguridad/Auditoría | `2026/Cuestionarios de Autoestudio/` | **Consolidados** en `.md` |
| **Lab Checkmk** | Monitoreo con Checkmk Raw 2.3 en Docker + `http_ping.py` | `otros/labs/cmk/` | Funcional (pendiente mover a `content/labs/`) |

---

## 3. Especificaciones Activas (`docs/specs/`)

1. **[01-reestructuracion-y-resguardo-legacy.md](specs/01-reestructuracion-y-resguardo-legacy.md)** — *Estado: En revisión*. Define el resguardo previo en `legacy/`, migración a `content/` y `assets/`, extracción de Base64 y limpieza de `.gitignore`.
2. **[02-unificacion-toolchain-pandoc.md](specs/02-unificacion-toolchain-pandoc.md)** — *Estado: En revisión*. Define la fusión de `compilar*.sh` + `md2pdf` + `mdnorm` + `estilos/` dentro de `toolchain/` (LuaLaTeX + EPUB3, autocontenido sin `~/.local/share/pandoc`, wrapper en `bash` sin requerir `zsh` ni fallar si falta `diff`).
3. **[03-consolidacion-unidades-y-ci-cd.md](specs/03-consolidacion-unidades-y-ci-cd.md)** — *Estado: En revisión*. Define el plan de redacción/unificación de Unidades I, II, IV y V, y el pipeline de GitHub Actions (Artifacts + Releases).

---

## 4. Tablero de Pendientes y Decisiones Abiertas

### Decisiones pendientes de validación del equipo (bloqueantes para ejecutar Spec 01/02/03)

- [ ] **14 PDFs/DOCX de cátedra sin `.md`** (`TPI Parte 2.pdf`, `U1-Desarrollo de los temas-1.pdf`, `TP1 - Alineamiento de SI-TI.pdf`, enunciados): definir si se resguardan temporalmente en `legacy/referencias-pdf/`, se convierten antes a `.md`, o se quitan del índice con `git rm --cached` quedando solo en disco local.
- [ ] **Archivo histórico `2025/` y `APUNTE 2 parcial.md`**: confirmar su alojamiento temporal en `legacy/archivo-2025/` mientras se extraen las unidades faltantes.
- [ ] **Tipografía estándar en `toolchain/`**: elegir entre `Libertinus Serif` + `Inter` + `JetBrains Mono` (actual en Unidades III y VI) o `Latin Modern Roman` (default en `estilos/`).
- [ ] **Numeración oficial 2026 de Unidades II, IV y V**: confirmar el orden exacto de *Provisión*, *Mantenimiento*, *Desarrollo* y *Seguimiento/Control* en el programa 2026.

### Próximas tareas técnicas en cola

- [ ] Ejecutar **Fase 0 (Spec 01)**: crear `legacy/` y mover allí `script conversor/`, `script normalizador/`, `estilos/` y `2026/herramientas/` (no borrar `legacy/` hasta entender todo el código y tener el script único validado).
- [ ] Ejecutar **Fases 1 a 3 (Spec 01)**: migrar a `content/` y `assets/`, extraer las 62 imágenes Base64 de `APUNTE 2 parcial.md` y aplicar el nuevo `.gitignore` desversionando los PDFs/EPUBs generados.
- [ ] Implementar **Spec 02**: construir `toolchain/bin/mdnorm`, `toolchain/bin/md2pdf` (`--pdf`, `--epub`, `--all`) y `toolchain/pandoc/`.
- [ ] Implementar **Spec 03**: configurar `.github/workflows/` y consolidar las unidades faltantes.

---

## 5. Bitácora de Sesiones

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
