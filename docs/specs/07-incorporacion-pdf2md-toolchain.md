# Spec 07 — Incorporación del Conversor Inverso `pdf2md` al Toolchain (`toolchain/bin/pdf2md`)

* **Estado**: Implementada y Actualizada (2026-11-11)

* **Fecha**: 2026-11-09 (Actualizada: 2026-11-11)

* **Alcance**: Incorporación y sincronización de las mejoras avanzadas del script `pdf2md` dentro de `toolchain/bin/pdf2md`, portando su envoltorio de `zsh` a `bash` estándar, integrándolo con el almacén único `assets/` del repositorio, resolviendo colisiones mediante hash y soportando cuadrículas de tablas complejas, títulos desde outlines, `\needspace` y mitigación del límite de argumentos del kernel.

---

## 1. Propósito y Contexto (`AS-IS`)

1. **Necesidad en el repositorio**:

   * El repositorio recibe frecuentemente material de cátedra, enunciados, presentaciones o apuntes previos en formato `.pdf` que deben convertirse a Markdown editable (`.md`) para cumplir los Principios 1 y 2 de `GEMINI.md` (**Git es exclusivamente para fuentes** y **Cero artefactos binarios en Git**).

   * Asimismo, se requiere poder recuperar de forma fiel el Markdown original (incluyendo cabecera YAML, tablas multipágina, fórmulas LaTeX `$...$` y `$$...$$`, bloques de código con lenguaje, cuadros de cita `>`, enlaces, emojis `Noto Color Emoji` e imágenes con atributos) a partir de PDFs compilados con el estilo del proyecto.

2. **Estado en scripts personales (`~/.mis-scripts/common/pdf2md`)**:

   * El script original utiliza un envoltorio en `zsh` alrededor de un motor en Python 3 (`mutool` + `lxml` + `pdfminer` + `Pillow`) que reconstruye la estructura completa del documento y extrae las imágenes nuevas al lado del archivo `.md`.

---

## 2. Diseño e Integración en `toolchain/` (`TO-BE`)

Se incorpora el ejecutable autocontenido [`toolchain/bin/pdf2md`](../../toolchain/bin/pdf2md) siguiendo las convenciones de `toolchain/bin/mdnorm` y `toolchain/bin/md2pdf`:

1. **Envoltorio en Bash estándar (`#!/usr/bin/env bash`)**:

   * Al igual que en la Spec 02 para `mdnorm` y `md2pdf`, se migra la capa de opciones (`-y`/`--yes`, `-h`/`--help`, `-o`/`--output`), validación de dependencias y bucle de archivos de `zsh` a `bash`, manteniendo intacto el motor de conversión en Python 3.

