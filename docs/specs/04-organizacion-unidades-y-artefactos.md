# Spec 04 — Organización por Unidad en `content/` y Estructura Jerárquica de Artefactos (`build/` y CI/CD)

* **Estado**: Implementada (2026-11-06 — Modalidad B + compilación completa de todos los `.md` de Unidades y Práctica)
* **Fecha**: 2026-11-06
* **Alcance**: Reorganización de `content/unidades/` en subcarpetas por Unidad (agrupando teoría y cuestionarios de cada unidad), preservación de jerarquía de carpetas en `toolchain/bin/md2pdf` (`build/`) y empaquetado ordenado de artefactos en GitHub Actions (`.github/workflows/editorial-ci.yml`).

---

## 1. Diagnóstico del Problema Actual (`AS-IS`)

Actualmente existen dos fricciones de organización tanto en las fuentes como en los artefactos compilados:

1. **Dispersión entre teoría y cuestionarios de una misma Unidad en `content/`**:
   * Los apuntes teóricos consolidados (`Unidad III - Subsistema de Aplicación.md` y `Unidad VI - Seguridad y Auditoría.md`) están sueltos en la raíz de `content/unidades/`, mientras que la Unidad I está en `content/unidades/unidad-1-borradores/`.
   * Los cuestionarios de autoestudio y sus resoluciones (`Unidad I`, `Aplicación de recursos` [Unidad III] y `Seguridad y auditoría` [Unidad VI]) están separados en `content/practica/cuestionarios/`, lejos del apunte teórico con el que se estudian.
2. **Salida plana en `build/` y en los Artifacts de GitHub Actions**:
   * La función `calcular_salida()` de `toolchain/bin/md2pdf` ignora la subcarpeta de origen y deposita todos los `.pdf` y `.epub` en un único directorio plano `build/`.
   * Como consecuencia, al descargar el artefacto `apuntes-asi-pdf-epub` desde GitHub Actions se obtienen 16 archivos mezclados en una sola carpeta sin separación por Unidad ni distinción respecto de los trabajos prácticos (`TP1` y `TPI`).

---

## 2. Arquitectura Propuesta (`TO-BE`)

### 2.1. Capa 1: Agrupación por Unidad en `content/unidades/`

Cada Unidad tendrá su propio directorio canónico dentro de `content/unidades/`, alojando juntos su **apunte teórico**, su **cuestionario de autoestudio resuelto** y su **enunciado de cátedra** (mientras que los borradores en preparación viven en una subcarpeta `borradores/` que el compilador de CI ignora hasta que el apunte pase a la raíz de su unidad):

```text
content/
├── unidades/
│   ├── Unidad I/
│   │   ├── Unidad I - Cuestionario de Autoestudio - Resolución.md
│   │   └── borradores/
│   │       ├── El ROL de Las TI.md
│   │       ├── El SI en el contexto de la cadena de valor.md
│   │       ├── Los Sistemas de Informacion en la Empresa.md
│   │       └── U1-Desarrollo de los temas-1.md
│   ├── Unidad III/
│   │   ├── Unidad III - Subsistema de Aplicación.md
│   │   ├── Aplicación de recursos - Resolución.md
│   │   └── AdmSI-CUESTIONARIOS APLICACIÓN DE RECURSOS.md
│   └── Unidad VI/
│       ├── Unidad VI - Seguridad y Auditoría.md
│       ├── Seguridad y auditoría - Resolución.md
│       └── AdmSI-CUESTIONARIOS DE ESTUDIO - SEGURIDAD Y AUDITORIA DE SI-TI.md
├── practica/
│   ├── tp1-alineamiento/
│   │   ├── TP1 - Alineamiento de SI-TI.md
│   │   └── ... (guías y presentaciones del TP1)
│   └── tpi-dvp/
│       ├── Explicación del TPI.md
│       └── TPI Parte 2.md
└── labs/
    ├── cmk/
    └── taller-1/
```

> [!NOTE]
> **Actualización automática de rutas a `assets/`**:
> Al mover `Unidad III - Subsistema de Aplicación.md` y `Unidad VI - Seguridad y Auditoría.md` un nivel más adentro (`content/unidades/Unidad X/`), sus rutas relativas hacia `assets/` pasan de `../../assets/...` a `../../../assets/...`. Ejecutar `./toolchain/bin/mdnorm -y` tras el `git mv` actualiza todas las rutas automáticamente.

