# Spec 01 — Resguardo en `legacy/` y Reestructuración Física del Repositorio

* **Estado**: Implementada (2026-11-06 — Opción A aplicada para conversión de los 14 PDFs/DOCX de cátedra a `.md`)

* **Fecha**: 2026-11-06

* **Alcance**: Resguardo preventivo de herramientas actuales en `legacy/`, migración del árbol de directorios a `content/` y `assets/`, extracción de imágenes Base64 y aplicación de la política de cero artefactos compilados en Git.

---

## 1. Motivación y Objetivo

El repositorio acumula estructuras de dos cursadas (`2025/`, `2026/`), carpetas auxiliares (`otros/`), archivos monolíticos en la raíz (`APUNTE 2 parcial.md`), dos sistemas de compilación separados y artefactos binarios (`.pdf`, `.epub`) versionados en Git.

El objetivo de esta especificación es llevar el repositorio a la estructura limpia definida en `GEMINI.md` **sin perder ningún archivo fuente ni romper los scripts actuales mientras se construye el nuevo `toolchain/`**, garantizando trazabilidad en Git mediante `git mv`.

---

## 2. Fase 0 (Obligatoria antes de reestructurar): Resguardo en `legacy/`

Antes de mover apuntes o modificar configuraciones, se creará en la raíz la carpeta temporal `legacy/` para preservar intacto el código y las configuraciones actuales de conversión/normalización:

```text
legacy/
├── script conversor/          <- movido intacto desde ./script conversor/ (md2pdf)
├── script normalizador/       <- movido intacto desde ./script normalizador/ (mdnorm)
├── estilos/                   <- movido intacto desde ./estilos/ (defaults, filters, examples)
└── herramientas-2026/         <- movido intacto desde ./2026/herramientas/ (compilar.sh, compilar-epub.sh, headers, css)
```

> [!IMPORTANT]
> **Condición de salida de `legacy/`**: Esta carpeta permanecerá en el repositorio de forma temporal. Solo se eliminará cuando:
>
> 1. Hayamos documentado y comprendido pieza por pieza el funcionamiento de `md2pdf`, `mdnorm`, `estilos/` y `compilar*.sh`.
>
> 2. Exista en `toolchain/` el nuevo estándar unificado y autocontenido funcionando al 100% para PDF y EPUB.
>
> 3. El equipo dé el visto bueno explícito para borrar `legacy/`.

*(Nota: los 3 archivos `.pdf` de prueba dentro de `estilos/examples/` se quitarán del índice de Git con `git rm --cached` al aplicar la regla global de cero artefactos, conservando sus fuentes `.md` y `logo_utn.png`).*

---

## 3. Fase 1: Migración de Contenidos hacia `content/` y `plantillas/`

Se reorganizará el material editable bajo el directorio canónico `content/`:

### 3.1. `content/unidades/` (Apuntes teóricos canónicos)

| Origen (`AS-IS`) | Destino Propuesto (`TO-BE`) | Acción |
| :--- | :--- | :--- |
| `2026/Unidad III - Subsistema de Aplicación.md` | `content/unidades/Unidad III - Subsistema de Aplicación.md` | `git mv` + actualizar rutas relativas a `../../assets/` |
| `2026/Unidad VI - Seguridad y Auditoría.md` | `content/unidades/Unidad VI - Seguridad y Auditoría.md` | `git mv` + actualizar rutas relativas a `../../assets/` |
| `2026/Unidad I/*.md` (`El ROL de Las TI.md`, `El SI en el contexto de la cadena de valor.md`, `Los Sistemas de Informacion en la Empresa.md`) | `content/unidades/unidad-1-borradores/` *(temporal hasta unificar en `Unidad I - ... .md` en Spec 03)* | `git mv` |

### 3.2. `content/practica/` (TPI, Trabajos Prácticos y Cuestionarios)

| Origen (`AS-IS`) | Destino Propuesto (`TO-BE`) | Acción |
| :--- | :--- | :--- |
| `2026/Trabajo Práctico/Explicación del TPI.md` | `content/practica/tpi-dvp/Explicación del TPI.md` | `git mv` |
| `2026/Unidad I/TP/*.md` (6 guías explicativas del TP1) | `content/practica/tp1-alineamiento/` | `git mv` |
| `2026/Cuestionarios de Autoestudio/Aplicación de recursos - Resolución.md` | `content/practica/cuestionarios/Aplicación de recursos - Resolución.md` | `git mv` |
| `2026/Cuestionarios de Autoestudio/Seguridad y auditoría - Resolución.md` | `content/practica/cuestionarios/Seguridad y auditoría - Resolución.md` | `git mv` |

### 3.3. `content/labs/` (Laboratorios y Talleres Técnicos)

| Origen (`AS-IS`) | Destino Propuesto (`TO-BE`) | Acción |
| :--- | :--- | :--- |
| `otros/labs/cmk/*` (`docker-compose.yml`, `http_ping.py`, `runtest.sh`, `requirements.txt`, `README.md`) | `content/labs/cmk/` | `git mv` |
| `otros/taller_1/EO 1.md` | `content/labs/taller-1/EO 1.md` | `git mv` |

