# syntax=docker/dockerfile:1
# ==============================================================================
# toolchain/Dockerfile — Entorno autocontenido de compilación editorial (ASI)
#
# Incluye:
#   - Pandoc + LuaLaTeX (TeX Live) + paquetes LaTeX requeridos por estilo.tex
#   - Fuentes de respaldo del sistema (Noto Color Emoji, DejaVu Sans, LModern)
#   - Caché global de fuentes de luaotfload (/var/cache/texmf-var) precalentado
#     con las fuentes embebidas del repositorio (Libertinus Serif, Inter,
#     JetBrains Mono) para compilación inmediata sin tiempos de inicialización.
#
# Construcción (usando toolchain/ como contexto liviano):
#   docker build -t ghcr.io/n1krov/asi-toolchain:latest -f toolchain/Dockerfile toolchain
# ==============================================================================

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    NEEDRESTART_MODE=l \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    HOME=/tmp \
    TERM=dumb \
    TEXMFVAR=/var/cache/texmf-var \
    TEXMFCACHE=/var/cache/texmf-var

# 1. Instalar Pandoc, TeX Live (LuaLaTeX), fuentes de respaldo y Perl sin fsync
RUN apt-get -o Acquire::ForceIPv4=true -o Acquire::Retries=5 -o Acquire::http::Timeout=20 update && \
    apt-get -o Dpkg::Options::="--force-unsafe-io" \
            -o Acquire::ForceIPv4=true \
            -o Acquire::Retries=5 \
            -o Acquire::http::Timeout=20 \
            install -y --no-install-recommends \
      ca-certificates \
      fonts-dejavu-core \
      fonts-noto-color-emoji \
      lmodern \
      pandoc \
      perl \
      texlive-fonts-recommended \
      texlive-lang-spanish \
      texlive-latex-extra \
      texlive-latex-recommended \
      texlive-luatex && \
    rm -rf /var/lib/apt/lists/*

# 2. Precalentar la base de datos de luaotfload y compilar el bytecode (.luc)
#    de todas las fuentes del toolchain en /var/cache/texmf-var
WORKDIR /workspace
COPY pandoc /workspace/toolchain/pandoc

RUN mkdir -p /var/cache/texmf-var && \
    export OSFONTDIR="{/workspace/toolchain/pandoc/fonts,/usr/share/fonts,/usr/local/share/fonts}" && \
    luaotfload-tool --update --force && \
    printf '# Título *cursiva* **negrita** ***ambas***\n\nTexto normal, *cursiva*, **negrita**, ***negrita cursiva***, `código`, matemática $x + y = z$, símbolo ✔ y emoji 📄.\n\n```text\nnormal\n```\n' \
      | pandoc --defaults=/workspace/toolchain/pandoc/defaults/pdf.yaml -o /tmp/warmup.pdf && \
    rm -rf /tmp/warmup.pdf /workspace/toolchain && \
    chmod -R a+rwX /var/cache/texmf-var
