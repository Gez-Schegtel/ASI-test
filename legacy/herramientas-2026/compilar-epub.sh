#!/usr/bin/env bash
# compilar-epub.sh - Convierte un apunte de Obsidian/Notion (.md) a EPUB con pandoc
#
# Uso:
#   ./compilar-epub.sh apunte.md [carpeta_imagenes] [salida.epub]
#
# Ejemplos:
#   ./compilar-epub.sh "../Unidad III - Subsistema de Aplicación.md"
#   ./compilar-epub.sh "../Unidad VI - Seguridad y Auditoría.md" ../../assets ../build/resumen-u6.epub
#
# - Por defecto genera el EPUB en ../build/<nombre-del-md>.epub (crea build/ si no existe),
#   salvo que pases un 3er argumento.
# - Si no pasás carpeta_imagenes, usa ../../assets (si existe) o la carpeta actual.
# - La cabecera sale de header-epub.yaml (junto al script o junto al .md).
#   El campo "title:" se reemplaza por el nombre del .md.
# - El estilo sale de estilo-epub.css (junto al script o junto al .md), si existe.
#
# Variables opcionales:
#   HEADER=/ruta/header-epub.yaml   usar otra cabecera
#   CSS=/ruta/estilo.css            usar otro CSS
#   AUTOR="Tu nombre"               reemplaza el campo author:
#   PORTADA=/ruta/portada.png       agrega una imagen de portada
#   MATH=mathml|webtex              cómo se hacen las fórmulas (por defecto mathml)

set -euo pipefail

