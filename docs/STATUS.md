# STATUS.md — Estado Vivo y Bitácora del Repositorio (ASI)

> [!IMPORTANT]
> Este archivo es la **fuente de verdad viva y bitácora histórica** del repositorio de **Administración de Sistemas de Información (ASI)** — UTN FRRe. Debe consultarse al inicio de cada sesión y mantenerse estrictamente actualizado tras cada cambio estructural, de contenido o de *tooling*.

* **Última actualización**: `2026-11-11`

* **Fase actual**: `Infraestructura Técnica, Sincronización de Toolchain (mdnorm, md2pdf, pdf2md, estilo.tex), Organización por Unidad, Imagen Docker GHCR y Publicación en Releases 100% Completadas -> En espera de material de estudio para Spec 03-Parte A`

* **Rama activa**: `changes/juani` (`myfork` — `juani-b/ASI`)

---

## 1. Radiografía Actual del Repositorio (`AS-IS` vs. `TO-BE`)

| Dominio | Ubicación Actual (`AS-IS`) | Ubicación Canónica (`TO-BE`) | Estado Actual |
| :--- | :--- | :--- | :--- |
| Protocolo rector | `GEMINI.md` | `GEMINI.md` | **Activo y actualizado** |
| Estado vivo, guías y specs | `docs/STATUS.md`, `docs/GUIA_SUBIDA_APUNTES.md` + `docs/specs/` | `docs/` | **Specs 01, 02, 03-B, 04, 05, 06 y 07 implementadas** + Guía de subida lista; Spec 03-A a la espera de material |
| Resguardo temporal | `legacy/` (`estilos/`, `script *`, `herramientas-2026/`, `enunciados-cuestionarios/`, `archivo-2025/`) | *(Se eliminará cuando el equipo dé el visto bueno final)* | **Resguardado** |
| Apuntes y cuestionarios por Unidad | `content/unidades/` (`Unidad 0/`, `Unidad I/`, `Unidad III/`, `Unidad VI/`) | `content/unidades/<Unidad X>/` | **Organizado por Unidad y normalizado** |
| Trabajos prácticos y guías | `content/trabajo práctico/` (`parte 1/`, `parte 2/`) | `content/trabajo práctico/` | **Migrado y 100% en `.md`** |
| Laboratorios y talleres | `content/labs/` (`cmk/`, `taller-1/`) | `content/labs/` | **Migrado** |
| Recursos gráficos | `assets/` (346 archivos, cero Base64) | `assets/` (único almacén sin Base64) | **Unificado al 100%** |
| Toolchain editorial | `toolchain/Dockerfile`, `toolchain/bin/` (`mdnorm`, `md2pdf`, `mkrelease`, `pdf2md`) y `toolchain/pandoc/` | `toolchain/` | **Implementado y validado** (salida jerárquica en `build/` + imagen en `ghcr.io`) |
| Plantillas y prompts | `plantillas/` | `plantillas/` | **En su lugar** |
| Pipelines CI/CD | `.github/workflows/editorial-ci.yml` | `.github/workflows/` | **Implementado con imagen GHCR (`asi-toolchain`), Release continuo (`apuntes-al-dia`) y snapshots históricos (`v*`) (Spec 06)** |

### Métricas Auditadas del Árbol Actual (Post-Spec 06)

* **Archivos binarios PDF/EPUB/DOCX en el repositorio**: **0 archivos** (regla de cero artefactos activa en `.gitignore`).

* **Imágenes Base64 incrustadas en Markdown**: **0**.

* **Recursos gráficos centralizados en `assets/`**: **347 archivos**.

