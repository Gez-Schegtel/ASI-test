# Apuntes en Markdown a PDF y EPUB

Dos scripts para convertir apuntes `.md` (de Obsidian / Notion) y estudiar con ellos:

| Script | Genera | Motor | Ideal para |
|---|---|---|---|
| `compilar.sh` | PDF | pandoc + XeLaTeX | imprimir, layout fijo, mucha matemática |
| `compilar-epub.sh` | EPUB | pandoc | leer en el celu / tablet, texto que se reajusta a la pantalla |

Los dos hacen el preprocesado de Obsidian automáticamente:

- Le ponen una cabecera YAML con el título igual al nombre del `.md` (si el archivo ya tenía un front matter `--- ... ---`, lo reemplazan).
- Convierten las imágenes de Obsidian `![[Pasted image X.png]]` (con o sin tamaño `|400`) en imágenes normales apuntando a tu carpeta de imágenes.
- Convierten los wikilinks `[[nota]]` / `[[nota|alias]]` en texto plano.
- Generan por defecto el archivo en `2026/build/` con el mismo nombre que el `.md` (salvo que pases otra ruta de salida).

Solo `compilar.sh` normaliza las letras matemáticas Unicode (`𝐴`, `𝑓`, `𝛼`, etc.) y reemplaza o elimina emojis, porque XeLaTeX no los renderiza con las fuentes de texto. En el EPUB se dejan como están, ya que los dibuja el lector.

## Estructura esperada

```
ASI/
├── 2026/
│   ├── .gitignore                                  <- regla de build/ comentada por ahora
│   ├── README.md
│   ├── herramientas/
│   │   ├── README.md
│   │   ├── compilar.sh
│   │   ├── compilar-epub.sh
│   │   ├── header.yaml                             <- cabecera del PDF (o header.yml)
│   │   ├── header-epub.yaml                        <- cabecera del EPUB
│   │   └── estilo-epub.css                         <- estilo del EPUB
│   ├── build/                                      <- salida por defecto (PDF/EPUB), subida al repo por ahora
│   ├── Unidad I/
│   ├── Unidad III - Subsistema de Aplicación.md
│   └── Unidad VI - Seguridad y Auditoría.md
└── assets/                                         <- carpeta de imágenes (../../assets desde herramientas/)
```

Los scripts buscan sus archivos de cabecera (y el CSS) junto al script y, si no están, junto al `.md`. El título del PDF y del EPUB sale del nombre del archivo `.md` (sin importar cómo llames al archivo de salida), así que conviene no renombrar los apuntes. Por defecto los dos scripts guardan los artefactos generados en `2026/build/` (creándola si no existe); por ahora `build/` no se ignora en git (`#build/` en `2026/.gitignore`) para subir los PDFs y EPUBs ya compilados al repositorio.

## Dependencias

### Arch Linux

Para el **PDF**:

```bash
# Pandoc y TeX Live
sudo pacman -S pandoc-cli texlive-xetex texlive-latexextra texlive-fontsextra \
               texlive-fontsrecommended texlive-plaingeneric texlive-langspanish

# Fuentes usadas en el header (texto, títulos, código y símbolos Unicode)
sudo pacman -S ttf-libertinus inter-font ttf-jetbrains-mono ttf-dejavu

# Herramientas que usan los scripts (normalmente ya vienen instaladas)
sudo pacman -S perl gawk
```

Para el **EPUB** alcanza con `pandoc-cli`, `perl` y `gawk` (no hace falta TeX ni fuentes). Se recomienda pandoc 3.0 o más nuevo (usa `--split-level`).

Opcional, para validar y probar el EPUB:

```bash
sudo pacman -S epubcheck foliate     # validador y lector liviano
sudo pacman -S calibre               # trae ebook-viewer y ebook-convert
```

Alternativa más simple pero pesada (varios GB) para el PDF: instalar `texlive-meta` en lugar de la lista de TeX Live de arriba.

Refrescá la caché de fuentes y verificá los nombres (solo PDF):

```bash
fc-cache -fv
fc-list | grep -iE "libertinus|inter|jetbrains|dejavu sans"
```

Los nombres que aparecen ahí son los que usa `header.yaml`:
- `Libertinus Serif` (`mainfont`, texto principal)
- `Inter` (`sansfont`, títulos y encabezados)
- `JetBrains Mono` (`monofont`, bloques de código)
- `DejaVu Sans` (`\symfont`, símbolos Unicode como `►` y `✓`)

### Otras distros

Los nombres de los paquetes cambian y no los verifiqué, así que tomalos como orientación. Necesitás los equivalentes de:

