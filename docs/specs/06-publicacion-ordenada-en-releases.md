# Spec 06 — Publicación Continua en Release Principal (`apuntes-al-dia`) y Snapshots Históricos (`v*`)

* **Estado**: Implementada (2026-11-06 — Un único Release principal actualizable en el lugar + soporte de Releases históricos inmutables `v*`)

* **Fecha**: 2026-11-06

* **Alcance**: Reemplazo de *GitHub Actions Artifacts* y de múltiples releases sueltos por un **único Release principal continuo (`apuntes-al-dia`, marcado como `Latest`)** actualizado atómicamente en el lugar mediante `toolchain/bin/mkrelease`, acompañado de **Releases históricos inmutables** al publicar tags de versión `v*`.

---

## 1. Diagnóstico del Problema (`AS-IS`)

1. **Fricción de *Actions Artifacts***: Descargar desde la pestaña *Actions* requiere múltiples clics, obliga a iniciar sesión en GitHub, comprime todo forzosamente en `.zip` y caduca a los 30 días.

2. **Riesgos de tener múltiples Releases móviles por unidad**:

   * Borrar y recrear 5–8 Releases en cada commit (`gh release delete` + `create`) introduce ventanas donde un fallo de red deja una unidad caída (`404`), ensucia la lista de tags de Git y envía múltiples notificaciones por correo a los seguidores (*Watchers*) del repositorio.

   * Por otro lado, crear un Release nuevo por cada commit sin borrar el anterior llenaría la página de `/releases` con decenas de copias repetidas.

---

## 2. Arquitectura Implementada (`TO-BE`)

Se implementa una estrategia **dual (Rolling Release + Snapshots Históricos)** gestionada por el script autocontenido [`toolchain/bin/mkrelease`](../../toolchain/bin/mkrelease):

```mermaid
flowchart LR
    A["Compilación en Docker (build/)"] --> B["toolchain/bin/mkrelease"]
    B --> C{"¿Evento del Workflow?"}
    C -- "Push normal (main / master)" --> D["Actualiza en el lugar 'apuntes-al-dia' (Latest)"]
    C -- "Push de tag 'v*' (ej. v2026.1)" --> E["Crea Release Histórico Inmutable 'v2026.1'"]
```

### 2.1. Un Único Release Principal Continuo (`tag: apuntes-al-dia` / `/releases/latest`)

En cada push a la rama principal (`main` / `master`):

1. **Actualización en el lugar sin caída de enlaces (`--clobber`)**:

   * Si el Release `apuntes-al-dia` ya existe, **no se elimina**: se actualiza el puntero del tag al commit actual, se suben y sobrescriben los archivos con `gh release upload --clobber`, se purgan únicamente los assets que hayan quedado obsoletos (si algún documento cambió de nombre) y se actualiza el cuerpo Markdown con `gh release edit --latest=true`.

   * Así, la URL fija **`/releases/latest`** nunca devuelve `404` durante una compilación ni genera spam de notificaciones.

2. **Organización interna por Unidad y Trabajo Práctico**:

   * El cuerpo del Release presenta un **índice ordenado por Unidad** con tablas y enlaces de descarga directa en **1 clic** tanto al paquete `.zip` completo de cada unidad (`Unidad-I-Completa.zip`, `Unidad-III-Completa.zip`, `Unidad-VI-Completa.zip`, `Practica-TPI-DVP.zip`, `Practica-TP1-Alineamiento.zip`) como a cada archivo `.pdf` y `.epub` individual.

   * Al preparar los archivos individuales para GitHub Releases, `mkrelease` translitera tildes y espacios a nombres ASCII limpios (ej. `Unidad-III_-_Subsistema-de-Aplicacion.pdf`) para evitar que GitHub reemplace caracteres acentuados por puntos (`Aplicaci.n.pdf`), mientras que dentro de cada `.zip` se conservan los nombres originales completos con tildes y espacios.

### 2.2. Resguardo de Versiones Anteriores: Releases Históricos Inmutables (`tags: v*`)

* Las fuentes históricas (`.md` e imágenes) están siempre resguardadas en el historial de commits de Git.

* Además, cuando el equipo desee congelar una versión histórica de los PDFs/EPUBs compilados (por ejemplo al cierre de un parcial o fin de cursada: `git tag v2026-parcial1 && git push origin v2026-parcial1`), el workflow detecta el prefijo `v*` y publica un **Release Histórico Inmutable** (`📚 Snapshot Histórico — v2026-parcial1`, con `--latest=false`) que **jamás es borrado ni sobrescrito** por los commits posteriores, manteniendo siempre arriba a `apuntes-al-dia` como `Latest`.

### 2.3. Limpieza de *Actions Artifacts* y de `README.md`

* En `push` y `workflow_dispatch` no se suben *Artifacts* redundantes en la pestaña *Actions* (solo se suben como vista previa temporal de 3 días en Pull Requests).

* El `README.md` apunta directamente a `/releases/latest` y a los paquetes `.zip` de cada unidad mediante la ruta permanente `/releases/latest/download/<Unidad>.zip`.