* **Toolchain autocontenido (`toolchain/`)**:

  * `toolchain/Dockerfile`: Imagen Docker (`ghcr.io/gez-schegtel/asi-toolchain`) basada en `ubuntu:24.04` con Pandoc, TeX Live (`LuaLaTeX`) y el caché global de fuentes de `luaotfload` (`/var/cache/texmf-var`) precalentado.

  * `toolchain/bin/mdnorm`: Linter y normalizador en Bash + Perl con soporte `-y`, `-v` y `--check` (`-n`) para CI.

  * `toolchain/bin/md2pdf`: Compilador unificado en Bash + Perl + Pandoc con soporte `--pdf`, `--epub` y `--all`, salida limpia a `build/`, resolución automática de `assets/` y normalización `NFKC` de letras matemáticas Unicode.

  * `toolchain/bin/mkrelease`: Empaquetador y publicador atómico de GitHub Releases en Bash + Perl + `gh`, con generación de `.zip` por Unidad/Práctica, slugs ASCII para `.pdf`/`.epub` individuales, índice Markdown ordenado en tablas, actualización en el lugar (`--clobber`) de `apuntes-al-dia` (`Latest`) y soporte `--historical` para tags `v*`.

  * `toolchain/bin/pdf2md`: Conversor inverso de PDF a Markdown en Bash + Python 3 + `mutool` con recuperación de cabecera YAML, tablas, fórmulas, citas, bloques de código, emojis y deduplicación/extracción hacia `assets/`.

  * `toolchain/pandoc/`: `defaults/pdf.yaml`, `defaults/epub.yaml`, `defaults/metadatos.yaml` (`scrartcl` por defecto), `fonts/` (`Libertinus Serif`, `Inter` y `JetBrains Mono` embebidas en el repositorio), `templates/estilo.tex`, `templates/estilo-epub.css` y los 3 filtros Lua (`preambulo.lua`, `cortar-formulas.lua`, `centrar-imagenes.lua`).

---

## 2. Estado de Cobertura Académica y Práctica

| Componente / Unidad | Tema Principal | Ubicación Actual | Estado Editorial |
| :--- | :--- | :--- | :--- |
| **Unidad 0** | Conceptos previos e introducción | `content/unidades/Unidad 0/` | **Completa** (`Conceptos Previos.md`) |
| **Unidad I** | Los SI en la Empresa, Cadena de Valor y Planificación Estratégica SI/TI | `content/unidades/Unidad I/` | **Completa** (Apunte teórico + Temario + Aclaraciones sobre la Unidad I en raíz; Cuestionario resuelto y 4 borradores en `Unidad I/borradores/`) |
| **Unidad II** | Subsistema de Provisión (RRHH y SI/TI) *(orden 2026 a confirmar)* | `legacy/archivo-2025/2025/u4/` + `legacy/archivo-2025/APUNTE 2 parcial.md` | En crudo (ya limpio de Base64 y PDFs pasados a `.md`) |
| **Unidad III** | Subsistema de Aplicación (RRHH, RUO y Rendimiento/Capacidad) | `content/unidades/Unidad III/` | **Completa** (Apunte teórico + Temario + Cuestionario de autoestudio resuelto) |
| **Unidad IV** | Mantenimiento y Desarrollo de RRHH *(orden 2026 a confirmar)* | `legacy/archivo-2025/2025/u6/` + `legacy/archivo-2025/APUNTE 2 parcial.md` | En crudo (ya limpio de Base64) |
| **Unidad V** | Subsistema de Seguimiento / Control (Monitores, Benchmarking, Amdahl) | `legacy/archivo-2025/2025/par_1/u2/` | Fragmentado |
| **Unidad VI** | Seguridad y Auditoría de SI/TI (Riesgos, ALE, Control Interno) | `content/unidades/Unidad VI/` | **Completa** (Apunte teórico + Temario + Cuestionario de autoestudio resuelto) |
| **Trabajo Práctico Integrador (Parte 1)** | Alineamiento Estratégico y Caso DVP Parte 1 | `content/trabajo práctico/parte 1/` | **Completo en `.md`** (`Escenario.md`, `Trabajo Práctico - Parte 1.md`, `Explicación - Trabajo Práctico - Parte 1.md`) |
| **Trabajo Práctico Integrador (Parte 2)** | Caso DVP Parte 2 (Organigrama, Competencias y Presentación) | `content/trabajo práctico/parte 2/` | **Completo en `.md`** (`Explicación del TPI.md`, `Nuevo Organigrama.pdf`, etc.) |
| **Lab Checkmk** | Monitoreo con Checkmk Raw 2.3 en Docker + `http_ping.py` | `content/labs/cmk/` y `content/labs/taller-1/` | **Migrado y funcional** |

---

## 3. Especificaciones Activas (`docs/specs/`)

