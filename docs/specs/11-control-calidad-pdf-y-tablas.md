# Spec 11 — Control Automático de Calidad en PDF y Criterios de Maquetación (`md2pdf` / CI / `GEMINI.md`)

* **Estado**: Implementada (2026-11-16)

* **Fecha**: 2026-11-16

* **Alcance**: `toolchain/bin/md2pdf`, `toolchain/Dockerfile`, `.github/workflows/editorial-ci.yml`, `GEMINI.md`, `docs/GUIA_SUBIDA_APUNTES.md` y `docs/STATUS.md`.

---

## 1. Motivación y Diagnóstico (`AS-IS`)

Pandoc + LuaLaTeX devuelve código de salida `0` incluso cuando el PDF generado presenta defectos graves de maquetación silenciosos:

1. **Tablas o cajas irrompibles más altas que una carilla A4** (`Overfull \vbox (...pt too high)`): `LaTeX` empuja la caja a la página siguiente dejando la hoja previa en blanco (solo con el número de página) y recorta las filas excedentes por debajo del borde inferior del PDF.

2. **Desbordes horizontales severos** (`Overfull \hbox` > `12pt`): bloques de código, diagramas ASCII, fórmulas o tablas demasiado anchas que sobresalen del margen derecho.

3. **Glifos sin fuente de respaldo** (`Missing character`): símbolos Unicode o emojis omitidos silenciosamente en el PDF.

4. **Uso excesivo de tablas gigantes**: forzar múltiples párrafos o listas largas dentro de celdas de una única fila provoca filas más altas que una página entera, que ni siquiera `longtable` puede dividir.

---

## 2. Solución Especificada (`TO-BE`)

### 2.1. Verificador Automático de Calidad PDF en `toolchain/bin/md2pdf`

Cada compilación PDF ejecutada mediante `toolchain/bin/md2pdf` ejecuta una etapa automática de diagnóstico (`verificar_calidad_pdf`) combinando dos fuentes:

1. **Análisis del log de LuaLaTeX** (capturado en la misma pasada mediante `pandoc --verbose`, sin sobrecarga de tiempo):

   * Alerta ante **`Overfull \vbox`** (desborde vertical / contenido recortado).

   * Alerta ante **`Overfull \hbox`** con exceso `> 12pt` (desborde horizontal visible).

   * Alerta ante **`Missing character`** (caracteres faltantes en la tipografía).

   * Alerta ante **`Float too large`** u otros errores de caja flotante.

2. **Inspección geométrica del PDF compilado** (cuando `poppler-utils` —`pdftotext` y `pdfimages`— está disponible, incluido por defecto en `toolchain/Dockerfile`):

   * **Páginas en blanco o prácticamente vacías**: páginas sin imágenes cuya única carga de texto son dígitos (número de página) o `0` palabras reales.

   * **Desborde fuera de la caja hacia el pie o bordes de la página**: palabras fuera del número de página centrado que invaden la zona inferior (`yMax > height - 30pt`) o salen de los márgenes extremos laterales (`xMin < 28pt` o `xMax > width - 28pt`).

#### Comportamiento de reporte y banderas CLI

* **Por defecto (modo aviso)**: imprime un resumen claro `⚠️ AVISO DE CALIDAD PDF (<archivo>)` indicando página exacta y anomalía detectada, manteniendo el archivo en `build/` para inspección y corrigiendo visibilidad sin romper compilaciones tolerantes; si existe `$GITHUB_STEP_SUMMARY`, adjunta también el aviso al resumen de GitHub Actions.

* **`--strict-pdf`**: convierte cualquier aviso de calidad PDF (o falla crítica como `Overfull \vbox` / página en blanco / invasión de borde) en error fatal (`exit 1`), recomendado para agentes, revisión local y validaciones automáticas.

* **`--no-pdf-check`**: omite la verificación posterior cuando se desee salida cruda.

### 2.2. Reglas Editoriales Obligatorias (`GEMINI.md` y Guías)

* **Tablas solo cuando aportan claridad estructural**: nunca forzar listas extensas o bloques multipárrafo dentro de una fila única que se acerque al alto de una hoja; usar subtítulos y listas jerárquicas para contenido denso.

* **Cero defectos silenciosos antes de cerrar o commitear**: todo agente o colaborador que modifique `.md` o `toolchain/` debe compilar los archivos afectados con `./toolchain/bin/md2pdf --strict-pdf` (o revisar los avisos de calidad PDF e inspeccionar visualmente las páginas) antes de dar la tarea por terminada.