- `pandoc`
- XeLaTeX (`texlive-xetex`), solo para el PDF
- paquetes extra de LaTeX (`texlive-latex-extra` en Debian/Ubuntu), solo para el PDF
- soporte de español para babel (`texlive-lang-spanish` en Debian/Ubuntu), solo para el PDF
- las fuentes Libertinus, Inter, JetBrains Mono y DejaVu Sans (`fonts-dejavu-core` en Debian/Ubuntu), solo para el PDF
- `perl` y `awk`

Si falta algún archivo de TeX, `pacman -F nombre.sty` (Arch) o `apt-file search nombre.sty` (Debian/Ubuntu) te dice qué paquete lo trae.

## Uso

Parado dentro de `2026/herramientas/`:

```bash
cd 2026/herramientas
chmod +x compilar.sh compilar-epub.sh    # solo la primera vez
```

### PDF

```bash
./compilar.sh apunte.md [carpeta_imagenes] [salida.pdf]
```

Ejemplos (guardan por defecto en `../build/`):

```bash
./compilar.sh "../Unidad III - Subsistema de Aplicación.md"
./compilar.sh "../Unidad VI - Seguridad y Auditoría.md" ../../assets
./compilar.sh "../Unidad VI - Seguridad y Auditoría.md" ../../assets ../build/resumen-u6.pdf
```

### EPUB

```bash
./compilar-epub.sh apunte.md [carpeta_imagenes] [salida.epub]
```

Ejemplos (guardan por defecto en `../build/`):

```bash
./compilar-epub.sh "../Unidad III - Subsistema de Aplicación.md"
./compilar-epub.sh "../Unidad VI - Seguridad y Auditoría.md" ../../assets
./compilar-epub.sh "../Unidad VI - Seguridad y Auditoría.md" ../../assets ../build/resumen-u6.epub
```

### Argumentos (iguales en los dos scripts)

| Argumento | Descripción | Por defecto |
|---|---|---|
| `apunte.md` | Archivo a convertir | (obligatorio) |
| `carpeta_imagenes` | Carpeta donde están las imágenes | `../../assets` (si existe) o `.` |
| `salida.pdf` / `salida.epub` | Ruta del archivo de salida | `../build/<nombre-del-md>.pdf` / `.epub` |

### Variables opcionales

Para el PDF:

```bash
HEADER=/otra/ruta/header.yaml ./compilar.sh ../apunte.md   # usar otra cabecera
AUTOR="Otro nombre" ./compilar.sh ../apunte.md             # cambiar el author:
```

Para el EPUB:

```bash
HEADER=/otra/ruta/header-epub.yaml ./compilar-epub.sh ../apunte.md   # otra cabecera
CSS=/otra/ruta/estilo.css ./compilar-epub.sh ../apunte.md            # otro estilo
AUTOR="Otro nombre" ./compilar-epub.sh ../apunte.md                  # cambiar el author:
PORTADA=portada.png ./compilar-epub.sh ../apunte.md                  # agregar portada
MATH=webtex ./compilar-epub.sh ../apunte.md                          # fórmulas como imágenes
```

`MATH` vale `mathml` (por defecto) o `webtex`. MathML se ve bien en Apple Books, Calibre y la mayoría de las apps, pero algunos e-readers viejos no lo soportan. `webtex` convierte las fórmulas en imágenes y necesita internet al compilar.

## Probar el EPUB

Validar la estructura (atrapa errores antes de abrirlo):

```bash
epubcheck "../build/Unidad III - Subsistema de Aplicación.epub"
unzip -l "../build/Unidad III - Subsistema de Aplicación.epub"    # las imágenes deben estar en EPUB/media/
```

Abrirlo en la compu:

```bash
foliate "../build/Unidad III - Subsistema de Aplicación.epub"
ebook-viewer "../build/Unidad III - Subsistema de Aplicación.epub"     # viene con calibre
```

Cosas a revisar: que las imágenes aparezcan y no se pasen del ancho, que se vean las fórmulas y que las tablas no queden ilegibles en pantalla chica.

## Pasar el EPUB al iPhone

El iPhone lee EPUB de forma nativa con **Apple Books**, no hace falta instalar nada. Lo único que hay que resolver es cómo llevar el archivo (AirDrop no existe en Linux). Cualquiera de estas opciones sirve:

