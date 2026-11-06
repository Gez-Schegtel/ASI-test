# GEMINI.md - Protocolo y Directivas del Repositorio

## 1. Identidad y Propósito del Repositorio
Este repositorio es la fuente de verdad canónica, colaborativa y versionada de los apuntes y trabajos prácticos de **Administración de Sistemas de Información (ASI)** — Ingeniería en Sistemas de Información (UTN FRRe).

* **Enfoque técnico**: Redacción en Markdown optimizado para visualización en Obsidian y compilación editorial a PDF/EPUB vía Pandoc (LuaLaTeX).
* **Bibliografía canónica de referencia**: Chiavenato (RRHH), Robson (Management SI/TI, RUO, Cadena de Valor/Riesgos), Andreu/Ricart/Valor (Estrategia y TI), Molero (Rendimiento y Capacidad), Lardent y Piattini (Auditoría y Control Interno), Martha Alles (Competencias).

---

## 2. Principios de Diseño del Repositorio (Inviolables)

1. **Git es exclusivamente para fuentes**: Solo se versionan archivos `.md`, scripts de tooling, plantillas, configuraciones y assets crudos (`.png`, `.jpg`, `.svg`).
2. **Cero artefactos en Git**: Los archivos generados (`.pdf`, `.epub`, carpetas `build/`) están estrictamente ignorados en `.gitignore`. La compilación final se delega a GitHub Actions como artefactos de CI o GitHub Releases.
3. **Autocontención del Toolchain**: Ningún script o configuración debe depender del entorno global del usuario (prohibido hardcodear rutas como `~/.local/share/pandoc`). Todos los defaults, filtros Lua y templates residen dentro de `toolchain/`.
4. **Almacenamiento único de recursos**: Todas las imágenes deben residir en `assets/`. No se admiten imágenes embebidas en Base64 dentro de los archivos Markdown.
5. **Spec-Driven y Estado Vivo (`STATUS.md`)**: Cualquier cambio estructural en el repositorio o en el pipeline de herramientas debe estar precedido por una especificación en `docs/specs/` y quedar registrado en `docs/STATUS.md`. El archivo `docs/STATUS.md` es la bitácora viva del repositorio y **debe mantenerse actualizado en todo momento**.

---

## 3. Mapa de Arquitectura y Responsabilidades

* `content/`: Material de estudio editable.
  * `content/unidades/`: Apuntes teóricos consolidados y cuestionarios de autoestudio resueltos agrupados por Unidad (`Unidad I/` a `Unidad VI/`).
  * `content/practica/`: TPI (Vialidad Provincial - DVP) y guías de trabajos prácticos (`tp1-alineamiento/`).
  * `content/labs/`: Talleres y laboratorios prácticos (e.g., Checkmk, monitoreo).
* `assets/`: Imágenes, diagramas y capturas referenciadas por los documentos Markdown.
* `docs/`: Documentación del proyecto, guías de colaboración, estado vivo y especificaciones técnicas.
  * `docs/GUIA_SUBIDA_APUNTES.md`: Guía paso a paso para agregar nuevas unidades y apuntes.
  * `docs/STATUS.md`: Bitácora viva y radiografía actualizada del estado real del repositorio, avance de unidades/tooling y pendientes.
  * `docs/specs/`: Especificaciones de cambios de tooling, migración o estructura.
* `toolchain/`: Scripts de linteo, normalización, compilación, publicación en Releases e imagen Docker del entorno editorial.
  * `toolchain/Dockerfile`: Imagen Docker (`ghcr.io/<owner>/asi-toolchain`) con Pandoc, LuaLaTeX y caché de fuentes precalentado.
  * `toolchain/bin/`: Ejecutables (`mdnorm`, `md2pdf`, `mkrelease`).
  * `toolchain/pandoc/`: Defaults YAML, fuentes embebidas (`fonts/`), plantillas LaTeX/CSS y filtros Lua.
* `plantillas/`: Prompts base y guías de redacción/mejora de notas.
* `.github/workflows/`: Pipelines de integración y entrega continua (CI/CD).

---

## 4. Convenciones de Formato y Normas Editoriales

Para garantizar compatibilidad simultánea entre Obsidian y el motor Pandoc/LuaLaTeX:

* **Separadores y listas**: Todo título, lista, tabla o bloque de código debe tener exactamente una línea en blanco antes y después.
* **Callouts**: Utilizar la sintaxis estándar de Obsidian (`> [!NOTE]`, `> [!WARNING]`, `> [!IMPORTANT]`, `> [!EXAMPLE]`). El filtro de Pandoc los transforma en cajas celestes/grises en el PDF.
* **Imágenes**: Se referencian siempre mediante rutas relativas a la raíz o estándar de Markdown/Wikilink:
  * Formato admitido: `![Descripción](../../assets/nombre-imagen.png)` o `![[nombre-imagen.png]]`.
  * Nunca usar strings Base64 gigantes dentro de los `.md`.
* **Tablas**: Estrictamente en formato GFM (GitHub Flavored Markdown). No partir filas con tags HTML `<br>` si se puede evitar.
* **Codificación y caracteres**: Texto en UTF-8 con normalización NFC. Evitar emojis en encabezados `#` para prevenir roturas en el motor LaTeX (o verificar que Noto Color Emoji esté activo).
* **Linter obligatorio**: Antes de dar por finalizada la edición de un apunte, ejecutar `toolchain/bin/mdnorm <archivo.md>` para corregir sangrías, delimitadores matemáticos y espaciados.

---

## 5. Comportamiento y Flujo de Trabajo del Agente

Cuando se trabaje en tareas dentro de este repositorio, el agente debe seguir este ciclo:

1. **Inspeccionar el repositorio y consultar `docs/STATUS.md`**:
   * Siempre verificar primero cómo está el árbol real del repositorio y leer `docs/STATUS.md` para entender el estado actual, las decisiones tomadas y las tareas pendientes.
   * Si la tarea implica un cambio de arquitectura o tooling, leer o redactar la spec correspondiente en `docs/specs/`.

2. **Ejecutar tareas de contenido**:
   * Mantener el tono académico, riguroso y formal de la cátedra de ASI.
   * Cruzar siempre los conceptos con los autores de referencia (Chiavenato, Robson, Andreu, etc.).
   * Si se extraen notas viejas (e.g. de 2025 o compilados monolíticos), mover las imágenes a `assets/`, normalizar la sintaxis y ubicar el archivo en su unidad correspondiente de 2026.

3. **Ejecutar tareas de tooling y automatización**:
   * Probar cambios ejecutando el linter localmente (`toolchain/bin/mdnorm`).
   * Verificar que las rutas de `pandoc` pasen `--data-dir` o `--defaults` relativos a la raíz del repositorio.
   * No commitear binarios ni PDFs generados durante las pruebas locales.

4. **Mantener actualizado `docs/STATUS.md` (Obligatorio)**:
   * Antes de cerrar cualquier tarea o sesión, actualizar `docs/STATUS.md` reflejando el estado exacto en que queda el repositorio, los cambios ejecutados en la bitácora y qué queda pendiente.
