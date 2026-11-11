# Spec 02 — Unificación y Autocontención del Toolchain (`toolchain/`)

* **Estado**: Implementada (2026-11-06 — `toolchain/` creado y validado con `Libertinus Serif`, `Inter` y `JetBrains Mono` embebidas en `toolchain/pandoc/fonts/`)

* **Fecha**: 2026-11-06

* **Alcance**: Análisis comparativo de los scripts resguardados en `legacy/` y diseño de una arquitectura única y autocontenida en `toolchain/` para normalización (`mdnorm`) y compilación editorial a PDF/EPUB (`md2pdf` / compilador unificado).

---

## 1. Diagnóstico Técnico de las Herramientas Actuales (en `legacy/`)

Actualmente tenemos dos pipelines con fortalezas complementarias que debemos fusionar en un único estándar:

| Característica | `2026/herramientas/` (`compilar.sh` + `compilar-epub.sh`) | `estilos/` + `md2pdf` + `mdnorm` |
| :--- | :--- | :--- |
| **Intérprete shell** | `bash` + `awk` + `perl` (estándar en cualquier Linux/CI) | `zsh` + `perl` (requiere instalar `zsh` en contenedores/CI) |
| **Motor LaTeX (PDF)** | `xelatex` (obliga a borrar emojis Unicode por regex) | `lualatex` (soporta emojis a color vía `Noto Color Emoji` + corte de hashes largos) |
| **Soporte EPUB** | **Sí** (`epub3` con `estilo-epub.css`, MathML/WebTeX, portada y capítulos) | **No** (solo genera PDF) |
| **Autocontención** | **Sí** (lee `header.yaml` relativo al script) | **No** (`md2pdf` exige clonar `estilos/` en `~/.local/share/pandoc`) |
| **Manejo de cabeceras** | Pisa el frontmatter de la nota con `header.yaml` | Respeta el frontmatter de cada nota sobre `metadatos.yaml` (`metadata-files`) |
| **Filtros Pandoc (Lua)** | Ninguno | **3 filtros Lua**: `preambulo.lua`, `cortar-formulas.lua`, `centrar-imagenes.lua` |
| **Callouts Obsidian** | No los traduce (salen como `[!NOTE]` literal) | `md2pdf` los traduce a citas `> **Nota**` que `estilo.tex` pinta como cajas celestes |
| **Resolución de imágenes** | Solo reemplaza `![[...]]` contra un directorio fijo (`../../assets`) | Indexa todo el repo/vault, soporta NFC/NFD, `\|derecha\|300` y limpia `![image.png]` |
| **Salida por defecto** | Carpeta `build/` separada de las fuentes | Al lado del `.md` (`nota.md` -> `nota.pdf`, mezclando fuentes y binarios) |
| **Linter / Normalizador** | No incluye | `mdnorm` (855 líneas: corrige listas, sangrías, tablas partidas, `<br>`, YAML y `\[...\]`) |

---

## 2. Arquitectura Propuesta para `toolchain/`

Siguiendo el Principio 3 de `GEMINI.md` (**Autocontención del Toolchain**: cero dependencia de `~/.local/share/pandoc`), todo el pipeline residirá en `toolchain/`:

```text
toolchain/
├── README.md                        <- Documentación técnica detallada de cada script, filtro y opción
├── bin/
│   ├── mdnorm                       <- Linter y normalizador de Markdown (modo interactivo, -y aplicar, -n/--check para CI)
│   └── md2pdf                       <- Compilador unificado autocontenido (soporta --pdf, --epub o --all; salida a build/)
└── pandoc/
    ├── defaults/
    │   ├── pdf.yaml                 <- Opciones Pandoc para PDF (pdf-engine: lualatex, metadata-files, filters)
    │   ├── epub.yaml                <- Opciones Pandoc para EPUB3 (split-level, toc, mathml, css, filters)
    │   └── metadatos.yaml           <- Valores base compartidos (lang: es, scrartcl, márgenes, colores)
    ├── fonts/
    │   ├── libertinus-serif/        <- Fuente principal embebida (Libertinus Serif)
    │   ├── inter/                   <- Fuente de títulos embebida (Inter)
    │   └── jetbrains-mono/          <- Fuente monoespaciada embebida (JetBrains Mono)
    ├── templates/
    │   ├── estilo.tex               <- Preámbulo LaTeX modular (fuentes embebidas, cajas de callouts, fallback Noto Color Emoji, fvextra, tablas)
    │   └── estilo-epub.css          <- Hoja de estilos responsiva para lectores EPUB (tablas, bloques de código, callouts, figuras)
    └── filters/
        ├── obsidian-syntax.lua      <- (Opcional/integrado) Traducción limpia en el AST de Pandoc de callouts, wikilinks e imágenes
        ├── preambulo.lua            <- Inyecta estilo.tex respetando mainfont y header-includes de cada apunte
        ├── cortar-formulas.lua      <- Parte automáticamente ecuaciones en bloque que exceden el ancho de página
        └── centrar-imagenes.lua     <- Centra figuras y soporta atributos {.izquierda}, {.derecha} y anchos
```

---

## 3. Diseño de Componentes Clave

### 3.1. Eliminación total de `~/.local/share/pandoc`

En lugar de invocar `pandoc -d estilo` (que busca en el `$HOME` del usuario), el script `toolchain/bin/md2pdf` resolverá su propia ubicación en el repositorio (`REPO_ROOT`) e invocará Pandoc pasando rutas explícitas:

```bash
pandoc \
  --defaults="$REPO_ROOT/toolchain/pandoc/defaults/pdf.yaml" \
  --resource-path="$MD_DIR:$REPO_ROOT/assets:$REPO_ROOT" \
  --output="$OUT_FILE" \
  -- "$INPUT_FILE"
```