---

### 2.2. Capa 2: Salida Jerárquica en `toolchain/bin/md2pdf` (`build/`)

Se actualizará `calcular_salida()` en `toolchain/bin/md2pdf` para que, cuando se compile hacia `build/` (sin un `-o` manual que fuerce otra ruta), preserve la estructura lógica por Unidad y Práctica:

* Si el archivo proviene de `content/unidades/<Unidad X>/...` $\rightarrow$ genera en `build/<Unidad X>/<archivo>.{pdf,epub}`.
* Si el archivo proviene de `content/practica/<subcarpeta>/...` $\rightarrow$ genera en `build/Practica/<subcarpeta>/<archivo>.{pdf,epub}` (o `build/practica/<subcarpeta>/`).
* Si el archivo proviene de cualquier otra ruta fuera de `content/` $\rightarrow$ genera en `build/<archivo>.{pdf,epub}`.

De esta forma, el árbol generado en `build/` quedará organizado así:

```text
build/
├── Unidad I/
│   ├── Unidad I - Cuestionario de Autoestudio - Resolución.pdf
│   └── Unidad I - Cuestionario de Autoestudio - Resolución.epub
├── Unidad III/
│   ├── Unidad III - Subsistema de Aplicación.pdf
│   ├── Unidad III - Subsistema de Aplicación.epub
│   ├── Aplicación de recursos - Resolución.pdf
│   └── Aplicación de recursos - Resolución.epub
├── Unidad VI/
│   ├── Unidad VI - Seguridad y Auditoría.pdf
│   ├── Unidad VI - Seguridad y Auditoría.epub
│   ├── Seguridad y auditoría - Resolución.pdf
│   └── Seguridad y auditoría - Resolución.epub
└── Practica/
    ├── tp1-alineamiento/
    │   ├── TP1 - Alineamiento de SI-TI.pdf
    │   └── TP1 - Alineamiento de SI-TI.epub
    └── tpi-dvp/
        ├── Explicación del TPI.pdf
        ├── Explicación del TPI.epub
        ├── TPI Parte 2.pdf
        └── TPI Parte 2.epub
```

---

### 2.3. Capa 3: Empaquetado en GitHub Actions (`.github/workflows/editorial-ci.yml`)

En el job `build` de `.github/workflows/editorial-ci.yml`:

1. **Selección automática por Unidad**:
   * Compilará los apuntes principales y resoluciones ubicados en `content/unidades/*/*.md` (ignorando automáticamente subcarpetas `borradores/` y los enunciados crudos `AdmSI-CUESTIONARIOS*` si no se desea compilar el enunciado sin resolver, o incluyéndolos si se prefiere) más `content/practica/tpi-dvp/*.md` y `content/practica/tp1-alineamiento/TP1*.md`.
2. **Estructura de Artifacts en GitHub Actions**:
   Existen dos modalidades posibles para la subida de artefactos en `actions/upload-artifact@v7`:
   * **Modalidad A (Un único ZIP con carpetas ordenadas adentro)**: Se sube `build/**/*.pdf` y `build/**/*.epub` en el artefacto `apuntes-asi-pdf-epub`. Al descargar el `.zip`, ya viene dividido en las carpetas `Unidad I/`, `Unidad III/`, `Unidad VI/` y `Practica/`.
   * **Modalidad B (Un Artifact descargable por cada Unidad en la web de GitHub + paquete completo)**: En la página del *workflow run* de GitHub Actions aparecen botones de descarga separados (`Unidad-I`, `Unidad-III`, `Unidad-VI`, `Trabajos-Practicos`), de modo que puedas bajar solo la unidad que estás estudiando sin descargar todo el resto.

---

## 3. Decisiones Resueltas

1. **Modalidad de Artifacts en GitHub Actions**: Se eligió la **Modalidad B** (artefactos descargables individuales en la interfaz de GitHub Actions: `Unidad-I`, `Unidad-II`, `Unidad-III`, `Unidad-IV`, `Unidad-V`, `Unidad-VI`, `Practica-TP1-Alineamiento` y `Practica-TPI-DVP`).
2. **Alcance de compilación**: Se compilan **todos** los archivos `.md` dentro de `content/unidades/` y `content/practica/` (incluyendo apuntes teóricos, cuestionarios resueltos, enunciados de cátedra y guías prácticas).