1. **[01-reestructuracion-y-resguardo-legacy.md](specs/01-reestructuracion-y-resguardo-legacy.md)** — *Estado: **Implementada** (2026-11-06)*. Resguardo en `legacy/`, migración a `content/` y `assets/`, conversión de los 14 PDFs/DOCX de cátedra a `.md` (Opción A), extracción de las 62 imágenes Base64 y nuevo `.gitignore`.

2. **[02-unificacion-toolchain-pandoc.md](specs/02-unificacion-toolchain-pandoc.md)** — *Estado: **Implementada** (2026-11-06)*. Construcción de `toolchain/bin/mdnorm`, `toolchain/bin/md2pdf` (`--pdf`, `--epub`, `--all`), `toolchain/pandoc/` (`defaults/`, `fonts/`, `templates/`, `filters/`) y `toolchain/README.md`, 100% autocontenido y con `Libertinus Serif`, `Inter` y `JetBrains Mono` embebidas en `toolchain/pandoc/fonts/`.

3. **[03-consolidacion-unidades-y-ci-cd.md](specs/03-consolidacion-unidades-y-ci-cd.md)** — *Estado: **Parte B (CI/CD) implementada** (2026-11-06); **Parte A (Unidades faltantes)** en espera de material de estudio*. Pipeline `.github/workflows/editorial-ci.yml` activo para `lint` (`mdnorm --check` + control de binarios/Base64) y `build` (`md2pdf --all` -> Artifacts y GitHub Releases).

4. **[04-organizacion-unidades-y-artefactos.md](specs/04-organizacion-unidades-y-artefactos.md)** — *Estado: **Implementada** (2026-11-06)*. Agrupación por Unidad en `content/unidades/<Unidad X>/` (uniendo teoría y cuestionarios de cada unidad), preservación de subcarpetas en `build/` desde `toolchain/bin/md2pdf` y empaquetado de Artifacts separados por Unidad y Práctica (Modalidad B) en GitHub Actions.

5. **[05-imagen-docker-toolchain-ghcr.md](specs/05-imagen-docker-toolchain-ghcr.md)** — *Estado: **Implementada** (2026-11-06)*. Creación de `toolchain/Dockerfile` con Pandoc, LuaLaTeX y caché global de `luaotfload` (`/var/cache/texmf-var`) precalentado, e integración con GitHub Container Registry (`ghcr.io/gez-schegtel/asi-toolchain`) en `.github/workflows/editorial-ci.yml`.

6. **[06-publicacion-ordenada-en-releases.md](specs/06-publicacion-ordenada-en-releases.md)** — *Estado: **Implementada** (2026-11-06)*. Arquitectura dual gestionada por `toolchain/bin/mkrelease`: un **único Release continuo principal (`apuntes-al-dia`, marcado como `Latest` en `/releases/latest`)** actualizado atómicamente en el lugar (`--clobber`) con tablas y paquetes `.zip` separados por Unidad/Práctica, más **Releases históricos inmutables** para tags `v*`.

7. **[07-incorporacion-pdf2md-toolchain.md](specs/07-incorporacion-pdf2md-toolchain.md)** — *Estado: **Implementada y Sincronizada** (2026-11-11)*. Incorporación y actualización de `toolchain/bin/pdf2md` (Bash + Python 3 + `mutool`) con soporte de *grid tables*, títulos por *outlines*, `\needspace`, invocación por stdin y extracción/deduplicación/resolución de colisiones automática hacia `assets/`.

---

## 4. Tablero de Pendientes y Decisiones Abiertas

### Decisiones resueltas

- [x] **14 PDFs/DOCX de cátedra sin `.md`**: Resuelto con **Opción A** (convertidos todos a `.md` y desversionados los binarios de Git).

- [x] **Archivo histórico `2025/` y `APUNTE 2 parcial.md`**: Alojados en `legacy/archivo-2025/` limpios de Base64 y binarios.

- [x] **Ubicación de `estilo.tex` y normalización Perl en Spec 02**: `estilo.tex` en `toolchain/pandoc/templates/estilo.tex` y motor Perl con normalización `NFKC` de letras matemáticas Unicode.

