# Guía para Subir y Editar Apuntes (ASI)

Esta guía explica paso a paso cómo agregar nuevas unidades teóricas, cuestionarios de autoestudio resueltos o guías prácticas al repositorio para que se visualicen bien en **Obsidian** y se publiquen automáticamente como **PDF y EPUB3** en **GitHub Releases**.

---

## ⚡ Resumen Rápido (En 4 pasos)

1. **Ubicá el archivo `.md`** en la carpeta de su unidad: `content/unidades/unidad-<número>/`.

2. **Guardá todas las imágenes** únicamente dentro de la carpeta raíz `assets/`.

3. **Pasale el normalizador** antes de hacer commit:
   ```bash
   ./toolchain/bin/mdnorm -y "content/unidades/unidad-2/"*.md
   ```

4. **Hacé `git commit` y `git push`** (sin subir ningún `.pdf`, `.epub` ni `.docx`): si pusheás a una rama auxiliar (`changes/**`) o abrís un Pull Request, GitHub Actions verificará el formato y la compilación de prueba; al integrarse en **`main`**, actualizará automáticamente el **Release principal (`/releases/latest`)** ordenando los archivos dentro de su unidad.

---

## 1. Dónde ubicar los archivos y cómo nombrarlos

El pipeline de GitHub Actions ([`.github/workflows/editorial-ci.yml`](../.github/workflows/editorial-ci.yml)) detecta automáticamente las carpetas de unidades y usa [`toolchain/bin/mkrelease`](../toolchain/bin/mkrelease) para organizarlas con tablas y paquetes `.zip` separados dentro del Release principal continuo (`apuntes-al-dia` / `/releases/latest`):

```text
content/
├── programa/
│   └── Planificación Académica 2026.md
├── unidades/
│   ├── unidad-0/
│   │   └── Conceptos Previos.md
│   ├── unidad-1/
│   │   ├── Unidad I - Planificación Estratégica de SI-TI.md
│   │   ├── Aclaraciones - Unidad I.md
│   │   ├── Unidad I - Temario.md
│   │   └── borradores/                  <- Ignorada en Releases (para notas en preparación)
│   ├── unidad-2/
│   │   ├── Unidad II - Subsistema de Provisión.md
│   │   └── Unidad II - Cuestionario de Autoestudio - Resolución.md
│   ├── unidad-3/
│   │   ├── Unidad III - Subsistema de Aplicación.md
│   │   ├── Unidad III - Temario.md
│   │   └── Unidad III - Cuestionario de Autoestudio - Resolución.md
│   ├── unidad-4/
│   ├── unidad-5/
│   └── unidad-6/
│       ├── Unidad VI - Seguridad y Auditoría.md
│       ├── Unidad VI - Temario.md
│       └── Unidad VI - Cuestionario de Autoestudio - Resolución.md
└── trabajo-practico/
    ├── parte-1/                         <- Sección Trabajo Práctico Integrador Parte 1 en /releases/latest
    └── parte-2/                         <- Sección Trabajo Práctico Integrador Parte 2 en /releases/latest
```

> [!TIP]
> **¿Cómo guardar una foto fija (versión histórica) antes de un parcial o cierre de año?**
> El Release principal (`apuntes-al-dia`) se mantiene siempre al día con el último commit sin llenar la página de copias repetidas. Si antes de un examen o al terminar la cursada quieren dejar congelada una versión histórica inmutable de todos los PDFs y EPUBs, basta con crear y subir un tag que empiece con `v`:
> ```bash
> git tag v2026-parcial1
> git push myfork v2026-parcial1
> ```
> GitHub Actions creará automáticamente un Release histórico separado (`📚 Snapshot Histórico de Apuntes — v2026-parcial1`) que **nunca se sobrescribe ni se borra**, dejando siempre arriba a `apuntes-al-dia` como `Latest`.

### Convención de nombres recomendada

Para que la lista de archivos de cada Release quede limpia y uniforme:

* **Apunte teórico consolidado**:
  `Unidad <I..VI> - <Título de la Unidad>.md`
  *(Ejemplo: `Unidad II - Subsistema de Provisión.md`)*

* **Cuestionario de autoestudio resuelto**:
  `Unidad <I..VI> - Cuestionario de Autoestudio - Resolución.md`
  *(Ejemplo: `Unidad II - Cuestionario de Autoestudio - Resolución.md`)*

* **Borradores o apuntes sin terminar**:
  Ubicalos dentro de `content/unidades/unidad-<X>/borradores/`. El linter verifica que su sintaxis sea válida, pero **no se publican en GitHub Releases** hasta que los muevas a la carpeta principal `content/unidades/unidad-<X>/`.

### Descompilar material en PDF de la cátedra con `pdf2md` (Uso Local)

Si disponés de diapositivas, enunciados o apuntes de la cátedra en formato PDF y querés convertirlos a Markdown editable para sumarlos al repositorio:

```bash
# Convertir localmente el PDF a Markdown
./toolchain/bin/pdf2md material-catedra.pdf
```

`pdf2md` es una herramienta de uso local que:

1. Reconstruye automáticamente títulos, listas, fórmulas LaTeX, notas al pie y tablas en Markdown.

2. Extrae todas las imágenes directamente a la carpeta raíz `assets/` (cumpliendo la regla del repositorio).

3. Deduplica imágenes existentes por hash y resuelve colisiones de nombre agregando un sufijo único sin romper archivos previos.

4. Una vez generado el archivo `.md`, movelo a su carpeta en `content/unidades/unidad-<X>/` y ejecutá `./toolchain/bin/mdnorm -y <archivo.md>`.

---

## 2. Plantillas de Cabecera YAML (Portada e Índice)

Copiá y pegá una de estas cabeceras al principio (línea 1) de tu archivo `.md`. Las fuentes `Libertinus Serif`, `Inter` y `JetBrains Mono` ya vienen embebidas en el repositorio, por lo que funcionarán siempre.

### A. Plantilla para Apunte Teórico de Unidad

```yaml
---
title: "Unidad II - Subsistema de Provisión"
subtitle: "Administración de Sistemas de Información"
author: n1krov, Juani, Pollo y Chipancho
date: \today
documentclass: scrartcl
classoption: numbers=enddot
geometry: margin=2.5cm
linestretch: 1.15
mainfont: Libertinus Serif
sansfont: Inter
monofont: JetBrains Mono
toc: true
toc-depth: 5
numbersections: true
ancho-imagenes: 100%
header-includes:
  - |
    ```{=latex}
    \usepackage{float}
    \floatplacement{figure}{H}
    ```
---

\newpage

# Título de la primera sección
```

### B. Plantilla para Cuestionario de Autoestudio Resuelto

```yaml
---
title: "Resolución del cuestionario de estudio"
subtitle: "Unidad II — Subsistema de Provisión"
author: n1krov, Juani, Pollo y Chipancho
date: \today
documentclass: scrartcl
classoption: numbers=enddot
geometry: margin=2.5cm
linestretch: 1.15
mainfont: Libertinus Serif
sansfont: Inter
monofont: JetBrains Mono
toc: true
toc-depth: 5
numbersections: true
ancho-imagenes: 100%
header-includes:
  - \usepackage{caption}
  - \captionsetup[figure]{labelformat=empty}
---

\newpage

# PARTE I: Nombre del bloque temático
```

---

## 3. Reglas de Formato (Obsidian + Pandoc)

### Imágenes (¡Muy importante!)

1. **Ubicación única**: Guardá siempre los archivos `.png`, `.jpg` o `.svg` en la carpeta **`assets/`** de la raíz del repositorio.

   * ❌ **Prohibido** dejar imágenes sueltas dentro de `content/` (el CI rechazará el push).

   * ❌ **Prohibido** pegar imágenes codificadas en Base64 (`data:image/png;base64,...`) como exporta a veces Google Docs o Notion.

