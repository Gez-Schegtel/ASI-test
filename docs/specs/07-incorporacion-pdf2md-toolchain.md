# Spec 07 — Incorporación del Conversor Inverso `pdf2md` al Toolchain (`toolchain/bin/pdf2md`)

* **Estado**: Implementada (2026-11-09)
* **Fecha**: 2026-11-09
* **Alcance**: Incorporación del script `pdf2md` dentro de `toolchain/bin/pdf2md`, portando su envoltorio de `zsh` a `bash` estándar e integrándolo con el almacén único `assets/` del repositorio.

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
   * **Extracción limpia hacia `assets/`**: Cuando el archivo de salida se ubica dentro del árbol del repositorio y existe `$REPO_ROOT/assets/`, las imágenes nuevas extraídas del PDF se guardan en `$REPO_ROOT/assets/<nombre>_img_<N>.png` y se referencian mediante su ruta relativa desde el `.md`, evitando dejar archivos `.png` sueltos dentro de `content/` (lo cual haría fallar el job `lint` de CI).
   * **Reconocimiento de emojis (`Noto Color Emoji`)**: Los bitmaps de emojis incrustados por LuaLaTeX se restituyen como caracteres Unicode en el texto en lugar de extraerse como imágenes.
3. **Dependencias del sistema (uso local para ingesta de PDFs)**:
   * `mutool` (`mupdf-tools`), `python3`, `python3-lxml`, `python3-pdfminer`, `python3-pil` y `fonts-noto-color-emoji`.
   * *(Nota: como `pdf2md` es una herramienta de ingesta/autoria local y no se ejecuta durante la compilación de `.md` $\rightarrow$ `.pdf`/`.epub` en GitHub Actions, no es necesario agregar `mupdf-tools` ni paquetes de Python a `toolchain/Dockerfile`, manteniendo liviana la imagen de CI).*