- [x] **Tipografía estándar en `toolchain/`**: Embebidas `Libertinus Serif` (texto), `Inter` (títulos) y `JetBrains Mono` (código) directamente en `toolchain/pandoc/fonts/` y cargadas por defecto desde `estilo.tex` + `preambulo.lua` sin depender del gestor de paquetes de cada distribución Linux.

- [x] **Organización por Unidad y Modalidad de Artifacts en Spec 04**: Implementada **Modalidad B** y compilación de **todos** los `.md` de `content/unidades/` y `content/practica/`.

- [x] **Eliminación de tiempos de instalación de TeX Live en CI/CD (Spec 05)**: Implementada imagen Docker precompilada en GitHub Container Registry (`ghcr.io/gez-schegtel/asi-toolchain`) con caché de fuentes `luaotfload` precalentado.

- [x] **Publicación segura y sin duplicados en GitHub Releases (Spec 06)**: Reemplazo de los múltiples releases móviles por un **único Release continuo principal (`apuntes-al-dia` / `/releases/latest`)** actualizado en el lugar mediante `toolchain/bin/mkrelease` (evitando enlaces `404` y copias repetidas por commit) junto con **Releases históricos inmutables (`v*`)** para resguardar cierres de parcial/cursada.

### Decisiones pendientes (para Spec 03 - Parte A)

- [ ] **Numeración oficial 2026 de Unidades II, IV y V (Spec 03)**: confirmar el orden exacto de *Provisión*, *Mantenimiento*, *Desarrollo* y *Seguimiento/Control* en el programa 2026.

### Próximas tareas técnicas en cola

- [x] Ejecutar **Fase 0 (Spec 01)**: crear `legacy/` y resguardar `script conversor/`, `script normalizador/`, `estilos/` y `2026/herramientas/`.

- [x] Ejecutar **Fases 1 a 3 (Spec 01)**: migrar a `content/` y `assets/`, convertir los 14 documentos de cátedra a `.md`, extraer las 62 imágenes Base64 de `APUNTE 2 parcial.md` y aplicar el nuevo `.gitignore`.

- [x] Implementar **Spec 02**: construir `toolchain/bin/mdnorm`, `toolchain/bin/md2pdf` (`--pdf`, `--epub`, `--all`) y `toolchain/pandoc/`.

- [x] Implementar **Spec 03 (Parte B)**: configurar `.github/workflows/editorial-ci.yml` (`lint` + `build` PDF/EPUB + publicación en Artifacts y Releases).

- [x] Implementar **Spec 04**: reorganizar `content/unidades/<Unidad X>/` (con sus cuestionarios) y estructurar `build/` por Unidad.

- [x] Implementar **Spec 05**: encapsular el entorno Pandoc + LuaLaTeX en `toolchain/Dockerfile` y publicarlo automáticamente en `ghcr.io/gez-schegtel/asi-toolchain`.

- [x] Implementar **Spec 06**: crear `toolchain/bin/mkrelease` para publicar y actualizar en el lugar el Release principal continuo (`apuntes-al-dia` / `/releases/latest`) organizado por Unidad + soporte de snapshots históricos (`v*`).

- [ ] Implementar **Spec 03 (Parte A)**: consolidar las unidades teóricas faltantes cuando esté listo el material de estudio.

---

## 5. Bitácora de Sesiones

### `2026-11-11` — Ingesta de Trabajo Práctico Parte 1 y Optimización Gráfica de la Matriz de Necesidades

* **Contexto**: Ingesta del documento oficial de `Trabajo Práctico - Parte 1.pdf` a Markdown editable y resolución del renderizado de la tabla de Matriz de Necesidades (Fase 3), cuya complejidad estructural y extensión (2 páginas densas con encabezados combinados verdes) desbordaban los límites del motor de tablas de LaTeX.