2. **Cómo insertarlas en el `.md`**:
   Podés usar directamente la sintaxis de Obsidian o Markdown estándar (`mdnorm` y `md2pdf` resuelven ambos formatos automáticamente):
   ```markdown
   ![[diagrama-provision.png]]

   ![[diagrama-provision.png|450]]

   ![Diagrama del subsistema de provisión](../../../assets/diagrama-provision.png)
   ```
   *(Consejo: en Obsidian podés configurar **Settings → Files and links → Default location for new attachments** apuntando a la carpeta `assets` para que al pegar una captura con `Ctrl+V` se guarde sola ahí).*

### Callouts (Cajas destacadas)

Usá los callouts estándar de Obsidian/GitHub. En el PDF y en el EPUB se transforman automáticamente en recuadros estilizados:

```markdown
> [!NOTE]
> Nota aclaratoria o referencia bibliográfica (ej. *Chiavenato, Cap. 6*).

> [!IMPORTANT]
> Definición clave o concepto central de examen.

> [!WARNING]
> Error frecuente o advertencia importante.

> [!EXAMPLE]
> Caso práctico o ejemplo aplicado (ej. Dirección de Vialidad Provincial).
```

### Fórmulas matemáticas y Tablas

* **Matemática en línea**: `$RUO = \frac{T_{uso}}{T_{disponible}}$`

* **Matemática en bloque**:
  ```markdown
  $$
  ALE = ARO \times SLE
  $$
  ```

* **Tablas**: Usá tablas estándar de Markdown (GFM), dejando siempre una línea en blanco antes y después de la tabla. Evitá etiquetas HTML `<br>` adentro de celdas (`mdnorm` las limpia automáticamente).

---

## 4. Normalización y Prueba Antes del Commit (Obligatorio)

En cada push, el primer trabajo de GitHub Actions (`lint`) verifica que todos los archivos `.md` cumplan las reglas del repositorio.

Antes de hacer `git add` y `git commit`, **ejecutá siempre `mdnorm`** sobre los archivos que creaste o editaste:

```bash
# Corrige automáticamente espaciados, listas, tablas, fórmulas y rutas a assets/
./toolchain/bin/mdnorm -y "content/unidades/unidad-2/"*.md
```

*(Solo requiere tener `bash` y `perl`, que vienen instalados por defecto en cualquier distro Linux).*

### Opcional: Previsualizar el PDF y EPUB en tu computadora

No es obligatorio compilar localmente (GitHub Actions lo hace solo al pushear), pero si querés revisar cómo queda paginado el PDF antes de subirlo:

* **Con Docker (sin instalar LaTeX en tu PC)**:
  ```bash
  docker run --rm --user "$(id -u):$(id -g)" -v "$PWD:/workspace" -w /workspace \
    ghcr.io/gez-schegtel/asi-toolchain:latest \
    ./toolchain/bin/md2pdf -y --all "content/unidades/unidad-2/"*.md
  ```

* **De forma nativa (si tenés Pandoc y TeX Live instalados)**:
  ```bash
  ./toolchain/bin/md2pdf -y --all "content/unidades/unidad-2/"*.md
  ```

Los archivos generados aparecerán en `build/unidad-2/` (esa carpeta está ignorada en `.gitignore`, por lo que nunca se subirá por error a Git).

---

## 5. Checklist Final antes de `git push`

- [ ] El archivo `.md` está en `content/unidades/unidad-<X>/` con el nombre estándar.

- [ ] Todas las imágenes nuevas están dentro de `assets/`.

- [ ] Ejecuté `./toolchain/bin/mdnorm -y` sobre los archivos nuevos o modificados.

- [ ] No agregué archivos `.pdf`, `.epub` ni `.docx` al repositorio.

- [ ] Si agregué una unidad completa nueva, actualicé su estado en [`docs/STATUS.md`](STATUS.md) y agregué su enlace directo en [`README.md`](../README.md).
