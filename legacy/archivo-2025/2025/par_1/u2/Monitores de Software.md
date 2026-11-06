## 🧠 Funcionamiento de los Monitores Software

Los **monitores software** son herramientas de evaluación implementadas como **programas o extensiones del sistema operativo**, diseñadas para **acceder al estado del sistema y reportarlo al usuario**.  
Son especialmente adecuados para la monitorización de:

- Sistemas operativos
    
- Redes
    
- Bases de datos
    
- Aplicaciones que interactúan con estos componentes
    

---

### ⚙️ ¿Cómo funcionan?

Se basan en la **detección de acontecimientos o eventos**, donde un _evento_ es cualquier **cambio de estado del sistema**.

1. Se **inserta código especial** (conocido como `traps` o interrupciones controladas por el programa) en puntos estratégicos del sistema.
    
2. Cuando ocurre un evento, este código **redirecciona el control a una rutina** que:
    
    - Almacena los **datos relevantes** del evento
        
    - Registra el **instante en que ocurrió**
        
3. Este método se usa especialmente para:
    
    - Conocer la **secuencia** de los eventos
        
    - Saber **cuántas veces** se produjeron en cierto periodo
        

---

### 🕒 Consideraciones Temporales

Los autores del material resaltan varios aspectos clave respecto al tiempo:

#### ⚠️ Sobrecarga o Interferencia

- Los monitores consumen recursos del sistema que observan.
    
- En el caso de los **monitores software**, esta **interferencia suele ser alta**, especialmente si el evento ocurre con frecuencia.
    
- Por ello, es esencial que la **sobrecarga sea mínima**, para no alterar el comportamiento del sistema.
    

#### ⏱️ Frecuencia de muestreo

- En monitores que trabajan por **muestreo**, se activan a intervalos **fijos o aleatorios**.
    
- Es clave ajustar la frecuencia de muestreo según:
    
    - La frecuencia del evento a analizar
        
    - El **nivel de resolución deseado**
        
- También se debe definir una **longitud adecuada de la sesión de medición**, de modo que se logre:
    
    - Un nivel de confianza aceptable
        
    - Una interferencia mínima
        

#### 📊 Forma de presentar resultados

- **Tiempo real**: Analizan los datos **mientras los recopilan**, mostrando resultados en vivo.
    
- **Modo batch**: Recolectan primero y procesan los datos **al finalizar la sesión**.
    

#### 🔁 Irreproducibilidad de la carga

> 📌 _"Normalmente no es posible repetir exactamente las mismas condiciones de carga en distintos momentos."_

Por eso se prefiere el término **monitorización** en lugar de _medición_, ya que lo que se realiza es un **seguimiento continuo** del sistema, en lugar de una medición precisa única.