* **Acciones ejecutadas**:

  * **Ingesta con `toolchain/bin/pdf2md`**:

    * Descompilación directa del PDF a `content/trabajo práctico/parte 1/Trabajo Práctico - Parte 1.md`.

    * Deduplicación y enlace automático de figuras preexistentes en `assets/` (`Presentacion_img_1.png` y `Trabajo-Practico-Parte-1_img_1.png`).

  * **Renderizado y extracción vectorial de la Matriz de Necesidades (Opción A)**:

    * Rasterización a 300 DPI de las páginas 20 y 21 del PDF original mediante `mutool draw`.

    * Recorte preciso de los límites de la tabla verde:

      * `assets/TP1-Matriz-de-Necesidades_parte-1.png` (cuadro de Estrategia Organizacional y filas hasta Dir. de Logística y Mantenimiento).

      * `assets/TP1-Matriz-de-Necesidades_parte-2.png` (filas de continuación hasta Asuntos Jurídicos).

    * Sustitución en el Markdown por las dos imágenes al 100% de ancho (`{width=100%}`) separadas por `\newpage` para garantizar una paginación perfecta y máxima legibilidad en hojas A4.

  * **Normalización y verificación**:

    * Linteo con `toolchain/bin/mdnorm -y` y validación con `--check`.

    * Compilación editorial exitosa a PDF mediante `toolchain/bin/md2pdf`, verificando que la tabla ocupa el ancho completo de las páginas 14 y 15 con nitidez absoluta.

  * **Evolución editorial a "Trabajo Práctico Integrador" (TPI)**:

    * Adopción de la denominación canónica **Trabajo Práctico Integrador (TPI)** en sustitución de "Práctica" para reflejar con rigor académico el caso de la Dirección de Vialidad Provincial (DVP).

    * Actualización de `toolchain/bin/md2pdf` para que las compilaciones de `content/trabajo práctico/` se ubiquen bajo `build/Trabajo Práctico Integrador/` (`parte 1/` y `parte 2/`).

    * Actualización de `toolchain/bin/mkrelease` para publicar los bloques `TPI1` (`TPI-Parte-1-Alineamiento.zip`) y `TPI2` (`TPI-Parte-2-DVP.zip`), con resolución de rutas con fallback (`Trabajo Práctico Integrador` $\leftrightarrow$ `Práctica` $\leftrightarrow$ `Practica`).

    * Actualización de enlaces directos de descarga y atajos permanentes en `README.md` y `docs/GUIA_SUBIDA_APUNTES.md`.

### `2026-11-11` — Sincronización Integral de Mejoras en `md2pdf`, `mdnorm`, `pdf2md` y Estilos LaTeX (`enumitem`)

* **Contexto**: Sincronización de las versiones más recientes de los scripts de autoría locales (`~/.mis-scripts/common/{md2pdf, mdnorm, pdf2md}`) y estilos de Pandoc (`~/.local/share/pandoc/defaults/estilo.tex`) dentro del toolchain autocontenido del repositorio, preservando intactas las reglas de autocontención, extracción centralizada en `assets/`, deduplicación por hash, resolución de colisiones y ejecución local exclusiva de `pdf2md`.

