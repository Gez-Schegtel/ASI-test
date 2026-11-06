#!/usr/bin/env bash
# compilar.sh - Convierte un apunte de Obsidian/Notion (.md) a PDF con pandoc + XeLaTeX
#
# Uso:
#   ./compilar.sh apunte.md [carpeta_imagenes] [salida.pdf]
#
# Ejemplos:
#   ./compilar.sh "../Unidad III - Subsistema de Aplicación.md"
#   ./compilar.sh "../Unidad VI - Seguridad y Auditoría.md" ../../assets
#
# - Por defecto genera el PDF en ../build/<nombre-del-md>.pdf (crea build/ si no existe),
#   salvo que pases un 3er argumento.
# - Si no pasás carpeta_imagenes, usa ../../assets (si existe) o la carpeta actual.
# - La cabecera se toma de header.yaml / header.yml (junto al script, o junto al .md,
#   o la ruta que pongas en la variable HEADER). El campo "title:" se reemplaza por el
#   nombre del .md.
#
# Variables opcionales:
#   HEADER=/ruta/header.yaml   usar otra cabecera
#   AUTOR="Tu nombre"          reemplaza el campo author: de la cabecera

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
OUT="${3:-$BUILD_DIR/$BASE.pdf}"

# Comprobaciones
[[ -f "$MD" ]] || { echo "Error: no existe el archivo '$MD'" >&2; exit 1; }
[[ -d "$IMG_DIR" ]] || { echo "Error: no existe la carpeta de imágenes '$IMG_DIR'" >&2; exit 1; }
command -v pandoc >/dev/null || { echo "Error: pandoc no está instalado (sudo pacman -S pandoc-cli)" >&2; exit 1; }
command -v xelatex >/dev/null || { echo "Error: xelatex no está instalado (sudo pacman -S texlive-xetex)" >&2; exit 1; }
command -v perl >/dev/null || { echo "Error: perl no está instalado" >&2; exit 1; }

MD_DIR="$(cd "$(dirname "$MD")" && pwd)"

# Buscar la cabecera
HEADER_FILE=""
if [[ -n "${HEADER:-}" ]]; then
  HEADER_FILE="$HEADER"
else
  for c in "$SCRIPT_DIR/header.yaml" "$SCRIPT_DIR/header.yml" "$MD_DIR/header.yaml" "$MD_DIR/header.yml"; do
    if [[ -f "$c" ]]; then HEADER_FILE="$c"; break; fi
  done
fi
[[ -n "$HEADER_FILE" && -f "$HEADER_FILE" ]] || {
  echo "Error: no encontré header.yaml ni header.yml (probé junto al script y junto al .md)." >&2
  echo "       Podés indicar la ruta con: HEADER=/ruta/header.yaml ./compilar.sh ..." >&2
  exit 1
}

IMG_ABS="$(cd "$IMG_DIR" && pwd)"
export IMG_ABS

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# 1) Cabecera: copia del header con el título (y opcionalmente el autor) reemplazados
TITULO="$BASE" AUTOR_NUEVO="${AUTOR:-}" awk '
  function esc(s) { gsub(/\\/, "\\\\", s); gsub(/"/, "\\\"", s); return s }
  BEGIN { titulo = esc(ENVIRON["TITULO"]); autor = esc(ENVIRON["AUTOR_NUEVO"]); puesto = 0 }
  /^title:/ && !puesto { print "title: \"" titulo "\""; puesto = 1; next }
  /^author:/ && ENVIRON["AUTOR_NUEVO"] != "" { print "author: \"" autor "\""; next }
  { print }
  END { }
' "$HEADER_FILE" > "$TMP/header.yaml"

# Si la cabecera no tenía title:, se lo agrega después del primer ---
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
#    - reemplaza/quita emojis
#    - convierte imágenes ![[x.png]] a ![](ruta/x.png)
#    - convierte wikilinks [[nota|alias]] / [[nota]] a texto plano
awk 'NR==1 && /^---$/ {skip=1; next} skip && /^---$/ {skip=0; next} !skip' "$MD" \
| perl -CSD -pe '
    BEGIN { use Unicode::Normalize qw(NFKC); $dir = $ENV{IMG_ABS}; }

    # Letras matemáticas Unicode (𝐴 𝑓 𝑡 𝛼 ...) a letras normales (A f t α ...)
    s/([\x{1D400}-\x{1D7FF}])/NFKC($1)/ge;

    # Imágenes de Obsidian (con o sin tamaño |400)
    s{!\[\[([^\]|]+)(?:\|[^\]]*)?\]\]}{
        my $f = $1;
        my $ruta = "$dir/$f";
        warn "AVISO: no se encuentra la imagen: $ruta\n" unless -e $ruta;
        $ruta =~ s/ /%20/g;
        "![]($ruta)";
    }ge;

    # Wikilinks normales
    s/\[\[([^\]|]+)\|([^\]]+)\]\]/$2/g;
    s/\[\[([^\]]+)\]\]/$1/g;

    # Emojis y símbolos conocidos
    s/\x{1F4CC}/»/g;                    # pin
    s/[\x{2705}\x{2713}\x{2714}]/\$\\checkmark\$/g;
    s/[\x{274C}\x{2716}]/\$\\times\$/g;

    # El resto de emojis se borra (XeLaTeX no los renderiza con estas fuentes)
    s/[\x{1F000}-\x{1FAFF}]//g;
    s/[\x{2600}-\x{27BF}]//g;
    s/[\x{FE0F}\x{200D}]//g;
' > "$TMP/cuerpo.md"

cat "$TMP/header.yaml" "$TMP/cuerpo.md" > "$TMP/final.md"

# 3) Compilar
mkdir -p "$(dirname "$OUT")"
echo "Cabecera: $HEADER_FILE"
echo "Compilando '$MD' -> '$OUT' ..."
pandoc "$TMP/final.md" -o "$OUT" \
  --pdf-engine=xelatex \
  --resource-path=".:$IMG_ABS"

echo "Listo: $OUT"