- **Mail:** mandátelo por mail como adjunto, abrilo desde la app Mail del iPhone, tocá el adjunto y elegí "Abrir en Books" desde el menú de compartir.
- **iCloud Drive (web):** entrá a icloud.com desde el navegador, subí el `.epub` a iCloud Drive y en el iPhone abrilo desde la app Archivos; al tocarlo se abre en Books.
- **Google Drive, Dropbox o similar:** subí el archivo desde la compu, abrilo desde la app en el iPhone y usá "Compartir" > "Books" (o "Abrir en...").
- **Telegram o WhatsApp:** mandátelo a "Mensajes guardados" o a un chat contigo mismo, y desde el iPhone tocá el archivo > "Compartir" > "Books".
- **LocalSend:** app gratuita para Linux e iOS que pasa archivos por la red local sin cuentas ni nube (conviene probarla antes de confiar en ella).

Una vez en Books, queda en tu biblioteca, se sincroniza por iCloud con otros dispositivos Apple y recuerda el punto donde dejaste de leer.

Para Kindle: "Send to Kindle" acepta EPUB, o convertilo con Calibre (`ebook-convert apunte.epub apunte.azw3`).

## Qué hacer si algo falla

### PDF

| Error | Causa probable | Solución |
|---|---|---|
| `Package babel Error: Unknown option 'spanish'` | Falta el soporte de español de TeX | Instalar `texlive-langspanish`. Si ya está instalado, reinstalarlo para que se regeneren los formatos, o correr `sudo mktexlsr && sudo fmtutil-sys --all` |
| `The font "X" cannot be found` | El nombre de la fuente en el header no coincide con el del sistema | Mirar `fc-list` y ajustar `mainfont`/`sansfont`/`monofont` |
| `AVISO: no se encuentra la imagen: ...` | La carpeta de imágenes es incorrecta o la imagen no existe | Revisar el segundo argumento y el nombre del archivo |
| `Missing character: There is no X` | Un símbolo no existe en la fuente principal | Agregar `\newunicodechar{X}{{\symfont X}}` en `header.yaml` (si está en `DejaVu Sans`), o un reemplazo en la sección de emojis de `compilar.sh` |
| `xdvipdfmx:fatal: Page number 65536 too large` | LaTeX entró en un bucle | Suele pasar por paquetes incompatibles en el header o una actualización de TeX Live a medias. Probar `sudo pacman -Syu` y revisar los paquetes de `header-includes` en `header.yaml` |
| `Could not fetch resource` | Pandoc no encuentra una imagen | Verificar la ruta de imágenes |

### EPUB

| Problema | Causa probable | Solución |
|---|---|---|
| `AVISO: no se encuentra la imagen: ...` | La carpeta de imágenes es incorrecta o la imagen no existe | Revisar el segundo argumento y el nombre del archivo |
| El libro no tiene imágenes | Pandoc no las encontró y las omitió | Mirar los avisos al compilar y verificar con `unzip -l` que estén en `EPUB/media/` |
| `Unknown option --syntax-highlighting` o `--math-method` | Pandoc más viejo que lo que usa el script | Actualizar pandoc, o cambiar en el script a `--highlight-style=tango` y `--mathml` / `--webtex` |
| `unrecognized option --split-level` | Pandoc anterior a 3.0 | Actualizar pandoc, o cambiar a `--epub-chapter-level=1` |
| Las fórmulas no se ven | El lector no soporta MathML | Probar con `MATH=webtex`, o usar el PDF |
| Las tablas o el código quedan ilegibles en el celu | Pantalla angosta | Ajustar `estilo-epub.css` (tamaño de fuente en `table` y `pre`), o usar el PDF |
| El lector muestra un emoji roto | La fuente del lector no lo tiene | Agregar una limpieza de emojis al preprocesado, como en `compilar.sh` |

## Notas

- Los archivos intermedios se crean en una carpeta temporal que se borra al terminar. Tu `.md` original no se modifica.
- **PDF:** usa XeLaTeX (no pdflatex) para poder usar fuentes del sistema y manejar bien acentos y la ñ.
- **PDF:** los emojis no se renderizan con las fuentes normales: 📌 pasa a `»`, ✅ / ✓ / ✔ pasan a `$\checkmark$`, ❌ / ✖ pasan a `$\times$`, y el resto de emojis se elimina.
- **PDF:** las imágenes se incluyen con `\floatplacement{figure}{H}` en el header, para que queden donde las pusiste en vez de moverse a otra página.
- **PDF:** los bloques de código usan `fvextra` con `breaklines` en el header para que las líneas largas hagan salto de línea automático en vez de salirse del margen.
- **EPUB:** el libro se divide en un capítulo por cada título de nivel 1, con índice navegable hasta nivel 3 y secciones numeradas.
- **EPUB:** el tamaño de imagen de Obsidian (`|400`) se respeta como `{width=400px}`, y el CSS evita que las imágenes se pasen del ancho de la pantalla.
- **EPUB:** el tamaño del texto y la tipografía los controla el lector, no el archivo, así que cada uno lo ajusta a su gusto.