* **Acciones ejecutadas**:

  * **Plantilla LaTeX (`toolchain/pandoc/templates/estilo.tex`)**:

    * Incorporación del paquete `enumitem` y directivas globales `\setlist{itemsep=2pt, parsep=0pt, topsep=4pt}` para unificar el espaciado vertical entre ítems de listas numeradas y viñetas con el espaciado de párrafos, conservando las fuentes embebidas (`Libertinus Serif`, `Inter`, `JetBrains Mono`) y los fallbacks de símbolos/emojis (`DejaVu Sans Mono`, `Noto Color Emoji`).

  * **Compilador editorial (`toolchain/bin/md2pdf`)**:

    * Integración de mejoras para listas anidadas/indentadas, separación de ítems adyacentes pegados, validación de codificación UTF-8 con `iconv` antes de procesar, y optimización de comparación `cmp -s` previa a la recompilación.

    * Preservación del envoltorio Bash estándar, banderas `--pdf`/`--epub`/`--all`, cálculo automático de carpetas jerárquicas en `build/` y exportación de `OSFONTDIR`.

  * **Linter y normalizador (`toolchain/bin/mdnorm`)**:

    * Tratamiento de bloques de código indentados con espacios, conservación estricta de tags `<br>` en celdas de tablas complejas (`html_prof`), normalización de fórmulas LaTeX y espaciado consistente de listas (interlínea en blanco entre ítems).

    * Normalización completa de todos los apuntes del repositorio (`content/**/*.md`) mediante `./toolchain/bin/mdnorm -y`. Auditoría con `./toolchain/bin/mdnorm --check` validando salida limpia (`exit 0`) en todos los archivos.

  * **Herramienta de ingesta local (`toolchain/bin/pdf2md`)**:

    * Integración del motor Python ampliado (~150 KB) con reconstrucción de tablas tipo cuadrícula (*grid tables* de Word, Docs y LibreOffice), títulos jerárquicos basados en *outlines* del PDF (`doc.get_outlines()`), inserción de `\needspace` para evitar figuras huérfanas, superíndices, subíndices y detección de PDFs escaneados.

    * **Sincronización avanzada de heurísticas (segunda pasada)**:

      * Detección y reconstrucción de índices de títulos no numerados (`# Título {-}`) marcados como `section*` por LaTeX, localizando automáticamente el primer título posterior (`toc_first_key`) y calculando la profundidad adecuada (`toc-depth`).

      * Inferencia automática de la clase `documentclass: scrartcl` al comparar tipografías con serifa en cuerpo y sin serifa en encabezados.

      * Función `next_number(a, b)` para preservar saltos de línea intencionales en numeraciones consecutivas aún cuando la línea anterior alcance el margen.

      * Reversión de `0.0.0.1. * Título` a `#### Título {-}` para títulos `\paragraph*` y `\subparagraph*`.

      * Prevención de falsas fusiones en títulos multilínea que colindan con el destino de un nuevo encabezado.

      * **Interlineado dinámico adaptativo y umbral de carátulas (tercera pasada)**:

        * Detección dinámica de interlineado en documentos no-LaTeX (`line_step = max(line_step, steps.most_common(1)[0][0])`), evitando que párrafos con interlineado 1,5 o doble (e.g. Google Docs o Word) se fracturen en fragmentos aislados por tolerancias rígidas.

        * Ajuste del umbral horizontal en `center_block` (`left_margin + 5.0` en lugar de `+ 15.0`) permitiendo reconocer títulos centrados largos en carátulas que se aproximan a los márgenes sin comenzar alineados a la izquierda.

        * Inspección minuciosa de `~/.mis-scripts/common/` y `~/.local/share/pandoc/`, comprobando que `md2pdf`, `mdnorm` y las configuraciones de Pandoc no tuvieron modificaciones adicionales, preservando al 100% las adaptaciones del repositorio.

    * **Resolución del límite de argumentos del kernel**: Transmisión del código de Python mediante `stdin` (`python3 - "$archivo" "$temporal" <<< "$CONVERTIR_PY"`) superando el límite Linux `MAX_ARG_STRLEN` (128 KiB).

    * **Ampliación de regex de XObjects**: Ajuste para reconocer nombres con puntos y guiones (`/([a-zA-Z0-9_.-]+)\s+Do\b`) generados por motores como ReportLab.

    * **Preservación total de políticas del repositorio**: Exportación de `REPO_ASSETS_DIR`, extracción directa de nuevas imágenes hacia `assets/`, deduplicación por MD5 RGB contra `assets/`, resolución automática de colisiones agregando sufijo `_{hash[:6]}` y avisos detallados en consola (`📷 Imagen guardada...`, `⚠️ Colisión detectada...`).

    * **Aclaración de alcance**: Documentación explícita en `toolchain/README.md`, `docs/GUIA_SUBIDA_APUNTES.md` y `docs/specs/07-incorporacion-pdf2md-toolchain.md` de que `pdf2md` es una herramienta de uso local exclusivo para ingesta que no afecta la imagen Docker ni el pipeline de CI/CD.

  * **Verificación de extremo a extremo**:

    * Compilación exitosa de prueba a PDF con `md2pdf` sobre `content/unidades/Unidad 0/Conceptos Previos.md`.

    * Pruebas de ingesta y colisión con `pdf2md` en `/tmp` comprobando deduplicación, extracción a `assets/`, resolución de nombres colisionados con hash y limpieza de artefactos temporales.

### `2026-11-09` — Inclusión de Unidad 0 y Trabajo Práctico en Pipeline de Compilación y GitHub Releases

