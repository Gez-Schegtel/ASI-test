---
title: "Práctica — Esquema de Seguridad y Administración de Riesgos (Caso Exactian)"
date: "2025-07-02"
---

# Esquema de Seguridad — Administración de Riesgos (Caso Exactian)

---

## Etapa 1: Identificación de Riesgos

* **Activo**: Aplicación **Exactian**
* **Ubicación**: Externa (Servidores de Amazon)

### Vulnerabilidades

* Ausencia de un gestor de contraseñas.
* Ausencia de un control *captcha* en el inicio de sesión.

### Amenazas

1. Ciberataque que robe contraseñas.
2. Ciberataque de ingreso de bots (DoS).

### Clasificación de las Amenazas

| Criterio | Físico | Lógico |
| :--- | :--- | :--- |
| **Intento de Amenaza: Accidental** | | |
| **Intento de Amenaza: Deliberada** | | Ambas (1 y 2) |

---

## Etapa 2: Análisis de Riesgos

### Escalas de Evaluación

| Rango de Frecuencias (Probabilidad de Agresión) | Nivel | Rango de Impacto (Probabilidad de Éxito) | Nivel |
| :--- | :--- | :--- | :--- |
| 0 – 10 % | Baja | 0 – 25 % | Baja |
| 10 – 40 % | Media | 25 – 50 % | Media |
| 40 – 70 % | Alta | 50 – 75 % | Alta |
| 70 – 100 % | Muy Alta | 75 – 100 % | Muy Alta |

### Tabla de Análisis Cuantitativo

| Amenaza | Prob. de Agresión (Nivel) | Prob. de Agresión (%) | Prob. de Éxito (Nivel) | Prob. de Éxito (%) | Frecuencia de Pérdida | Pérdida Potencial | Pérdida Esperada (ALE) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **(1) Robo de contraseñas** | Media | 30 % | Alta | 70 % | 21 % | $ 100k | $ 21k |
| **(2) Ingreso de bots (DoS)** | Media | 30 % | Muy Alta | 90 % | 27 % | $ 50k | $ 13.5k |

### Justificación para la Amenaza (1)

* **Probabilidad de agresión media (30 %)**: Porque es algo que ocurre más o menos 4 veces al año.
* **Probabilidad de éxito alta (70 %)**: Porque se ve comprometida información sensible de los usuarios, clientes y proveedores.
* **Pérdida potencial de $ 100k**: Porque se corresponde con pérdida de tiempo para solucionar el problema y con el deterioro de la imagen.
* **Expresión del Riesgo**:
  > *"El riesgo de que ocurra un ciberataque que robe contraseñas debido a la ausencia de un gestor de contraseñas y que esto afecte a la aplicación Exactian es de 21 % y genera una pérdida anual de $ 21k."*

### Justificación para la Amenaza (2)

* **Probabilidad de agresión media (30 %)**: Porque ocurre 4 veces al año.
* **Probabilidad de éxito muy alta (90 %)**: Porque provocaría un corte de los servicios por un tiempo indeterminado.
* **Pérdida potencial de $ 50k**: Porque provoca una interrupción que afecta al servicio pero no a los datos, y un deterioro de la imagen.
* **Expresión del Riesgo**:
  > *"El riesgo de que ocurra un ciberataque DoS debido a la ausencia de un control 'captcha' y que esto afecte a la aplicación Exactian es de 27 % y provocaría $ 13.5k de pérdidas anuales."*

### Consecuencias de la Amenaza (1)

* **Primarias**:
  * Interrupción del servicio a corto plazo.
  * Pérdida de la información o manipulación.
* **Secundarias**:
  * Pérdida de la confianza de los clientes.

### Consecuencias de la Amenaza (2)

* **Primarias**:
  * Interrupción del servicio a corto/mediano plazo.
* **Secundarias**:
  * Incapacidad para continuar con las funciones de control de contratistas.
  * Pérdida de confianza de los clientes.

---

## Etapa 3: Manejo del Riesgo

### (1) Ciberataque que robe contraseñas

* **Estrategia Genérica**: **Prevenir**
* **Líneas de Defensa**:
  * **1.ª Línea — Prevención**: Implementar un gestor de contraseñas.
  * **2.ª Línea — Detección**: Mecanismo de detección de tráfico anómalo.
  * **3.ª Línea — Recuperación**: Soporte técnico y restablecimiento de credenciales.
* **Políticas de Seguridad**:
  * **Permisiva**: Se prohíbe el uso de gestores de contraseñas externos al oficial de la empresa.
  * **Prohibitiva**: Se permite únicamente recuperar la contraseña mediante validación de identidad corporativa, estando prohibido compartir credenciales por correo o mensajería.
