# Spec 08 — Estandarización de Directorios al Estándar Unix (Kebab-Case en Minúsculas)

* **Estado**: En proceso de implementación

* **Fecha**: 2026-11-11

* **Alcance**: Homogeneización total de los nombres de directorios bajo `content/`, jerarquía en `build/` y sincronización del toolchain editorial (`md2pdf`, `mkrelease`), pipelines de CI/CD y documentación rectora (`GEMINI.md`, `README.md`, `STATUS.md`).

---

## 1. Diagnóstico del Problema Actual (`AS-IS`)

El repositorio presentaba disparidad de convenciones en la denominación de carpetas:

1. **Inconsistencias en `content/unidades/`**:

   * El directorio padre `unidades` está en minúsculas, pero sus subdirectorios utilizaban *TitleCase* con espacios y números romanos (`Unidad 0/`, `Unidad I/`, `Unidad III/`, `Unidad VI/`).

   * Los números romanos dificultan el ordenamiento alfanumérico natural en sistemas de archivos y scripts.

2. **Espacios y caracteres diacríticos en `content/trabajo práctico/`**:

   * La carpeta contenía tildes y espacios (`trabajo práctico/`), y sus subcarpetas tenían espacios (`parte 1/`, `parte 2/`).

   * Aunque el toolchain y los scripts de terminal manejan entrecomillado, los espacios y tildes en rutas complican la navegación interactiva en terminal, generan secuencias `%20` en enlaces URL de Git/GitHub y pueden causar fricciones en entornos Docker o sistemas con distintas configuraciones locales de codificación.

3. **Salida dispar en `build/`**:

   * Los artefactos compilados reflejaban rutas heterogéneas (`build/Unidad I/`, `build/Trabajo Práctico Integrador/parte 1/`, `build/Labs/`).

---

## 2. Arquitectura Propuesta (`TO-BE`)

### 2.1. Regla de Nomenclatura Canónica
Todos los directorios del repositorio se normalizan bajo el estándar Unix clásico:

* **Estrictamente en minúsculas** (`a-z`, `0-9`).

* **Sin espacios**: palabras compuestas separadas por guion medio (*kebab-case*).

* **Sin tildes ni caracteres diacríticos**.

* **Numeración arábiga simple**: `unidad-0`, `unidad-1`, ..., `unidad-6` para garantizar ordenamiento lexicográfico inmediato.

### 2.2. Mapeo Canónico de Rutas

| Dominio | Ruta Anterior (`AS-IS`) | Ruta Canónica (`TO-BE`) |
| :--- | :--- | :--- |
| **Unidad 0** | `content/unidades/Unidad 0/` | `content/unidades/unidad-0/` |
| **Unidad I** | `content/unidades/Unidad I/` | `content/unidades/unidad-1/` |
| **Unidad II** *(futura)* | `content/unidades/Unidad II/` | `content/unidades/unidad-2/` |
| **Unidad III** | `content/unidades/Unidad III/` | `content/unidades/unidad-3/` |
| **Unidad IV** *(futura)* | `content/unidades/Unidad IV/` | `content/unidades/unidad-4/` |
| **Unidad V** *(futura)* | `content/unidades/Unidad V/` | `content/unidades/unidad-5/` |
| **Unidad VI** | `content/unidades/Unidad VI/` | `content/unidades/unidad-6/` |
| **TPI Parte 1** | `content/trabajo práctico/parte 1/` | `content/trabajo-practico/parte-1/` |
| **TPI Parte 2** | `content/trabajo práctico/parte 2/` | `content/trabajo-practico/parte-2/` |
| **Labs** | `content/labs/cmk/`, `taller-1/` | `content/labs/cmk/`, `content/labs/taller-1/` *(sin cambios)* |

> [!NOTE]
> Los **nombres de los archivos Markdown** (ej. `Unidad I - Planificación Estratégica de SI-TI.md`, `Trabajo Práctico - Parte 1.md`) conservan su denominación formal y académica original, ya que Pandoc y la plantilla editorial los utilizan para deducir el título principal del documento compilado.

---

## 3. Plan de Implementación

1. **Renombrado atómico en Git**:

   * Ejecución de `git mv` sobre cada directorio de `content/` preservando el historial completo de commits.

2. **Actualización de Toolchain**:

   * **`toolchain/bin/md2pdf`**: Actualización de `calcular_salida()` para emitir hacia `build/unidad-X/`, `build/trabajo-practico/parte-X/` y `build/labs/X/`, manteniendo compatibilidad con posibles rutas históricas.

   * **`toolchain/bin/mkrelease`**: Definición de los bloques de empaquetado apuntando a las nuevas rutas `unidad-X` y `trabajo-practico/parte-X`, con fallbacks de búsqueda defensivos.

3. **Actualización de CI/CD**:

   * **`.github/workflows/editorial-ci.yml`**: Actualización del comando `find` para compilar `content/unidades`, `content/trabajo-practico` y `content/labs`.

4. **Actualización de Documentación Rectoral**:

   * **`GEMINI.md`**: Actualización del mapa de arquitectura.

   * **`README.md` y `toolchain/README.md`**: Actualización de ejemplos de ejecución y árbol de directorios.

   * **`docs/GUIA_SUBIDA_APUNTES.md`**: Actualización de las guías de colaboración.

   * **`docs/STATUS.md`**: Registro en la bitácora y actualización de métricas del árbol.

5. **Verificación y Pruebas**:

   * Ejecución de `mdnorm --check` sobre todas las notas.

   * Compilación completa de prueba con `md2pdf -y --all`.

   * Ejecución de `mkrelease --dry-run` para validar el índice y las tablas generadas.
