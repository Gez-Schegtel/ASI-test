
## 📡 Técnica de Monitorización

La **monitorización** es una técnica de evaluación de sistemas informáticos que permite:

- **Supervisar**
    
- **Analizar**
    
- **Evaluar el comportamiento y rendimiento** de los sistemas **en funcionamiento real**.
    

> 💡 Se usa cuando **no es posible reproducir condiciones reales de uso**, por lo que se requiere un **seguimiento continuo** del sistema.

---

## 🧪 Tipos de técnicas de monitorización

### 🔁 1. **Detección de acontecimientos (Eventos)**

- Un **acontecimiento** es un **cambio de estado en el sistema**.
    
- Se implementa mediante código adicional llamado _traps_ o interrupciones controladas, insertado en puntos clave del sistema operativo.
    
- Cuando ocurre el evento, se activa una rutina que **registra el instante y los datos relacionados**.
    

**¿Cuándo se usa?**

- Cuando interesa conocer **la secuencia de eventos** o **la cantidad de veces que se repiten** en un periodo.
    

---

### ⏱️ 2. **Periodos de tiempo (Muestreo)**

- Es una técnica **estadística** que permite analizar **una muestra representativa** en lugar de todo el sistema.
    
- Los monitores se activan mediante **interrupciones periódicas o aleatorias** del reloj del sistema.
    

**¿Para qué se usa?**

- Para **estimar cuánto tiempo pasa cada componente del sistema en ciertos estados**.
    
- Para **predecir el comportamiento futuro del sistema** y ayudar en la toma de decisiones.
    

---

## 🧰 Clasificación de los Monitores

### 🖥️ **Según su implementación**

|Tipo|Descripción|
|---|---|
|**Software**|Programas del SO que acceden a su estado y generan reportes. Útiles para sistemas operativos, redes y bases de datos.|
|**Hardware**|Dispositivos físicos que detectan señales eléctricas internas. Se usan en puntos críticos del sistema.|
|**Híbridos**|Combinan software y hardware, aprovechando lo mejor de ambos.|

---

### 🧾 **Según cómo muestran los resultados**

|Tipo|Descripción|
|---|---|
|**En tiempo real**|Analizan datos a medida que llegan. Muestran resultados **de inmediato y continuamente**.|
|**Batch**|Acumulan datos durante un tiempo y luego los **procesan todos juntos**. Útiles para reportes posteriores.|

---

## ✅ ¿Por qué es importante la monitorización?

- Identifica **cuellos de botella**.
    
- Permite **sintonizar (ajustar)** el sistema.
    
- Ayuda a **predecir comportamientos futuros**.
    
- Evalúa si un sistema **cumple con los niveles de servicio esperados**.
    
- Es clave en la **planificación de capacidad**.
    