* **Contexto**: Diagnóstico y corrección del pipeline CI/CD y del empaquetador `toolchain/bin/mkrelease` ante la falta de publicación de `Unidad 0` y la reestructuración de la carpeta `content/trabajo práctico/`.

* **Causas identificadas**:

  * `toolchain/bin/mkrelease` poseía una lista estática de `bloques` que comenzaba en `Unidad I` (`U1`), omitiendo `Unidad 0` (`U0`).

  * `toolchain/bin/md2pdf` y `.github/workflows/editorial-ci.yml` enlazaban estrictamente con la ruta previa `content/practica/`, enviando los documentos de `content/trabajo práctico/` a la raíz de `build/` o salteándolos en el `find` de compilación.

* **Acciones ejecutadas**:

  * **Actualización de `toolchain/bin/mkrelease`**: adición del bloque `U0` (`Unidad 0 — Conceptos Previos e Introducción`), generación del paquete `Unidad-0-Completa.zip` y de los bloques `TP1` y `TP2` para `Practica/parte 1` y `Practica/parte 2`.

  * **Actualización de `toolchain/bin/md2pdf`**: soporte en `calcular_salida()` para `content/trabajo práctico/`, enrutando a `build/Practica/<parte X>/`.

  * **Actualización de `.github/workflows/editorial-ci.yml`**: ampliación del comando `find` para compilar `content/unidades`, `content/practica` y `content/trabajo práctico`.

  * **Verificación**: prueba exitosa con `mkrelease --dry-run` comprobando la generación de tablas, paquetes `.zip` y enlaces directos para `Unidad 0` y las partes 1 y 2 de Práctica.

### `2026-11-09` — Implementación de Spec 07: Incorporación de `toolchain/bin/pdf2md`

* **Contexto**: Para facilitar la ingesta y descompilación de documentos PDF de cátedra o apuntes históricos a Markdown editable sin violar los principios de cero binarios y almacenamiento único de imágenes, se redactó la **Spec 07** y se integró el script `pdf2md`.

* **Acciones ejecutadas**:

  * **Redacción de `docs/specs/07-incorporacion-pdf2md-toolchain.md`**: especificación de la arquitectura de descompilación, integración con `assets/`, política de prevención de colisiones y fidelidad con el script original de `~/.mis-scripts/`.

  * **Creación y evolución de `toolchain/bin/pdf2md`**:

    * Portado del envoltorio de `zsh` a `bash` estándar, validando dependencias locales (`mutool`, `python3-lxml`, `python3-pdfminer`, `python3-pil`).

    * **Enrutamiento automático hacia `assets/`**: las imágenes extraídas se guardan directamente en el almacén central `$REPO_ROOT/assets/` y se enlazan con rutas relativas limpias desde el `.md`.

    * **Prevención y resolución de colisiones (`resolve_asset_filename`)**:

      * *Slugificación*: normalización de nombres base mediante `slugify_image_stem`.

      * *Deduplicación por contenido*: si una imagen con idéntico hash MD5 RGB ya existe en `assets/`, se reutiliza evitando duplicados innecesarios.

      * *Disambiguación por hash*: si colisiona el nombre con un archivo de contenido diferente en `assets/`, genera un sufijo direccionado por contenido (`_{hash[:6]}`) sin sobrescribir nunca el archivo preexistente.

    * **Reporte en consola**: notificaciones claras al usuario indicando el nombre exacto asignado y la carpeta de destino (`📷 Imagen guardada en la carpeta assets/: <nombre>` y `⚠️ Colisión detectada: imagen guardada en la carpeta assets/ como '<nombre>'`).

    * **Fidelidad funcional total**: preservación intacta de la lógica de reconstrucción sintáctica (YAML, matemáticas, tablas multipágina, código, callouts y jerarquía de títulos) idéntica a `~/.mis-scripts/common/pdf2md`.

  * **Suite de verificación automatizada**: tests end-to-end con `md2pdf` y `pdf2md` validando extracción en `assets/`, preservación de archivos preexistentes en colisión, descompilación limpia y enlace Markdown correcto.

  * **Actualización documental**: sincronización de `GEMINI.md`, `README.md`, `toolchain/README.md`, `docs/specs/07-incorporacion-pdf2md-toolchain.md` y `docs/STATUS.md`.