Como `pdf.yaml` utiliza la variable nativa `${.}` de Pandoc para referenciar `${.}/metadatos.yaml` y `${.}/../filters/*.lua`, todo el sistema funcionará idénticamente en cualquier computadora Linux o contenedor de GitHub Actions apenas clonado el repositorio.

> [!NOTE]
> **Ruta a `templates/estilo.tex` en `preambulo.lua`**:
> Como `estilo.tex` se ubica canónicamente en `toolchain/pandoc/templates/estilo.tex` (en lugar de `defaults/estilo.tex`), el filtro `preambulo.lua` debe resolver la ruta base como `pandoc.path.join({ carpeta, 'templates', 'estilo.tex' })`.

### 3.2. Unificación de `md2pdf` y `compilar-epub.sh` en un solo comando

El ejecutable `toolchain/bin/md2pdf` será el **punto de entrada único de compilación** (manteniendo el nombre establecido en `GEMINI.md`), incorporando las capacidades de ambos scripts previos:

* **Formatos soportados**:

  * Por defecto genera PDF (`LuaLaTeX`).

  * Con `--epub` genera EPUB3 (usando `toolchain/pandoc/defaults/epub.yaml` y `estilo-epub.css`).

  * Con `--all` genera ambos formatos en una sola pasada de preprocesamiento.

* **Directorio de salida limpio**:

  * Por defecto escribe en `$REPO_ROOT/build/` (estructurado o plano, p. ej. `build/pdf/` y `build/epub/`, o personalizable con `-o`), evitando ensuciar `content/` con archivos binarios.

* **Traducción completa de sintaxis Obsidian/GFM y normalización en el motor Perl**:

  * Conserva el motor Perl de resolución de imágenes en `assets/` (con normalización Unicode NFC/NFD para tildes exportadas de Notion/macOS), tamaños `|400`, alineaciones `|derecha`/`|izquierda`, conversión de `[[Nota|alias]]` a texto plano y transformación de callouts `> [!NOTE]`, `> [!WARNING]`, `> [!IMPORTANT]`, `> [!EXAMPLE]` tanto para cajas LaTeX en PDF como para bloques estilizados en EPUB.

  * **Normalización de caracteres matemáticos Unicode**: Se incorpora al motor Perl la regla `s/([\x{1D400}-\x{1D7FF}])/NFKC($1)/ge;` (proveniente de `compilar.sh`), convirtiendo letras matemáticas cursivas/negritas copiadas de IA u Obsidian (`𝐴`, `𝑓`, `𝛼`) a caracteres estándar (`A`, `f`, `α`) para prevenir errores de caracteres faltantes (*Missing character*) en el motor LaTeX.

### 3.3. Mejoras a `toolchain/bin/mdnorm`

Se partirá de la base probada en `legacy/script normalizador/mdnorm`, aplicando tres mejoras clave:

1. **Portabilidad de intérprete (`bash` vs. `zsh`)**: Migrar la capa envolvente de `zsh` (que es menos de 100 líneas alrededor del núcleo de 550 líneas en `perl`) a **Bash estándar (`#!/usr/bin/env bash`)**, de modo que corra nativamente en Ubuntu/Debian/Arch/macOS y runners de GitHub Actions sin instalar `zsh`.

2. **Modo `--check` para CI**: Agregar una bandera `--check` (o extender `-n`) que devuelva código de salida distinto de `0` si un archivo `.md` no está normalizado o si referencia una imagen inexistente en `assets/`, bloqueando PRs rotos en GitHub Actions.

3. **Preservación de compatibilidad con Obsidian en imágenes**: Actualmente `mdnorm` agrega `{width=300px}` al convertir `![[foto.png|300]]`, lo cual Obsidian muestra como texto literal. Se revisará esta regla para respetar la convención de `GEMINI.md` (`![Descripción](../../assets/nombre.png)` o `![[nombre.png]]`) dejando que el ajuste fino de atributos para Pandoc ocurra en tiempo de compilación (`md2pdf`).

### 3.4. Estándar Tipográfico Unificado y Autocontenido

* **Tipografía embebida en el repositorio (`toolchain/pandoc/fonts/`)**: Se incluyen directamente en el repositorio los archivos `.ttf` (variantes Regular, Italic, Bold y BoldItalic) de **`Libertinus Serif`** (cuerpo), **`Inter`** (títulos `scrartcl`) y **`JetBrains Mono`** (código), cargados por ruta desde `preambulo.lua` + `estilo.tex` con respaldo `Noto Color Emoji` y `DejaVu Sans` vía `luaotfload`. Así no se depende de que estén disponibles en el gestor de paquetes de cada distribución Linux.

* **Cabecera mínima en cada `.md`**: Limpiar los frontmatters largos repetidos en cada nota (`header-includes`, fuentes y geometrías duplicadas) para que vivan centralizados en `toolchain/pandoc/defaults/metadatos.yaml` y `estilo.tex`, dejando en cada apunte únicamente `title`, `subtitle`, `author`, `date`, `toc: true` y `numbersections: true`.

---

## 4. Decisiones Resueltas

1. **Nombre del ejecutable unificado**: Se mantiene `toolchain/bin/md2pdf` con soporte para `--pdf`, `--epub` y `--all`.

2. **Portabilidad a Bash**: Se migró el wrapper externo de `mdnorm` y `md2pdf` de `zsh` a `bash`, conservando el motor Perl completo.

3. **Fuentes por defecto embebidas**: Se estandarizó `Libertinus Serif` + `Inter` + `JetBrains Mono` alojadas en `toolchain/pandoc/fonts/` para garantizar autocontención en cualquier distribución Linux y en GitHub Actions.
