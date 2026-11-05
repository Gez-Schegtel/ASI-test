# Spec 02 — Unificación y Autocontención del Toolchain (`toolchain/`)

* **Estado**: Propuesta (pendiente de revisión)
* **Fecha**: 2026-11-05
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
    │   └── metadatos.yaml           <- Valores base compartidos (lang: es, Libertinus/Latin Modern, márgenes, colores)
    ├── templates/
    │   ├── estilo.tex               <- Preámbulo LaTeX modular (cajas de callouts, fallback Noto Color Emoji, fvextra, tablas)
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

### 3.2. Unificación de `md2pdf` y `compilar-epub.sh` en un solo comando

El ejecutable `toolchain/bin/md2pdf` será el **punto de entrada único de compilación** (manteniendo el nombre establecido en `GEMINI.md`), incorporando las capacidades de ambos scripts previos:

* **Formatos soportados**:
  * Por defecto genera PDF (`LuaLaTeX`).
  * Con `--epub` genera EPUB3 (usando `toolchain/pandoc/defaults/epub.yaml` y `estilo-epub.css`).
  * Con `--all` genera ambos formatos en una sola pasada de preprocesamiento.
* **Directorio de salida limpio**:
  * Por defecto escribe en `$REPO_ROOT/build/` (estructurado o plano, p. ej. `build/pdf/` y `build/epub/`, o personalizable con `-o`), evitando ensuciar `content/` con archivos binarios.
* **Traducción completa de sintaxis Obsidian/GFM**:
  * Conserva el motor Perl de resolución de imágenes en `assets/` (con normalización Unicode NFC/NFD para tildes exportadas de Notion/macOS), tamaños `|400`, alineaciones `|derecha`/`|izquierda`, conversión de `[[Nota|alias]]` a texto plano y transformación de callouts `> [!NOTE]`, `> [!WARNING]`, `> [!IMPORTANT]`, `> [!EXAMPLE]` tanto para cajas LaTeX en PDF como para bloques estilizados en EPUB.

### 3.3. Mejoras a `toolchain/bin/mdnorm`

Se partirá de la base probada en `legacy/script normalizador/mdnorm`, aplicando tres mejoras clave:

1. **Portabilidad de intérprete (`bash` vs. `zsh`)**: Migrar la capa envolvente de `zsh` (que es menos de 100 líneas alrededor del núcleo de 550 líneas en `perl`) a **Bash estándar (`#!/usr/bin/env bash`)**, de modo que corra nativamente en Ubuntu/Debian/Arch/macOS y runners de GitHub Actions sin instalar `zsh`.
2. **Modo `--check` para CI**: Agregar una bandera `--check` (o extender `-n`) que devuelva código de salida distinto de `0` si un archivo `.md` no está normalizado o si referencia una imagen inexistente en `assets/`, bloqueando PRs rotos en GitHub Actions.
3. **Preservación de compatibilidad con Obsidian en imágenes**: Actualmente `mdnorm` agrega `{width=300px}` al convertir `![[foto.png|300]]`, lo cual Obsidian muestra como texto literal. Se revisará esta regla para respetar la convención de `GEMINI.md` (`![Descripción](../../assets/nombre.png)` o `![[nombre.png]]`) dejando que el ajuste fino de atributos para Pandoc ocurra en tiempo de compilación (`md2pdf`).

### 3.4. Estándar Tipográfico Unificado

* **Tipografía base**: Configurar un esquema consistente (por ejemplo, `Libertinus Serif` + `Inter` + `JetBrains Mono` como usan hoy los apuntes de 2026, con fallback automático a `Latin Modern Roman` si una fuente opcional no está instalada localmente, más `Noto Color Emoji` y `DejaVu Sans` vía `luaotfload`).
* **Cabecera mínima en cada `.md`**: Limpiar los frontmatters largos repetidos en cada nota (`header-includes`, fuentes y geometrías duplicadas en `Unidad III` y `Unidad VI`) para que vivan centralizados en `toolchain/pandoc/defaults/metadatos.yaml`, dejando en cada apunte únicamente `title`, `subtitle`, `author`, `date`, `toc: true` y `numbersections: true`.

---

## 4. Decisiones Abiertas para Revisar con el Equipo

1. **Nombre del ejecutable unificado**: `GEMINI.md` define `toolchain/bin/md2pdf` y `toolchain/bin/mdnorm`. ¿Mantenemos el nombre `md2pdf` agregándole la bandera `--epub` / `--all`, o preferís sumar un alias corto (ej. `toolchain/bin/mdbuild` con symlink `md2pdf`)?
2. **Portabilidad a Bash**: ¿Estás de acuerdo en pasar el wrapper externo de `mdnorm` y `md2pdf` de `zsh` a `bash` (manteniendo intacto y comentado todo el motor Perl interno para que sea fácil de estudiar y comparar contra `legacy/`)?
3. **Fuente principal por defecto en los PDFs**: ¿Preferís estandarizar para todas las unidades `Libertinus Serif` + `Inter` + `JetBrains Mono` (estética actual de `compilar.sh` y de `Unidad III`/`VI`) o `Latin Modern Roman` (estética por defecto de `estilos/`)?
