## 🧪 Clasificación de los Monitores

Un **monitor** es una herramienta clave del [[Subsistema de control (o Seguimiento)]], utilizada para **medir y evaluar el rendimiento del sistema informático mientras está en uso**. Aunque pueden introducir cierta sobrecarga, son imprescindibles para identificar cuellos de botella, ajustar parámetros y prever el comportamiento del sistema.

---

### 🔁 CLASIFICACIÓN según el **mecanismo de ACTIVACIÓN**

Se refiere a **cómo el monitor se activa para recolectar información**:

- 🔸 **Monitores de eventos (acontecimientos)**  
    Se activan ante **cambios de estado en el sistema** (ej. interrupciones).  
    Insertan código (_traps_) en puntos clave del sistema operativo.  
    👉 Útiles para **contar o rastrear eventos específicos**.  
    ⚠️ Si el evento es frecuente, pueden causar **alta sobrecarga**.
    
- 🔸 **Monitores de muestreo (por periodos de tiempo)**  
    Se activan a **intervalos fijos o aleatorios** usando interrupciones de reloj.  
    👉 Útiles para **estimar fracciones de tiempo en distintos estados** o **predecir el comportamiento futuro**.  
    ✔️ Tienen menor interferencia.
    

---

### 🧩 CLASIFICACIÓN según su **IMPLANTACIÓN (ESTRUCTURA técnica)**

- 🧠 **Monitores Software**
    
    - Son **programas o extensiones del sistema operativo**.
        
    - Miden estados de componentes del sistema informático.
        
    - 👎 Alta interferencia.
        
    - ✔️ Económicos y flexibles.
        
- 💾 **Monitores Hardware**
    
    - Son **dispositivos físicos** que detectan señales eléctricas.
        
    - Bajo consumo y muy precisos.
        
    - 👍 Baja interferencia.
        
    - 👎 Costosos y menos portables.
        
- 🧬 **Monitores Híbridos**
    
    - Combinan software y hardware.
        
    - Buscan equilibrio entre precisión y costo.
        
    - ✔️ Interferencia media.
        

---

### 📊 CLASIFICACIÓN según la **forma de MOSTRAR RESULTADOS**

- ⏱️ **Monitores en tiempo real**
    
    - Procesan los datos **al instante en que se capturan**.
        
    - Ofrecen una **vista continua de la evolución del sistema**.
        
    - ✔️ Muy útiles para intervenciones rápidas.
        
- 🧾 **Monitores Batch**
    
    - Recogen todos los datos primero y **los procesan al finalizar** el período de recolección.
        
    - ✔️ Útiles para **análisis histórico o detallado**.
        
    - 👎 No sirven para seguimiento en vivo.
        

---

### 📋 Comparativa de monitores (por implantación)

|Característica|🖧 Monitor Hardware|🧠 Monitor Software|⚙️ Monitor Híbrido|
|---|---|---|---|
|Dominio de medición|Bajo nivel (fijo)|Alto nivel|Mixto (todos)|
|Resolución|Alta (precisa)|Baja/variable|Alta|
|Interferencia|Baja|Alta|Media|
|Coste|Alto|Bajo|Alto|
|Reducción de datos|No|Sí|Depende|
|Portabilidad|Alta|Baja|Limitada|