### `2026-11-09` — Sincronización de Estilos Pandoc (`monoletras` / `DejaVu Sans Mono`) e Inclusión de `fonts-dejavu-mono` en Docker

* **Contexto**: Sincronización de las mejoras de estilo realizadas localmente en `~/.local/share/pandoc` hacia el `toolchain/` autocontenido del repositorio y verificación de la disponibilidad de `DejaVu Sans Mono` en Ubuntu 24.04 (`toolchain/Dockerfile`).

* **Acciones ejecutadas**:

  * **Actualización de `toolchain/pandoc/templates/estilo.tex` y `toolchain/pandoc/filters/preambulo.lua`**:

    * Definición del fallback independiente `monoletras` (`{"DejaVu Sans Mono:", "Noto Color Emoji:mode=harf;"}`) en `luaotfload` para `\setmonofont` (tanto cuando usa `JetBrains Mono` embebida como cuando una nota define otro `monofont`), de modo que los trazos de árboles (`├ └ │ ─`) y flechas (`↕`) dentro de bloques de código provengan primero de `DejaVu Sans Mono` (monoespaciada y en blanco y negro) y solo los emojis puros caigan en `Noto Color Emoji`.

    * Incorporación de la documentación completa de la Sección 9 (`caption` con `labelformat=empty`) y avisos de validación de `monofont`/`sansfont` en `preambulo.lua`.

  * **Solución de `DejaVu Sans Mono` en `toolchain/Dockerfile` (Ubuntu 24.04)**:

    * En Debian 12+ y Ubuntu 24.04 (`noble`), `DejaVuSansMono.ttf` fue separado de `fonts-dejavu-core` al paquete `fonts-dejavu-mono` (que no se instalaba al usar `--no-install-recommends`).

    * Se agregó `fonts-dejavu-mono` en `toolchain/Dockerfile`, `toolchain/README.md` y `docs/specs/05-imagen-docker-toolchain-ghcr.md`, y se incluyeron los caracteres `├─ │ └ ↕` en el bloque de código del paso de precalentamiento del `Dockerfile` para que `luaotfload` precompile también `dejavusansmono.luc` en `/var/cache/texmf-var`.

### `2026-11-06` — Refinamiento de Spec 06: Único Release Continuo (`apuntes-al-dia`) + Snapshots Históricos (`v*`)

* **Contexto**: Para evitar tanto la proliferación de releases repetidos en cada commit como el riesgo de borrar y recrear 5–8 releases separados por unidad (ventanas `404` ante fallos de red y spam de notificaciones), se evolucionó la **Spec 06** hacia una arquitectura dual gestionada por un ejecutable dedicado dentro de `toolchain/`.

* **Acciones ejecutadas**:

  * **Actualización de `docs/specs/06-publicacion-ordenada-en-releases.md`**: documentación de la estrategia dual (`apuntes-al-dia` actualizable en el lugar como `Latest` + tags `v*` como snapshots históricos inmutables).

  * **Creación y validación de `toolchain/bin/mkrelease`**:

    * Empaqueta un `.zip` por cada Unidad y Trabajo Práctico conservando los nombres originales con tildes y espacios dentro del archivo comprimido.

    * Translitera los `.pdf` y `.epub` individuales a nombres ASCII limpios (ej. `Unidad-III_-_Subsistema-de-Aplicacion.pdf`) para evitar que GitHub Releases reemplace vocales acentuadas por puntos (`Aplicaci.n.pdf`).

    * Genera un índice Markdown ordenado en tablas por Unidad y Práctica (priorizando el apunte teórico/consigna sobre presentaciones y cuestionarios) con enlaces de descarga en 1 clic.

    * Actualiza atómicamente `apuntes-al-dia` en el lugar (`gh release upload --clobber`, purga selectiva de assets obsoletos y `gh release edit --latest=true`), limpia automáticamente los tags antiguos separados (`--cleanup-legacy-tags`) y soporta `--historical` (`--latest=false`) para tags `v*`.

  * **Integración en `.github/workflows/editorial-ci.yml`** y actualización integral de `README.md`, `GEMINI.md`, `toolchain/README.md`, `docs/GUIA_SUBIDA_APUNTES.md` y `docs/STATUS.md`.

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
