# Toolchain Editorial Autocontenido (`toolchain/`)

Pipeline unificado de normalización, linteo y compilación de apuntes en Markdown (`.md`) a **PDF (`LuaLaTeX`)** y **EPUB3** mediante **Pandoc**.

> [!IMPORTANT]
> **Autocontención total (Principio 3 de `GEMINI.md`)**: Ningún script ni archivo de configuración de esta carpeta depende de `~/.local/share/pandoc` ni de configuraciones globales del usuario. Todo se resuelve de forma relativa a la raíz del repositorio.

---

## 1. Arquitectura de `toolchain/`

```text
toolchain/
├── README.md                        <- Esta documentación
├── bin/
│   ├── mdnorm                       <- Linter y normalizador de Markdown (Bash + Perl)
│   └── md2pdf                       <- Compilador unificado a PDF y EPUB3 (Bash + Perl + Pandoc)
└── pandoc/
    ├── defaults/
    │   ├── pdf.yaml                 <- Defaults de Pandoc para PDF (motor lualatex, filtros Lua)
    │   ├── epub.yaml                <- Defaults de Pandoc para EPUB3 (MathML, CSS, capítulos)
    │   └── metadatos.yaml           <- Valores base compartidos (lang: es, scrartcl, márgenes)
    ├── fonts/
    │   ├── libertinus-serif/        <- Fuente principal embebida (Libertinus Serif)
    │   ├── inter/                   <- Fuente de títulos embebida (Inter)
    │   └── jetbrains-mono/          <- Fuente monoespaciada embebida (JetBrains Mono)
    ├── templates/
    │   ├── estilo.tex               <- Preámbulo LaTeX (fuentes embebidas, cajas de callouts, emojis a color, fvextra)
    │   └── estilo-epub.css          <- Hoja de estilos para lectores de libros electrónicos (EPUB3)
    └── filters/
        ├── preambulo.lua            <- Inyecta templates/estilo.tex respetando mainfont y header-includes
        ├── cortar-formulas.lua      <- Parte ecuaciones en bloque ($$ ... $$) que exceden el ancho de página
        └── centrar-imagenes.lua     <- Centra figuras sueltas y soporta {.izquierda}, {.derecha} y anchos
```

---

## 2. Uso de `toolchain/bin/mdnorm` (Normalizador y Linter)

Corrige automáticamente los detalles de sintaxis que hacen que Pandoc interprete mal una nota de Obsidian o Notion (líneas en blanco faltantes antes de listas/tablas/títulos/citas, sangrías de sublistas, tablas partidas, `<br>`, fórmulas `\(...\)` / `\[...\]`, letras matemáticas Unicode `𝐴` → `A`, cabeceras YAML y rutas de imágenes en `assets/`).

```bash
# Normalizar un apunte de forma interactiva (pregunta antes de guardar)
./toolchain/bin/mdnorm "content/unidades/Unidad III - Subsistema de Aplicación.md"

# Ver el detalle línea por línea de los cambios propuestos (-v / --verbose)
./toolchain/bin/mdnorm -v "content/unidades/Unidad VI - Seguridad y Auditoría.md"

# Normalizar y guardar directamente sin pedir confirmación (-y / --yes)
./toolchain/bin/mdnorm -y content/unidades/*.md

# Modo auditoría para CI (--check / -n): no modifica archivos y devuelve exit 1 si algo falla
./toolchain/bin/mdnorm --check content/unidades/*.md content/practica/**/*.md
```

---

## 3. Uso de `toolchain/bin/md2pdf` (Compilador a PDF y EPUB3)

Toma uno o varios archivos `.md`, traduce en memoria la sintaxis de Obsidian (`![[...]]`, `|400`, `|derecha`, `[[wikilinks]]`, callouts `> [!NOTE]`, letras matemáticas Unicode) y genera los documentos en la carpeta `build/` de la raíz del repositorio (la cual está ignorada en `.gitignore`).

```bash
# Generar PDF (por defecto en build/<nombre>.pdf)
./toolchain/bin/md2pdf -y "content/unidades/Unidad III - Subsistema de Aplicación.md"

# Generar EPUB3 (en build/<nombre>.epub)
./toolchain/bin/md2pdf -y --epub "content/unidades/Unidad III - Subsistema de Aplicación.md"

# Generar PDF y EPUB3 simultáneamente en una sola pasada (--all)
./toolchain/bin/md2pdf -y --all content/unidades/*.md

# Especificar un archivo o carpeta de salida personalizada (-o / --output)
./toolchain/bin/md2pdf -y -o build/unidades/ content/unidades/*.md
```

---

## 4. Dependencias del Sistema

### Debian / Ubuntu (y GitHub Actions)

```bash
sudo apt install bash perl pandoc \
  texlive-luatex texlive-latex-recommended texlive-latex-extra \
  texlive-fonts-recommended texlive-lang-spanish \
  lmodern fonts-dejavu-core fonts-noto-color-emoji
```

### Arch Linux

```bash
sudo pacman -S bash perl pandoc-cli \
  texlive-luatex texlive-latexrecommended texlive-latexextra \
  texlive-fontsrecommended texlive-plaingeneric texlive-langspanish \
  otf-latin-modern ttf-dejavu noto-fonts-emoji
```

*(Las fuentes tipográficas estándar del repositorio —**Libertinus Serif** para texto, **Inter** para títulos y **JetBrains Mono** para código— están incluidas directamente en `toolchain/pandoc/fonts/`, por lo que funcionan en cualquier distribución Linux sin necesidad de instalarlas desde el gestor de paquetes).*
