# Spec 10 — Matrices 2×2 y Cuadrículas con Bordes Completos (`tablas-matriz.lua`)

* **Estado**: Implementada (2026-11-15)

* **Fecha**: 2026-11-15

* **Alcance**: Soporte editorial en `toolchain/pandoc/` (`tablas-matriz.lua`, `estilo.tex`, `estilo-epub.css`, `pdf.yaml`, `epub.yaml`) y actualización de la matriz 2×2 de *Cartera de aplicaciones actuales* en `content/trabajo-practico/parte-1/Trabajo Práctico - Parte 1.md`.

---

## 1. Diagnóstico del Problema (`AS-IS`)

1. **Tablas tipo cuadrante (Matriz de McFarlan 2×2) sin divisiones internas en PDF**:

   * Pandoc compila todas las tablas Markdown en LaTeX utilizando `longtable` con estilo `booktabs` (`\toprule`, `\midrule` únicamente debajo de la fila 1 y `\bottomrule` al cierre), omitiendo bordes verticales y líneas horizontales entre filas del cuerpo.

   * En matrices de 4 cuadrantes (como las dos tablas de *Cartera de Aplicaciones* de `Trabajo Práctico - Parte 1.md`), la tercera fila (*Clave para las operaciones* / *De Apoyo*) quedaba sin línea divisoria superior ni inferior y sin barra vertical central, perdiendo la estructura visual de 2×2 cuadrados.

2. **Incompatibilidad de *Grid Tables* con Obsidian**:

   * La sintaxis de *grid table* (`+---+`) utilizada originalmente en el archivo no es reconocida por Obsidian ni cumple con la convención GFM de `GEMINI.md`.

---

## 2. Solución Implementada (`TO-BE`)

### 2.1. Marcador Limpio en Markdown (`<!-- matriz-2x2 -->`)

Las matrices de 4 cuadrantes se escriben en **formato estándar GFM (*pipe table*)** utilizando viñetas `•` (procesadas por `tablas-listas.lua`) precedidas por el comentario HTML invisible `<!-- matriz-2x2 -->`:

* En **Obsidian** y **GitHub**, el comentario es invisible y la tabla se renderiza correctamente como tabla GFM.

* Permite que `toolchain/bin/mdnorm` valide la tabla sin advertencias ni transformaciones destructivas.

### 2.2. Filtro Lua `toolchain/pandoc/filters/tablas-matriz.lua`

Se ejecuta inmediatamente después de `tablas-listas.lua` tanto en `pdf.yaml` como en `epub.yaml`:

* **En PDF (`LaTeX`)**: Convierte la tabla 2×4 marcada con `<!-- matriz-2x2 -->` en un entorno `tabular` de dos columnas iguales (`0.5\linewidth` cada una) con bordes completos (`|` y `\hline`) en `barcolor`, sombreado `fondocolor` en ambas filas de títulos de cuadrante (filas 1 y 3), alineación horizontal respetando `:---` (`\raggedright`), `:---:` (`\centering`) y `---:` (`\raggedleft`), y alineación superior uniforme mediante `minipage[t]` (usando `colortbl` cargado desde `estilo.tex`).

* **En EPUB3 (`HTML/CSS`)**: Consume el comentario marcador, añade la clase `.matriz-2x2` a la tabla y aplica estilos dedicados en `estilo-epub.css` para sombrear y enmarcar los 4 cuadrantes de forma equivalente al PDF, respetando la alineación por columna (`:---`, `:---:`, `---:`) y manteniendo las listas `<ul>` alineadas a la izquierda.

* *(Soporte general adicional)*: Admite también `<!-- cuadricula -->` sobre cualquier tabla NxM para dibujarla en PDF/EPUB con bordes completos en todas sus celdas y alineación horizontal por columna.

### 2.3. Control de Alineación Vertical (`valign` y `hvalign`)

Sobre cualquier tabla (`<!-- matriz-2x2 ... -->`, `<!-- cuadricula ... -->` o tablas `booktabs` comunes mediante `<!-- valign=... -->` / `<!-- tabla valign=... -->`) se puede elegir la alineación vertical manteniendo `top` (`arriba`) como estándar por defecto:

* **Modificadores admitidos**: `valign=top|middle|bottom` (aliases en español: `arriba`, `medio`/`centro`, `abajo`) para toda la tabla y `hvalign=top|middle|bottom` opcional para alinear el encabezado de forma independiente (por ejemplo `<!-- cuadricula hvalign=middle -->` o `<!-- valign=bottom hvalign=middle -->`).

* **En PDF (`LaTeX`)**: En cuadrículas y matrices (`tabular`) usa columnas nativas `p{}`, `m{}` o `b{}` del paquete `array` (con `\multicolumn{1}` en encabezados cuando `hvalign` difiere de `valign`); en tablas `booktabs` (`longtable`) reemplaza `p{...}` por `m{...}`/`b{...}` en las columnas declaradas y ajusta `[t]`/`[c]`/`[b]` en los bloques de encabezado.

* **En EPUB3 (`HTML/CSS`)**: Añade las clases `.valign-{top,middle,bottom}` y `.hvalign-{top,middle,bottom}` sobre `<table>`, con soporte en `estilo-epub.css` (incluyendo la segunda fila de encabezado de `.matriz-2x2`).

---

## 3. Referencia Rápida de Uso en Markdown

| Objetivo visual | Comentario HTML antes de la tabla | Ejemplo / Notas |
| :--- | :--- | :--- |
| Matriz de 4 cuadrantes (arriba por defecto) | `<!-- matriz-2x2 -->` | Tabla 2×4 (filas 1 y 3 sombreadas como títulos) |
| Matriz 2×2 centrada | `<!-- matriz-2x2 valign=middle -->` | Combinar con `\| :---: \| :---: \|` para centrar títulos horizontalmente |
| Cuadrícula NxM con bordes | `<!-- cuadricula -->` | Acepta `valign=...` y `hvalign=...` |
| Tabla `booktabs` estándar alineada al medio/abajo | `<!-- valign=middle -->` o `<!-- valign=bottom -->` | También admite `<!-- tabla valign=abajo hvalign=centro -->` |
| Solo encabezados centrados y cuerpo arriba | `<!-- cuadricula hvalign=middle -->` o `<!-- hvalign=middle -->` | Mantiene el estándar `top` para párrafos largos en el cuerpo |

* **Alineación horizontal**: se define siempre con el separador GFM (`:---` izquierda, `:---:` centro, `---:` derecha). En celdas con listas (`•`), las viñetas se mantienen alineadas a la izquierda en PDF (`itemize`) y EPUB (`ul { text-align: left; }`).

* **Aliases admitidos en `valign` / `hvalign`**: `top`/`arriba`, `middle`/`center`/`medio`/`centro`, `bottom`/`abajo` (separables por `=`, `:` o `-`, por ej. `valign=medio` o `hvalign-centro`). Los comentarios HTML informativos que no coincidan con estas directivas se dejan intactos.
