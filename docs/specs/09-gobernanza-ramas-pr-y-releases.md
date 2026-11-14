# Spec 09 — Gobernanza de Ramas, Pull Requests y Publicación Protegida

* **Estado**: Parcialmente implementada en el repositorio (pendiente de activación de *Rulesets* en GitHub)

* **Fecha**: 2026-11-14

* **Alcance**: Protección de la rama principal (`main`), revisión obligatoria por *Code Owner* (`@Gez-Schegtel`), validación de *status checks* en Pull Requests y blindaje del workflow de Releases (incluyendo tags `v*`).

---

## 1. Diagnóstico del Problema (`AS-IS`)

1. **Rama `main` sin protección en GitHub**:

   * En `Gez-Schegtel/ASI-test`, `main` figuraba sin reglas (`protected: false`, `rules: []`), lo que permitiría a cualquier colaborador con permisos de escritura hacer `push` directo a `main` o mergear Pull Requests sin aprobación ni pruebas exitosas.

2. **Ausencia de `.github/CODEOWNERS`**:

   * Sin un archivo `CODEOWNERS`, una regla genérica de aprobación podría ser satisfecha por otros colaboradores con acceso de escritura sin requerir explícitamente el visto bueno del propietario del repositorio.

3. **Riesgo residual en tags `v*` dentro del pipeline**:

   * Aunque la Spec 06 (Sección 2.5) restringió la publicación de Releases continuos a `refs/heads/main`, un tag `v*` creado sobre un commit perteneciente a una rama auxiliar no mergeada a `main` podía disparar igualmente el workflow de publicación histórica.

---

## 2. Arquitectura de Gobernanza (`TO-BE`)

### 2.1. Controles en el Repositorio (Versionados en Git)

1. **Propiedad de código (`.github/CODEOWNERS`)**:

   * Define `* @Gez-Schegtel` para que todo cambio en el repositorio requiera aprobación explícita del propietario en Pull Requests hacia `main`.

2. **Blindaje en `.github/workflows/editorial-ci.yml`**:

   * **Principio de mínimo privilegio**: El job `lint` opera únicamente con `permissions: contents: read`; solo `build` dispone de `contents: write` y `packages: write`.

   * **Trazabilidad obligatoria de tags `v*` contra `main`**: Cuando el workflow se dispara por un tag `v*`, realiza `checkout` completo y verifica mediante `git merge-base --is-ancestor "${GITHUB_SHA}" refs/remotes/origin/main` que el commit etiquetado pertenezca a `main` antes de empujar imágenes a GHCR o publicar un Release histórico.

   * **Dependencia estricta de pruebas**: El job `build` depende de `lint` (`needs: lint`), y `mkrelease` se ejecuta únicamente si `md2pdf -y --all` finaliza con código de salida `0`.

### 2.2. Controles en GitHub (*Repository Rulesets* sobre `Gez-Schegtel/ASI-test`)

Para que GitHub haga cumplir estas reglas del lado del servidor (*Settings → Rules → Rulesets*):

1. **Ruleset para rama `main`** (*Target: Default branch*):

   * **Bypass list**: Únicamente `Repository admin` (permite `push` directo exclusivo del propietario `@Gez-Schegtel` cuando trabaja en solitario; los colaboradores deben usar ramas auxiliares y Pull Requests).

   * **Restricciones de rama**: `Restrict deletions` y `Block force pushes` activados.

   * **Pull Request obligatorio**: `Require a pull request before merging` con `Required approvals: 1`, `Dismiss stale pull request approvals when new commits are pushed` y `Require review from Code Owners` activados.

   * **Checks obligatorios antes del merge**: `Require status checks to pass` + `Require branches to be up to date before merging`, exigiendo ambos jobs del workflow:

     * `Lint Markdown & Reglas del Repositorio`

     * `Compilar Apuntes (PDF & EPUB)`

2. **Ruleset para tags históricos `v*`** (*Target: Tag pattern `refs/tags/v*`*):

   * **Bypass list**: Únicamente `Repository admin` (opcionalmente ninguno).

   * **Restricciones**: `Restrict creations`, `Restrict updates` y `Restrict deletions` activados, impidiendo que colaboradores publiquen tags `v*` o disparen Releases históricos por fuera del control del propietario.
