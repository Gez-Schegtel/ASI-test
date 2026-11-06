## 🧪 ¿Cuáles son las técnicas para evaluar sistemas informáticos?

Las **técnicas para evaluar sistemas informáticos** son métodos y herramientas que permiten **medir el rendimiento** de un sistema bajo condiciones específicas de carga y configuración. 

Estas técnicas sirven para:

- **Verificar** si el sistema funciona como se espera.
- **Detectar** problemas de eficiencia (como cuellos de botella).
- **Predecir** el comportamiento ante nuevos escenarios.
- **Planificar** la capacidad futura del sistema.    



Las principales técnicas son:

### 1. 🧩 **Monitorización (Monitoreo)**

**Consiste en observar el sistema en funcionamiento real**, mientras es utilizado por los usuarios, para evaluar su comportamiento y detectar problemas o mejoras.

#### 🛠️ Herramienta clave: **Monitores**

Son instrumentos (software, hardware o ambos) que permiten **seguir y registrar la actividad** del sistema.

#### 📌 Utilidad:

- Identificar cuellos de botella.
    
- Medir el uso de recursos (CPU, RAM, etc.).
    
- Detectar zonas críticas del código.
    
- Ajustar parámetros para optimizar el rendimiento.
    
- Evaluar la carga real y planificarla.
    

#### ⚙️ Tipos de monitorización:

- **Según activación:**
    
    - **Monitores por eventos:** se activan cuando ocurre un suceso (ej. cambio de estado).
        
    - **Monitores por muestreo:** recogen datos a intervalos regulares (fijos o aleatorios).
        
- **Según implementación:**
    
    - **Monitores software:** funcionan desde el propio sistema operativo.
        
    - **Monitores hardware:** dispositivos físicos conectados al sistema.
        
    - **Monitores híbridos:** combinan ambos.
        
- **Según visualización:**
    
    - **Tiempo real:** muestran los resultados a medida que se recolectan.
        
    - **Batch:** analizan los datos una vez finalizada la recolección.
        

---

### 2. 🧮 **Modelado**

Se utiliza cuando el sistema **aún no está completamente instalado o disponible**, y se necesita anticipar cómo funcionará.

#### 🎯 Objetivo:

***SIMULAR EL COMPORTAMIENTO*** del sistema para tomar decisiones sin necesidad de probar directamente sobre él.

#### Tipos de modelado:

- **Modelado por simulación:**
    
    - Se crea un programa que **reproduce el funcionamiento del sistema en el tiempo**, usando eventos y estados.
        
    - Se extraen estadísticas del comportamiento simulado.
        
- **Modelado analítico:**
    
    - Se usan **fórmulas matemáticas** y ecuaciones para describir el comportamiento del sistema.
        
    - Más rápido, pero menos flexible ante casos complejos.
        

#### ⚠️ Dificultades:

Ambos métodos requieren **datos precisos** para ser útiles. La simulación es costosa en tiempo; el modelado analítico puede no servir para todos los escenarios.

---

### 3. 🧪 **Benchmarking**

Es una **evaluación comparativa**: se somete un sistema a una carga determinada para ver **cómo se comporta frente a otros**.

#### 📌 ¿Para qué sirve?

- Comparar equipos, configuraciones o arquitecturas.
- Evaluar el rendimiento antes de una compra.
- Afinar el sistema para lograr mejor performance.
- Diagnosticar problemas o puntos débiles.

#### 🔎 Pasos para realizar un benchmarking:

1. Definir el objetivo (¿qué queremos medir y por qué?). 
2. Elegir el tipo de benchmark adecuado.
3. Documentar el entorno de prueba y parámetros.
4. Ejecutar la prueba.
5. Analizar resultados y causas de diferencias.

#### 🎯 Resultado:

Un conjunto de valores que indican **qué tan bien responde el sistema frente a esa carga**, y si es adecuado para las exigencias reales.

---

### 🧰 Nota final: **¿Y la sintonización (tuning)?**

La **sintonización** no es una técnica de evaluación en sí, pero **utiliza los resultados del modelado, la monitorización o el benchmarking** para hacer **ajustes y mejoras al sistema**. Es un proceso experimental de mejora continua.

