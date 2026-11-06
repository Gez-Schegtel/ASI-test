## 🔍 Esquema estructural del monitor

En el marco del **Subsistema de Seguimiento de SI/TI**, un **monitor** es una herramienta de medición que:

- Supervisa el **comportamiento de los elementos clave de un sistema informático**.
    
- Funciona bajo condiciones reales de trabajo.
    
- Permite **medir, analizar y reportar** el rendimiento del sistema.
    

El objetivo del monitor es:

- **Cuantificar y registrar el uso de los recursos del sistema**.
    
- Detectar **cuellos de botella**.
    
- Ajustar parámetros de configuración.
    
- Prever comportamientos bajo distintas cargas.
    

---

### 🧱 Componentes del esquema estructural del monitor

El **monitor** está compuesto por **módulos interconectados**, cada uno con funciones específicas que permiten obtener datos confiables y útiles para la toma de decisiones. Sus componentes son:

---

### 1. 🎛️ **Interfaz de instrumentación**

- Es la **puerta de entrada** al sistema que se quiere observar.
    
- Permite **conectar el monitor con los puntos del sistema que contienen información relevante**.
    
- Suministra datos sobre eventos, estados, tiempos, y otras métricas clave.
    

---

### 2. 🎯 **Elemento selector (o de filtrado)**

- Permite **seleccionar qué actividades o eventos serán registrados**.
    
- El usuario puede dirigir la medición hacia aspectos concretos del sistema.
    
- Este módulo puede **generar variables derivadas**, es decir, datos que no existen directamente pero que se obtienen a partir de otros (por ejemplo, tasa de utilización).
    

---

### 3. 🧮 **Elemento procesador**

- Se encarga de **procesar los datos capturados por el selector**.
    
- Realiza **verificaciones y cálculos preliminares**.
    
- Actúa como intermediario entre la captura de datos y el almacenamiento.
    

---

### 4. 🗃️ **Registrador**

- Guarda los datos ya procesados.
    
- Sirve como **base para el análisis posterior**.
    
- Su diseño debe **minimizar la sobrecarga del sistema**, especialmente en monitores en tiempo real.
    

---

### 5. 📈 **Módulo de análisis e interpretación**

- Permite **comprender los datos recolectados y transformarlos en información útil**.
    
- Puede funcionar en dos modos:
    

|Tipo de análisis|Descripción|
|---|---|
|**Tiempo real**|Procesa los datos a medida que se capturan. Ideal para monitoreo constante.|
|**Batch (por lotes)**|Analiza todos los datos **al final** del periodo de observación. Útil para reportes detallados.|

---

### ⚠️ Sobre la sobrecarga del monitor

> 🧠 **Dato clave:** Todos los monitores **introducen cierto grado de perturbación** en el sistema que están midiendo:

- En los **monitores hardware**, la sobrecarga ocurre en los **puntos de conexión**.
    
- En los **monitores software**, la sobrecarga se produce por el **consumo adicional de recursos del sistema**.
    

Por eso, **el diseño del monitor debe balancear precisión con impacto en el rendimiento**.