2. **Integración automática con `assets/` (Principio 4 de `GEMINI.md`)**:

   * **Deduplicación contra `assets/`**: Al indexar imágenes existentes por hash MD5 RGB (`load_local_images`), `toolchain/bin/pdf2md` escanea automáticamente tanto la carpeta del PDF como el almacén central `$REPO_ROOT/assets/`. Si una imagen del PDF ya existe en `assets/`, enlaza directamente a ese archivo sin duplicarlo.

   * **Extracción limpia hacia `assets/`**: Cuando el archivo de salida se ubica dentro del árbol del repositorio y existe `$REPO_ROOT/assets/`, las imágenes nuevas extraídas del PDF se guardan directamente en `$REPO_ROOT/assets/` y se referencian mediante su ruta relativa desde el `.md`, evitando dejar archivos `.png` sueltos dentro de `content/` (lo cual violaría las reglas de `GEMINI.md` y haría fallar el job `lint` de CI).

   * **Prevención y resolución de colisiones (`resolve_asset_filename`)**:

     * *Slugificación*: el nombre base se normaliza mediante `slugify_image_stem` (eliminando acentos, caracteres especiales y limitando a 40 caracteres limpios).

     * *Deduplicación por contenido*: si el archivo candidato inicial (`<slug>_img_<N>.png`) ya existe en `assets/`, se calcula el hash MD5 RGB del archivo existente y se compara con el del PDF. Si son idénticos, se reutiliza el archivo sin sobrescribirlo ni duplicarlo.

     * *Resolución de colisiones por contenido distinto*: si ya existe un archivo con ese nombre pero su contenido es diferente, se genera un sufijo direccionado por contenido con los primeros 6 caracteres hexadecimales del hash MD5 (`<slug>_img_<N>_<hash[:6]>.png`). Si existieran múltiples colisiones secuenciales, se añade un contador secundario. Esto garantiza que ningún recurso gráfico previo en `assets/` sea jamás sobrescrito o corrompido, preservando la integridad de ambos documentos.

   * **Notificaciones claras en consola**:

     * Al extraer una imagen y guardarla en `assets/`, el script emite un mensaje informando el nombre con el que se guardó y su ubicación: `📷 Imagen guardada en la carpeta assets/: <nombre>`.

     * En caso de resolver una colisión, notifica al usuario: `⚠️ Colisión detectada: imagen guardada en la carpeta assets/ como '<nombre>'`.

   * **Reconocimiento de emojis (`Noto Color Emoji`)**: Los bitmaps de emojis incrustados por LuaLaTeX se restituyen como caracteres Unicode en el texto en lugar de extraerse como imágenes.

   * **Fidelidad estricta con el motor original y mejoras avanzadas**:

     * Reconstrucción sintáctica integral: cabeceras YAML, delimitadores matemáticos `$..$`, bloques de código cercados con sintaxis, citas y listas anidadas.

     * **Cuadrículas y tablas complejas (*grid tables*)**: Soporte para reconstruir tablas con celdas multilínea originadas en Google Docs, Microsoft Word, LibreOffice Writer y Pandoc.

     * **Jerarquía de títulos mediante *outlines***: Extracción y correspondencia de niveles `#`, `##`, `###` a partir del árbol de marcadores del PDF (`doc.get_outlines()`).

     * **Inyección de `\needspace`**: Prevención de saltos de página huérfanos antes de figuras e imágenes.

     * **Superíndices y subíndices**: Detección de caracteres elevados y rebajados y conversión a sintaxis Pandoc (`^...^`, `~...~`).

     * **Detección de PDFs escaneados**: Diagnóstico de documentos sin capa vectorial o con tipografías no compatibles.

     * **Invocación robusta vía `stdin`**: El código de Python (~150 KB) se transmite al intérprete mediante `python3 - "$archivo" "$temporal" <<< "$CONVERTIR_PY"` en lugar de `python3 -c`, eludiendo de manera segura el límite del kernel de Linux `MAX_ARG_STRLEN` (128 KiB).

     * **Heurísticas avanzadas de títulos, índices y saltos de línea**:

       * Detección y reconstrucción de índices de títulos no numerados (`# Título {-}`) y localización del primer título posterior (`toc_first_key`) con inferencia de `toc-depth`.

       * Detección automática de la clase KOMA-Script `documentclass: scrartcl` al combinar texto en serif con títulos sans-serif.

       * Detección de títulos `\paragraph*` convertidos por estilo a `0.0.0.1. * Título` y restitución limpia a `#### Título {-}` con `numbersections`.

       * Función `next_number(a, b)` para preservar saltos de línea intencionales en numeraciones consecutivas aún cuando la línea anterior alcance el margen derecho.

       * **Interlineado dinámico adaptativo (`line_step`)**: En documentos que no provienen de LaTeX con interlineado ampliado (por ejemplo, interlineado 1,5 en Google Docs: 19 pt con letra de 11 pt), se adopta el espaciado vertical predominante real del documento (`line_step = max(line_step, steps.most_common(1)[0][0])`) para evitar que líneas consecutivas del mismo párrafo se separen erróneamente en párrafos independientes.

       * **Títulos centrados extensos en carátulas (`center_block`)**: Se optimiza el umbral horizontal (`left_margin + 5.0` en vez de `+ 15.0`) para reconocer títulos centrados largos cuyos extremos se aproximan a los márgenes sin comenzar alineados a la izquierda.

3. **Herramienta de uso local exclusivo (Principio 2 y 3 de `GEMINI.md`)**:

   * `pdf2md` es una herramienta auxiliar para ingesta, extracción y autoría local. **No interviene en el pipeline de CI/CD ni en la compilación de releases**, manteniendo la imagen Docker editorial libre de dependencias pesadas innecesarias (`mutool`, `python3-pdfminer`, `python3-lxml`).

4. **Dependencias del sistema (uso local para ingesta de PDFs)**:

   * `mutool` (`mupdf-tools`), `python3`, `python3-lxml`, `python3-pdfminer`, `python3-pil` y `fonts-noto-color-emoji`.

   * *(Nota: como `pdf2md` es una herramienta de ingesta/autoria local y no se ejecuta durante la compilación de `.md` $\rightarrow$ `.pdf`/`.epub` en GitHub Actions, no es necesario agregar `mupdf-tools` ni paquetes de Python a `toolchain/Dockerfile`, manteniendo liviana la imagen de CI).*
