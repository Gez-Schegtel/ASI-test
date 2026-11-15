# Spec 10 — Matrices 2×2 y Cuadrículas con Bordes Completos (`tablas-matriz.lua`)

* **Estado**: Implementada (2026-11-15)

* **Fecha**: 2026-11-15

* **Alcance**: Soporte editorial en `toolchain/pandoc/` (`tablas-matriz.lua`, `estilo.tex`, `estilo-epub.css`, `pdf.yaml`, `epub.yaml`) y actualización de las matrices 2×2 de McFarlan en `content/trabajo-practico/parte-1/Trabajo Práctico - Parte 1.md`.

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

* **En PDF (`LaTeX`)**: Convierte la tabla 2×4 marcada con `<!-- matriz-2x2 -->` en un entorno `tabular` de dos columnas iguales (`0.5\linewidth` cada una) con bordes completos (`|` y `\hline`) en `barcolor`, sombreado `fondocolor` en ambas filas de títulos de cuadrante (filas 1 y 3) y alineación superior uniforme mediante `minipage[t]` (usando `colortbl` cargado desde `estilo.tex`).

* **En EPUB3 (`HTML/CSS`)**: Consume el comentario marcador, añade la clase `.matriz-2x2` a la tabla y aplica estilos dedicados en `estilo-epub.css` para sombrear y enmarcar los 4 cuadrantes de forma equivalente al PDF.

* *(Soporte general adicional)*: Admite también `<!-- cuadricula -->` sobre cualquier tabla NxM para dibujarla en PDF/EPUB con bordes completos en todas sus celdas.