if [[ $# -lt 1 || "$1" == "-h" || "$1" == "--help" ]]; then
  awk 'NR>1 && /^#/ { sub(/^# ?/, ""); print; next } NR>1 { exit }' "$0"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$(cd "$SCRIPT_DIR/.." && pwd)/build"
DEFAULT_IMG="."
[[ -d "$SCRIPT_DIR/../../assets" ]] && DEFAULT_IMG="$SCRIPT_DIR/../../assets"

MD="$1"
IMG_DIR="${2:-$DEFAULT_IMG}"
BASE="$(basename "${MD%.md}")"
OUT="${3:-$BUILD_DIR/$BASE.epub}"
MATH="${MATH:-mathml}"

# Comprobaciones
[[ -f "$MD" ]] || { echo "Error: no existe el archivo '$MD'" >&2; exit 1; }
[[ -d "$IMG_DIR" ]] || { echo "Error: no existe la carpeta de imágenes '$IMG_DIR'" >&2; exit 1; }
command -v pandoc >/dev/null || { echo "Error: pandoc no está instalado (sudo pacman -S pandoc-cli)" >&2; exit 1; }
command -v perl >/dev/null || { echo "Error: perl no está instalado" >&2; exit 1; }

MD_DIR="$(cd "$(dirname "$MD")" && pwd)"

# Buscar un archivo en las carpetas habituales
buscar() {
  for c in "$SCRIPT_DIR/$1" "$MD_DIR/$1"; do
    if [[ -f "$c" ]]; then echo "$c"; return 0; fi
  done
  return 1
}

# Cabecera
HEADER_FILE="${HEADER:-}"
[[ -n "$HEADER_FILE" ]] || HEADER_FILE="$(buscar header-epub.yaml || buscar header-epub.yml || true)"
[[ -n "$HEADER_FILE" && -f "$HEADER_FILE" ]] || {
  echo "Error: no encontré header-epub.yaml (probé junto al script y junto al .md)." >&2
  echo "       Podés indicar la ruta con: HEADER=/ruta/header-epub.yaml ./compilar-epub.sh ..." >&2
  exit 1
}

# CSS (opcional)
CSS_FILE="${CSS:-}"
[[ -n "$CSS_FILE" ]] || CSS_FILE="$(buscar estilo-epub.css || true)"

IMG_ABS="$(cd "$IMG_DIR" && pwd)"
export IMG_ABS

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# 1) Cabecera con el título (y opcionalmente el autor) reemplazados
TITULO="$BASE" AUTOR_NUEVO="${AUTOR:-}" awk '
  function esc(s) { gsub(/\\/, "\\\\", s); gsub(/"/, "\\\"", s); return s }
  BEGIN { titulo = esc(ENVIRON["TITULO"]); autor = esc(ENVIRON["AUTOR_NUEVO"]); puesto = 0 }
  /^title:/ && !puesto { print "title: \"" titulo "\""; puesto = 1; next }
  /^author:/ && ENVIRON["AUTOR_NUEVO"] != "" { print "author: \"" autor "\""; next }
  { print }
' "$HEADER_FILE" > "$TMP/header.yaml"

if ! grep -q '^title:' "$TMP/header.yaml"; then
  TITULO="$BASE" awk '
    function esc(s) { gsub(/\\/, "\\\\", s); gsub(/"/, "\\\"", s); return s }
    { print }
    NR==1 && /^---$/ { print "title: \"" esc(ENVIRON["TITULO"]) "\"" }
  ' "$TMP/header.yaml" > "$TMP/header2.yaml" && mv "$TMP/header2.yaml" "$TMP/header.yaml"
fi
printf '\n' >> "$TMP/header.yaml"

# 2) Limpieza del cuerpo:
#    - saca el front matter previo (si existe)
#    - convierte imágenes ![[x.png]] / ![[x.png|400]] a ![](ruta/x.png){width=400px}
#    - convierte wikilinks [[nota|alias]] / [[nota]] a texto plano
#    (los emojis y las letras matemáticas Unicode se dejan: el lector los renderiza)
awk 'NR==1 && /^---$/ {skip=1; next} skip && /^---$/ {skip=0; next} !skip' "$MD" \
| perl -CSD -pe '
    BEGIN { $dir = $ENV{IMG_ABS}; }

    # Imágenes de Obsidian (con o sin tamaño |400 o |400x300)
    s{!\[\[([^\]|]+)(?:\|(\d+)(?:x\d+)?)?(?:\|[^\]]*)?\]\]}{
        my ($f, $w) = ($1, $2);
        my $ruta = "$dir/$f";
        warn "AVISO: no se encuentra la imagen: $ruta\n" unless -e $ruta;
        $ruta =~ s/ /%20/g;
        defined $w ? "![]($ruta){width=${w}px}" : "![]($ruta)";
    }ge;

    # Wikilinks normales
    s/\[\[([^\]|]+)\|([^\]]+)\]\]/$2/g;
    s/\[\[([^\]]+)\]\]/$1/g;
' > "$TMP/cuerpo.md"

cat "$TMP/header.yaml" "$TMP/cuerpo.md" > "$TMP/final.md"

# 3) Compilar
ARGS=(
  "$TMP/final.md" -o "$OUT"
  --from markdown
  --to epub3
  --toc --toc-depth=3
  --number-sections
  --split-level=1
  --syntax-highlighting=tango
  --metadata "date=$(date +%F)"
  --resource-path=".:$IMG_ABS"
)

case "$MATH" in
  mathml) ARGS+=(--math-method=mathml) ;;
  webtex) ARGS+=(--math-method=webtex) ;;
  *) echo "Error: MATH debe ser mathml o webtex" >&2; exit 1 ;;
esac

[[ -n "$CSS_FILE" ]] && ARGS+=(--css "$CSS_FILE")
[[ -n "${PORTADA:-}" ]] && ARGS+=(--epub-cover-image "$PORTADA")

mkdir -p "$(dirname "$OUT")"
echo "Cabecera: $HEADER_FILE"
echo "Estilo:   ${CSS_FILE:-(ninguno)}"
echo "Compilando '$MD' -> '$OUT' ..."
pandoc "${ARGS[@]}"

echo "Listo: $OUT"