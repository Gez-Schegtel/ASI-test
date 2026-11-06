# ASI 2026

Material de la cursada 2026 reorganizado para separar los apuntes fuente de las herramientas de compilación y de los archivos generados.

## Qué hay en esta carpeta

- **`Unidad I/`**: material de estudio de la Unidad I (desarrollo de temas en PDF, notas puntuales en Markdown, cuestionario de autoestudio resuelto y la subcarpeta `TP/` con el TP1 de alineamiento estratégico SI/TI).
- **`Unidad III - Subsistema de Aplicación.md`**: apunte completo y revisado de la Unidad III.
- **`Unidad VI - Seguridad y Auditoría.md`**: apunte completo y revisado de la Unidad VI.
- **`herramientas/`**: scripts, cabeceras YAML y estilos CSS para compilar los apuntes `.md` a PDF y EPUB (llevan la salida a `build/` por defecto). Ver [`herramientas/README.md`](herramientas/README.md) para instrucciones de uso.
- **`build/`**: PDFs y EPUBs ya compilados listos para leer o descargar. Por ahora se suben al repositorio (la regla `build/` en `.gitignore` queda comentada).

## Estado actual

- Las **Unidades III y VI** ya cuentan con apuntes unificados en Markdown listos para compilar a PDF y EPUB desde `herramientas/`.
- La **Unidad I** tiene su material y TP organizados en carpeta, sin pasar todavía a un único `.md` compilable.
- Queda pendiente incorporar y consolidar el resto de las unidades siguiendo el mismo formato en la raíz de `2026/`.