### 3.4. Tratamiento del Material Histórico (`2025/`, `APUNTE 2 parcial.md`, `otros/actividades/`)

Para mantener `content/unidades/` libre de ruido y borradores duplicados mientras extraemos las Unidades I, II, IV y V (Spec 03), se propone alojar temporalmente la materia prima histórica en `legacy/archivo-2025/`:

* `2025/` -> `legacy/archivo-2025/2025/`

* `APUNTE 2 parcial.md` -> `legacy/archivo-2025/APUNTE 2 parcial.md` (ya limpio de Base64, ver Fase 2)

* `otros/actividades/` y `otros/img/glosario/` -> `legacy/archivo-2025/otros/`

Una vez que toda la teoría útil haya sido integrada y validada en `content/unidades/Unidad I..VI.md`, se podrá decidir si conservar o purgar `legacy/archivo-2025/`.

---

## 4. Fase 2: Unificación Total de Recursos en `assets/`

Siguiendo el Principio 4 de `GEMINI.md` (*Almacenamiento único de recursos y cero Base64*):

1. **Consolidación de imágenes sueltas**:

   * Mover las **150 imágenes** de `otros/img/` a `assets/`.

   * Mover las **20 imágenes** de `2025/par_2/consignas/` a `assets/consignas-2025/` (o `assets/` con prefijo claro).

   * Eliminar `2025/par_1-RECUPERATORIO/Pasted image 20251114205618.png` por ser idéntica byte a byte (`SHA-256: 71dd4709...`) a `otros/img/Pasted image 20251114205618.png`.

   * Mover `otros/gárficos.drawio` a `assets/graficos.drawio`.

2. **Extracción automatizada de Base64 en `APUNTE 2 parcial.md`**:

   * Ejecutar un script puntual que extraiga las **62 imágenes `data:image/...;base64`** incrustadas en `APUNTE 2 parcial.md`, las guarde en `assets/apunte2-img-01.png` ... `62.png` (deduplicando por hash SHA-256 si alguna ya existe en `assets/`) y reemplace en el `.md` cada cadena Base64 por su referencia limpia a `assets/`. Esto reducirá `APUNTE 2 parcial.md` de **4,1 MB** a menos de **200 KB** de texto puro.

---

## 5. Fase 3: Saneamiento de Artefactos Binarios y `.gitignore`

### 5.1. Eliminación en Git de los 12 artefactos compilados propios

Se eliminarán del repositorio (`git rm`) los siguientes archivos generados porque su fuente `.md` canónica ya existe en el repositorio:

* `2026/build/Unidad III - Subsistema de Aplicación.pdf` y `.epub`

* `2026/build/Unidad VI - Seguridad y Auditoría.pdf` y `.epub`

* `2026/Unidad III - Subsistema de Aplicación.pdf`

* `2026/Unidad VI - Seguridad y Auditoría.pdf`

* `2026/Cuestionarios de Autoestudio/Aplicación de recursos - Resolución.pdf`

* `2026/Cuestionarios de Autoestudio/Seguridad y auditoría - Resolución.pdf`

* `2026/Trabajo Práctico/Explicación del TPI.pdf`

* `estilos/examples/example_1.pdf`, `example_2.pdf`, `example_3.pdf`

* Se eliminará también `2026/.gitignore` para centralizar todas las reglas en el `.gitignore` raíz.

### 5.2. Nuevo `.gitignore` raíz

```gitignore
# Entornos de edición y SO
.obsidian/
.DS_Store
Thumbs.db

# Salidas de compilación y artefactos generados (Principio 2)
build/
**/build/
*.pdf
*.epub
*.tex
*.log
*.aux
*.toc
*.out

# Entornos virtuales y datos de laboratorios (Checkmk / Python)
**/venv/
**/.venv/
**/__pycache__/
**/checkmk_data/
```

---

## 6. Decisiones Abiertas para Revisar con el Equipo

> [!WARNING]
> Antes de ejecutar esta Spec, necesitamos definir qué hacer con los **14 archivos `.pdf` y `.docx` de cátedra o entregas grupales que hoy NO tienen fuente `.md`** (por ejemplo: `2026/Trabajo Práctico/TPI Parte 2.pdf`, `2026/Unidad I/U1-Desarrollo de los temas-1.pdf`, `TP1 - Alineamiento de SI-TI.pdf` y los PDFs de enunciados de cuestionarios).

Opciones propuestas:

* **Opción A (Estricta con conversión previa — Recomendada)**: Antes de borrar esos PDFs del índice de Git, extraemos/convertimos su contenido textual relevante a archivos `.md` dentro de `content/practica/` y `legacy/archivo-2025/` (y los PDFs originales quedan fuera de Git o respaldados localmente/en Google Drive de la cursada).

* **Opción B (Excepción temporal en `legacy/referencias-pdf/`)**: Ignorar `*.pdf` en todo el repo excepto `!legacy/referencias-pdf/**` mientras dure la migración de las Unidades I, II, IV y V, borrando `legacy/` completo al finalizar el proyecto.

* **Opción C (Purga directa de Git)**: Sacarlos de Git con `git rm --cached` (quedan en tu disco local ignorados por `.gitignore`, sin subirse al remoto).
