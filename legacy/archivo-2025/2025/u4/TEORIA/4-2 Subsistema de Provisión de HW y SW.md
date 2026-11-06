
## ⚙️ Subsistema de Provisión de SW y HW

---

### 1. ¿Qué incluye el subsistema de provisión de SW y HW?

El subsistema de provisión de SW y HW incluye el **conjunto de procedimientos, técnicas de calificación y pautas** cuya finalidad es la **selección de soluciones de SW y/o HW más convenientes** para la organización, de acuerdo con las necesidades especificadas. Su meta es abastecer a la organización de los recursos de SI/TI según la arquitectura planeada.

![[Pasted image 20251101180806.png]]

### ¿Qué cuestiones deben tenerse en cuenta en la provisión?

Las **cuestiones clave** que deben tenerse en cuenta en la provisión son:
- Determinar la **mejor alternativa técnico-operativa-económica** para proveer el SW y/o HW.
- La selección debe basarse en **técnicas de calificación y priorización**, siguiendo **pautas formales y el criterio profesional**.
- El proceso de determinar las **fuentes de provisión *NO* es un proceso puramente técnico**, sino un **proceso de toma de decisiones**.
- **Evaluar la implicancia de todas las aplicaciones** con sumo cuidado, ya que el **sentido empresarial** a menudo impone limitaciones estrictas al proceso.  
- Elegir y planificar los **enfoques de conversión** (Abrupto, En fases, Paralelo, Piloto) antes de la adquisición, ya que esto influye en otras opciones del proceso de selección.

---

### **2. Teniendo en cuenta la ubicación de SI/TI, concluya cómo afecta cada esquema de organización a las políticas y proceso de provisión de SW y HW.**


#### 🗺️ Conclusión: Impacto de la Ubicación de SI/TI en la Provisión de SW y HW

La **Ubicación de los SI/TI** (Centralizada, Descentralizada o Delegada) afecta directamente las políticas y el proceso de provisión de SW y HW porque define **quién tiene la autoridad para tomar decisiones** y cuál es el **objetivo estratégico** principal de la tecnología en la empresa (Eficiencia vs. Efectividad).

El esquema de ubicación impone un **marco de control** que la provisión debe obedecer:

| **Esquema de Ubicación**      | **Foco Estratégico y Control**                                                     | **Efecto en Políticas y Proceso de Provisión**                                                                                                                                                                                          |
| ----------------------------- | ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **(Re)Centralizada**          | Foco en la **Eficiencia**, el **Control Total** y la **Integración**.              | ✅ **Políticas Rígidas y Uniformes**: Se favorecen políticas de provisión de **Normas Fijas**, donde el catálogo de SW y HW es limitado y estandarizado.                                                                                 |
|                               | **Decisiones de Control Centralizadas**.                                           | ✅ **Proceso Orientado a la Eficiencia**: Busca **economías de escala** y evita la **duplicación** de recursos (mínima incompatibilidad), aunque puede ser lento y **separado de las prioridades del negocio real**.                     |
| **Descentralizada/ Delegada** | Foco en la **Efectividad**, la **Velocidad** y la **Autonomía** del usuario final. | ✅ **Políticas Flexibles y Adaptables**: Se requieren políticas de **Libertad Total** o **Intercambio de Datos** para que cada área pueda responder a sus necesidades específicas.                                                       |
|                               | **Decisiones de Control Dispersas** (al usuario final).                            | ✅ **Proceso Orientado a la Efectividad**: Prioriza la **capacidad de respuesta** y la **integración con el negocio**; sin embargo, aumenta el riesgo de **incompatibilidades futuras** y **altos costos agregados** por la duplicación. |

##### Conclusión Final

> Independientemente de la ubicación, la **Política de Adquisición** (que forma parte del Subsistema de Provisión) debe servir como un **marco estratégico** que asegure la **coordinación** entre las compras (ej., imponiendo la compatibilidad en la infraestructura básica), garantizando que la autonomía no comprometa la coherencia de la arquitectura de SI de la empresa.

### **3. ¿Quiénes intervienen en la provisión de SW y HW?**

Intervienen diferentes grupos con roles, intereses y responsabilidades distintas a lo largo del proceso de provisión:

1. **La Gerencia Superior (Alta Dirección):** Debe reconocer la **ganancia potencial** de la adquisición y asumir un **rol activo o de apoyo** al proceso, especialmente en la primera adquisición de un elemento de SI. Su compromiso es fundamental para el éxito.
    
2. **El "Departamento" de Provisión de IS:** Puede ser un **centro de costos o de beneficios** de la empresa; brinda servicios efectivos y realiza compras en forma autónoma.
    
3. **El "Departamento" de Compras de IS:** Sus intereses son las **alternativas de compra**. Puede estar dentro de la función del usuario.
    
4. **El Departamento de Uso de IS (Usuario):** Su interés es la **recuperación de los costos**.
    
5. **El Personal Técnico y el Empresarial:** Deben estar **involucrados** y orientados hacia el mismo objetivo.
    
6. **Proveedores Externos:** Proveen cualquier elemento de los SI, y su principal interés es la **rentabilidad**.

![[Pasted image 20251101181910.png]]

---

### **4. Explique la interacción entre los factores que interviene en las transferencias de costos (Figura 1 del material de estudio I).**

La interacción en la transferencia de costos ilustra cómo la decisión de **proveer y usar servicios de SI** afecta las relaciones y el control financiero dentro y fuera de la organización17.

- **Proveedores Externos** ➡️ **"Departamento" de Provisión de IS:** Los proveedores externos, cuyo interés es la **rentabilidad**18, proporcionan recursos al departamento de provisión. Este departamento gestiona los servicios como un **centro de costos o beneficios**, y realiza compras en forma autónoma19.
    
- **"Departamento" de Provisión de IS** ➡️ **"Departamento" de Compras de IS:** El departamento de provisión transfiere o delega las tareas de adquisición y control de alternativas al departamento de compras.
    
- **"Departamento" de Compras de IS** ➡️ **Departamento de Uso de IS:** El departamento de compras, centrado en las **alternativas de compra**20, facilita la adquisición al departamento de uso.
    
- **Departamento de Uso de IS:** Es el usuario final, cuyo interés primordial es la **recuperación de los costos** de las inversiones realizadas21.
    

Esta estructura muestra una **cadena de suministro interna y externa** donde los **costos** se "transfieren" y se controlan a través de diferentes unidades, cada una con un enfoque (rentabilidad, provisión, compra y recuperación de costos).

---

### **5. ¿Qué cuestiones deben considerarse antes de iniciar el proceso de provisión?**

Antes de iniciar el proceso de provisión (que se enmarca en la primera etapa del proceso de compra: _Estudio de solución y determinación de los criterios_ 23), se deben considerar las siguientes cuestiones:

- **Factibilidad y Necesidades:**
    
    - Efectuar el **estudio de factibilidad** de la solución y definir las **necesidades de tecnología de SI**25.
        
    - **Eliminar sistemas inconvenientes** y concentrar el esfuerzo en soluciones aceptables26.
        
    - **Justificar el sistema** a través del análisis de la cartera de aplicaciones y las estrategias genéricas, indicando las razones económicas (análisis de costos/beneficios)27.
        
    - **Desarrollar el sistema en forma realista**, considerando el potencial real del equipo y la tecnología disponible28.
        
- **Planeación y Comunicación:**
    
    - **Planificar las etapas** del proceso de adquisición y elaborar el **cronograma** respectivo29.
        
    - **Advertir a los proveedores potenciales** (mediante una "Carta de Invitación") para que cuenten con tiempo para preparar ofertas serias30.
        
- **Información Preliminar (Encuesta de Mercado Informal):**
    
    - Obtener copias de **otros RDP** (Requerimiento de Propuestas) de organizaciones similares31.
        
    - Investigar **publicaciones técnicas especializadas** para información detallada y comparativa32.
        
    - Visitar a otros gerentes de Procesamiento de Datos o usar oferentes como **fuente de información**33.
        

---

### **6. ¿Qué significan y qué importancia tienen los parámetros cualitativos y cuantitativos?**

Los parámetros cualitativos y cuantitativos son esenciales para la **calificación objetiva** y la **selección de alternativas** de HW/SW.

| **Parámetro**     | **Significado**                                                                                                                 | **Ejemplos**                                                                                                       | **Importancia**                                                                                                                                                                                              |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Cuantitativos** | **Medidas o proyecciones numéricas** (fórmulas matemáticas) de una capacidad o cantidad.                                        | Tasa de transferencia, Capacidad de almacenamiento, _tps_ (transacciones por segundo).                             | Proporcionan una **apreciación altamente objetiva** sobre una característica del HW/SW.                                                                                                                      |
| **Cualitativos**  | Medidas determinadas por **experiencia, observación, convenciones, restricciones o políticas**; poseen cierta **subjetividad**. | Estética, tecnología de disco, dimensiones de pantalla, variables de consumo de electricidad (frecuencia/voltaje). | Permiten seleccionar el equipo con la **mejor _performance_ aplicada a las capacidades manejadas por la organización**. Deben transformarse en cuantitativos o limitarse al **20% del total de parámetros**. |

---

### **7. Detalle las pautas que guían la selección general del SW y HW.**

Las pautas que guían la selección buscan asegurar que las decisiones sean **empresariales**, **simples** y **flexibles**, en lugar de meramente técnicas o económicas.

1. **Prioridad del SW:** Es el **SW, y no el HW, el que debe guiar casi todas las decisiones de selección**. El flujo de decisión debe ser: Necesidad empresarial → SW de Aplicación → SW de Sistema (base) → HW.
    
2. **Vida Útil:** El **SW tiene mayor vida útil que el HW** sobre el que corre; es mejor mantener el mismo SW con distinto HW.
    
3. **Flexibilidad vs. Adecuación:** La **flexibilidad** es muy importante y recibe **mayor puntaje que la adecuación** (capacidad de adaptarse y crecer continuamente, ya que los requerimientos de información cambian).
    
4. **Arquitectura:** Elegir una **arquitectura** es más importante y duradero que elegir un tipo particular de componente. No se debe migrar de una arquitectura a otra sin una buena razón.
    
5. **Compatibilidad y Ensamblaje:** Es mejor si el componente es **compatible con la arquitectura actual**. Ensamblar HW de distintas marcas solo se justifica si los beneficios superan la complejidad introducida.
    
6. **Desarrollo de SW:** Se recomienda usar **lenguajes de 4° nivel** a menos que haya una buena razón para usar lenguajes de más bajo nivel, para **aumentar la productividad**.
    
7. **Foco Empresarial:** Se debe partir de las **necesidades empresariales** para determinar la necesidad del cambio, no de las posibilidades del HW/SW.
    

---

### **8. ¿Qué ventajas y desventajas considera usted que tienen los denominados sistemas abiertos, actualmente?**

Un **Sistema Abierto** es aquel que utiliza **equipos o componentes no propietarios** y que está diseñado para **interactuar y compartir datos** con sistemas de diferentes fabricantes.

##### 🔑 Conceptos Clave

1. **No Propietario:** Significa que el sistema no está atado a la tecnología exclusiva de un solo fabricante (a diferencia de un _mainframe_ tradicional, que usa hardware y software del mismo vendedor).
    

- **Interoperabilidad:** Su principal ventaja es que **fomenta compartir datos** e incentiva la **integración** de soluciones con componentes de distintos proveedores.
    

- **Tendencia:** Este concepto es clave en el _downsizing_ (migración de plataformas grandes a redes de PC o minicomputadoras), ya que las plataformas más pequeñas suelen ser de equipos no propietarios.
    

##### 💡 Ejemplos

- **Sistemas Operativos (SO):** **Linux** es un ejemplo clásico de un SO abierto, a diferencia de los sistemas propietarios de _mainframes_.
    
- **Protocolos:** El uso de protocolos de red y estándares industriales como **TCP/IP** o **SQL** (para bases de datos) en lugar de protocolos específicos de un solo proveedor.
    
- **Hardware:** Usar **servidores estándar basados en arquitectura x86** (no propietarios) en lugar de depender de un servidor de diseño cerrado y especializado.

| **Ventajas (Conclusión)**                                                                                                                                                           | **Desventajas (Conclusión)**                                                                                                                                                                          |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Fomenta la integración:** Los desarrollos de _downsizing_ (migración a plataformas más pequeñas) se adecuan mejor al equipo no propietario, lo que **incentiva compartir datos**. | **Dependencia de la compatibilidad:** Conectar componentes de **distintos fabricantes puede ser difícil** a menos que se hayan diseñado específicamente para la interconexión.                        |
| **Mayor innovación y variedad:** Promueve que las soluciones se construyan con **componentes de diferentes proveedores** (aumenta la variedad de opciones).                         | **Mayor complejidad técnica:** El ensamblaje de HW de distintas marcas puede ser **técnicamente posible, pero introduce complejidad**.                                                                |
| **Evita el _Vendor Lock-in_**: La adopción de estándares abiertos **reduce la dependencia** de un solo proveedor o plataforma monolítica (como un _mainframe_).                     | **Incertidumbre en la confiabilidad:** Aunque ha mejorado, los sistemas basados en PC (más abiertos) **aún no superan a los _mainframes_ en términos de confiabilidad** para la disposición de datos. |


---

## ⚙️ Subsistema de Provisión de SW y HW (Preguntas 9 - 16)

#### 💾 La Diferencia entre Obtener Software y Hardware

##### La Gran Diferencia: Flexibilidad

| **Recurso**              | **¿Cómo se obtiene?**                                                      | **Flexibilidad**                                                      |
| ------------------------ | -------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| **Software (Programas)** | Tienes un **"continuo de posibilidades"**: puedes **hacerlo o comprarlo**. | **Alta**. Puedes construir un programa desde cero si lo necesitas.    |
| **Hardware (Equipos)**   | **Siempre lo compras** a un proveedor externo.                             | **Baja**. No puedes construir un servidor o una computadora tú mismo. |

##### a. ¿Cuándo debemos hacer el Software INTERNAMENTE? (Desarrollo Propio)

Hacer el software internamente se vuelve necesario cuando el programa te dará una **ventaja estratégica** sobre la competencia. Es decir, cuando ese software es tu "secreto para ganar".

| **Factor Estratégico**            | **¿Qué significa?**                                                                                                                                   |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Ventaja Competitiva Única**     | El programa que necesitas es tan **especial** que si lo usas, serás mejor que tus rivales. Si lo compras ya hecho, tu rival también podría comprarlo. |
| **No hay Paquetes en el Mercado** | La solución que buscas es muy **novedosa o específica** para tu negocio, y simplemente no existe una aplicación estándar que la satisfaga.            |
| **Mantener el Conocimiento**      | Quieres que el **conocimiento técnico** de cómo funciona ese sistema se quede en tu empresa y no se vaya a un proveedor externo.                      |

##### b. ¿Cuándo debemos COMPRAR el Software (Paquetes Estándar)?

Comprar un paquete estándar es la mejor opción cuando la aplicación **no es tu "secreto para ganar"** y quieres ahorrar tiempo.

| **Situación Ideal**                | **Ejemplo**                                                                                                                                                                                  |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Empresas Pequeñas e Integradas** | Una pequeña empresa que necesita un sistema contable que funcione bien con el sistema de ventas, sin tener que gastar en modificaciones.                                                     |
| **Aplicaciones No Fundamentales**  | Usar software genérico que cualquier empresa necesita (ej. un programa de correo electrónico o una hoja de cálculo).                                                                         |
| **Sistemas Complejos sin Ventaja** | Si necesitas un sistema muy complejo (como un sistema de nóminas o contabilidad general), pero **no te da una ventaja** competir por eso. Es mejor dejarle la especialización al fabricante. |

##### c. Ventajas y Desventajas de Comprar un Paquete Estándar

| **Ventajas (Lo Bueno de Comprar)**                                          | **Desventajas (Lo Malo de Comprar)**                                                                                                  |
| --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| **Disponibilidad Rápida:** Puedes empezar a usarlo enseguida.               | **Pérdida de Conocimiento:** El **"saber cómo"** para desarrollarlo se queda con el fabricante.                                       |
| **Calidad Conocida:** Sabes cómo funciona porque otras empresas ya lo usan. | **Desajuste de Necesidades:** El paquete **nunca encajará 100%** con tu negocio, tendrás que adaptarte a él o pagar para modificarlo. |
|**Menores Costos Iniciales:** Generalmente es más barato que pagar a un equipo para que lo construya desde cero.|**Costo de Licencia Alto:** Aunque el costo inicial sea bajo, las licencias y los costos de mantenimiento a largo plazo pueden ser muy altos.|

---

### **10. ¿Cuáles son las soluciones al desajuste entre las capacidades de un paquete y las necesidades organizacionales?**

Esto ocurre siempre que una empresa decide **comprar un software ya hecho** (un paquete estándar) en lugar de construirlo desde cero. Casi nunca encaja perfectamente con lo que la empresa necesita.

El "Plano de Discrepancias" simplemente significa la **lista de diferencias** entre lo que el programa hace y lo que la empresa quiere que haga.

Aquí están las cuatro maneras de solucionar ese problema, explicadas de forma sencilla:
#### 🛠️ Soluciones al Desajuste de Software (Cuando el Programa No Encaja)

Cuando un paquete de software estándar no satisface todas tus necesidades, tienes estas cuatro opciones:

##### 1. Adecuar el Paquete (Opción Peligrosa)

- **¿Qué haces?** Le pides a un programador que **modifique el código interno** del programa comprado para que haga exactamente lo que tú quieres.
    
- **Problema:** Esto es como desarmar un electrodoméstico y cambiarle las piezas. Es riesgoso porque **pierdes la garantía** del fabricante (la licencia) y si hay un error, la responsabilidad es totalmente tuya.
    

##### 2. Modificar el Proceso Empresarial (Opción Común)

- **¿Qué haces?** En lugar de cambiar el software, **cambias la forma en que trabajan las personas** en tu empresa.
    
- **Ejemplo:** Si el software estándar gestiona las facturas de una manera específica, tu equipo de contabilidad tendrá que empezar a trabajar de esa manera. Te **adaptas a las reglas** del programa.
    

##### 3. Tolerar el Desajuste (Opción de Bajo Impacto)

- **¿Qué haces?** Aceptas que el programa no hace una cosa pequeña que querías, pero **no es lo suficientemente grave** como para justificar un cambio o una inversión.
    
- **Ejemplo:** El software hace los informes de ventas en un orden que no te encanta, pero son funcionales. Simplemente lo **aceptas y sigues adelante**.
    

##### 4. Complementar el Paquete (Opción Mixta)

- **¿Qué haces?** Dejas el paquete estándar como está, pero **desarrollas pequeños programas a medida (módulos)** que se conectan al paquete para cubrir las funciones que faltan.
    
- **Ejemplo:** Compras un paquete de contabilidad, pero desarrollas internamente una pequeña aplicación para el control de inventario que luego "alimenta" la información al paquete principal.
    

**En resumen:** Las opciones van desde modificar el software (opción arriesgada) hasta modificar la empresa (opción común), o construir puentes con software adicional.
    ![[desajuste entre necesidades y paquetes.png]]

---

### **11. Relacione las políticas a aplicar por las áreas organizacionales en la selección de los paquetes con el análisis efectuado para responder la consigna 2 del presente cuestionario.**

Las **políticas de selección de paquetes** son el mecanismo que permite a la organización, según su **esquema de ubicación de SI/TI** (pregunta 2), controlar el grado de libertad del usuario y asegurar la coherencia o integración.

Existen cuatro enfoques diferentes (políticas) para definir el grado de libertad que pueden tener las áreas empresariales al seleccionar los paquetes:

1. **Libertad total:** este enfoque permite que todas las áreas empresariales elijan su paquete preferido y puede provocar el caos, donde nadie sabe qué comprar, cuáles son los costos de instalación, capacitación y soporte, ni tampoco los costos futuros, posiblemente enormes, que surgen de las oportunidades perdidas de integración. Sin embargo, cada área puede optar por un paquete que se adecue bien a sus requerimientos sin compromiso.
    
2. **Intercambio de datos:** este enfoque permite que los sectores individuales adquieran el paquete que desean siempre que soporte el intercambio de datos con otros paquetes y sistemas, según sea necesario. Consiste en comprar un paquete integrado o bien un juego de paquetes, en lugar de seleccionar paquete por paquete, por ejemplo, Microsoft 365. 
    
3. **Lista:** en este enfoque, algún área de la empresa dedicada a la definición de normas confecciona una lista breve de los paquetes aceptables; los sectores individuales sólo pueden optar sobre la base de esa lista.
    
4.  **Normas fijas:** El área dedicada a la definición de normas establece el paquete permitido, y de ese modo los sectores individuales pueden optar por “cualquier color que deseen, siempre que sea negro”.
    

**Los dos primeros enfoques se refieren a un área de sistemas descentralizada, mientras que los últimos a áreas de sistemas centralizadas.**

En resumen, los esquemas descentralizados tienden a utilizar políticas con mayor libertad para que las áreas locales respondan a sus necesidades (_efectividad_), mientras que los esquemas centralizados aplican políticas más rígidas para asegurar la coherencia corporativa (_eficiencia_).

---

### **12. Resuma el procedimiento para evaluar paquetes estándar.**

El procedimiento de evaluación de paquetes estándar implica dos etapas principales: una **evaluación inicial** basada en criterios de usuario y una posible **evaluación técnica** más profunda (como el Método de Evaluación Manual - MEM).

1. **Establecimiento y Ponderación de Criterios (Evaluación Inicial):**
    
    - Definir un conjunto de **criterios de selección** que reflejen las necesidades del usuario (ej. Funcionalidad, Capacidad, Flexibilidad, Uso, Confiabilidad, Seguridad).
        
    - **Ponderar** los criterios según la importancia relativa a las necesidades de la empresa (asignar **pesos**).
        
    - **Calificar** a cada paquete propuesto en cada criterio y calcular el **puntaje total ponderado** (ej. tabla de la fuente 18).
        
    - Descartar los paquetes que no alcancen un **nivel de corte** preestablecido.
        
2. **Evaluación Técnica Avanzada (Si es necesario):**
    
    - Si varios paquetes tienen puntajes similares, se aplica el **Método de Evaluación Manual (MEM)** para una evaluación técnica más rigurosa.
        
    - El MEM incluye:
	    1. **Lista de requerimientos:** Es el documento que detalla y formaliza todo lo que el sistema debe tener y hacer. Define las necesidades técnicas y funcionales que los proveedores deben cumplir.
	    
	    2. **Tabla de ponderación:** Asigna un peso o valor de importancia a cada requerimiento de la lista. Permite priorizar lo que es más crítico o valioso para la organización.
	    
	    3. **Cuestionario:** Es el formulario que se envía a los proveedores. Contiene la lista de requerimientos para que ellos respondan de manera estructurada cómo su producto cumple con cada punto.
	    
	    4. **Planilla comparativa:** Organiza las respuestas de todos los proveedores en una única tabla, una al lado de la otra. Su principal utilidad es comparar las ofertas y descartar rápidamente las que no cumplen con los requisitos fundamentales.
	    
	    5. **Planilla de evaluación:** Es la "hoja de calificación" donde se puntúa objetivamente cada característica de cada oferta. Se aplica un puntaje a la respuesta del proveedor y se multiplica por el peso (ponderación) para obtener un resultado numérico.
	    
	    6. **Planilla de resultados:** Resume los puntajes totales de cada oferta. Suma los resultados de las planillas de evaluación para obtener una calificación final por proveedor, determinando cuál es la oferta técnicamente más viable.
	    
	    7. **Informe final:** Es el documento final que presenta la recomendación técnica. Ordena las ofertas de mejor a peor según su puntaje (Orden de Mérito) y sirve de base para las siguientes etapas del proceso de compra, como la evaluación económica.
            

---

### **13. Describa las fuentes de provisión de HW. ¿Qué criterios deben tenerse en cuenta al momento para determinar la fuente?**

#### **Fuentes de Provisión de Hardware (Canales de Adquisición)**

Las fuentes de provisión de HW varían **según el tamaño** de la plataforma:

- **Mainframe:** Fabricante o Terceros especializados.
    
- **Minicomputadora:** Fabricante o Revendedores de valor agregado (**VARs**).
    
- **Microcomputadoras:** Equipos de ventas "tradicionales" del fabricante, VARs, Comercios minoristas, Supermercados de computadoras, Compra por correo, y Ensamblaje de componentes realizado en la empresa.
    
También se puede adquirir HW de cualquier tipo en el **mercado de segunda mano**.

#### **Criterios para Determinar la Fuente**

Con la pequeña excepción del ensamblaje de las microcomputadoras, todo el hardware se adquiere en forma externa; el *tamaño* de la plataforma define principalmente el alcance y la índole de los canales de adquisición disponibles. En la figura siguiente se describen someramente las diferentes fuentes de adquisición de HW:

| Plataforma            | Canales de Adquisición                                                                                                                                                                                                            | Notas                                                                                    |
| :-------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------- |
| **Mainframe**         | - Fabricante<br>- Terceros especializados                                                                                                                                                                                         |                                                                                          |
| **Minicomputadora**   | - Fabricante<br>- Revendedores de valor agregado (VARs)                                                                                                                                                                           |                                                                                          |
| **Microcomputadoras** | - Equipos de ventas "tradicionales" del fabricante<br>- Revendedores de valor agregado<br>- Comercios minoristas<br>- Supermercados de computadoras<br>- Compra por correo<br>- Ensamblaje de componentes realizado en la empresa | No obstante, se puede adquirir hardware de cualquier tipo en el mercado de segunda mano. |


> [!hint] Las siguientes son las fuentes para este esquema de provisión (adquisición).

#### Fuentes de provisión de hardware

-   **Consignatarios de fabricantes:** si el cliente es muy importante, es posible que se presente la opción de comprar directamente al fabricante. El equipo de ventas, gracias a sus conocimientos técnicos, diseña a medida soluciones muy específicas además de ofrecer un mantenimiento intensivo y la seguridad de contar con piezas de repuesto. La desventaja es que suelen tener un gasto mayor y una orientación más restringida la falta de soporte de integración con otros vendedores.

-   **Revendedores de valor agregado (VARs):** generalmente están preparados para vender y apoyar una amplia gama de productos. Los VARs agregan un margen al costo básico del software para cubrir su provisión de “servicios” (por ejemplo: instalación y mantenimiento).

-   **Comercios minoristas:** dado que las microcomputadoras ya son un artículo de uso cotidiano, se venden de la misma forma que otros bienes de consumo. Si bien los comercios minoristas brindan asesoramiento muy limitado, normalmente ofrecen poca variedad, y siempre dentro de la línea de uso generalizado.

-   **Supermercados de computadoras:** como ocurre con los comercios minoristas, no suelen estar orientados a las grandes empresas, pero buscan ofrecer el rango de opciones del canal directo junto con un servicio personal, además de permitir ver los productos antes de comprar. Sólo las empresas más grandes excluyen las compras mediante este canal.

-   **Compra por correo:** tiene como competidores a los supermercados de computadoras y a los comercios minoristas. Las agencias y los VARs de los fabricantes ofrecen un tipo de servicio tan diferente que pueden considerarse como canales complementarios.

-   **Ensamble de componentes por parte del personal:** algunas compañías compran componentes tales como motherboards, monitores, disqueteras, etc., que luego ensambla el personal de la empresa. La brusca reducción en los precios de hardware hace que este canal de adquisición no sea muy usado, excepto cuando se requieren configuraciones muy específicas o especiales.  

---

### **14. ¿Qué es el downsizing? Detalle sus ventajas y desventajas. ¿Cuáles son los costos implícitos de downsizing?**

El **Downsizing** es la **migración** de un sistema o un conjunto de sistemas desde una plataforma grande (mainframe o minicomputadora) a una **red de PC o microcomputadoras**. Implica un alto grado de **distribución y procesamiento en red**34.

#### **Ventajas y Desventajas**

|**Ventajas [cite: 2726]**|**Desventajas [cite: 2726]**|
|---|---|
|Mayor **control y autonomía** del usuario|**Control central más débil**|
|Mayor **flexibilidad**|**Costos ocultos** (a menudo subestimados)|
|Menores **costos** y mayor **capacidad de respuesta**|Mayor **demanda de idoneidad** del usuario|
|Incentivo de la **innovación** y los **sistemas abiertos**|**Desintegración de la base de datos**|
|Desarrollo más **rápido** de los sistemas|Mayor **inversión de capital inicial**|

#### **Costos Implícitos de Downsizing**

A pesar del potencial ahorro de costos, existen costos que a menudo se **subestiman o son ocultos**:

1. **Costo Operativo Real:** Los costos operativos reales de la nueva infraestructura distribuida.
    
2. **Costo de Migración:** Los costos asociados al proceso de transferencia y al _know-how_ (ej. el entrenamiento necesario para el personal).
    

Aun así, se determinó que, a pesar de estos costos, el _downsizing_ puede ofrecer un **rendimiento que supera de dos a cinco veces la inversión total**.

---

### **15. Repase los criterios para determinar la alternativa más adecuada en el rightsizing.**

El **Rightsizing** es el proceso de **elegir la arquitectura de SI más adecuada** para la organización. Los criterios a considerar son:

- **Costo-Beneficio:** Considerar **todos los aspectos financieros**, incluyendo los **costos ocultos**, para establecer si los costos serán realmente menores.
    
- **Adecuación Estructural:** Considerar el grado de **adecuación entre la estructura empresarial** y la **estructura de procesamiento** (centralizada vs. distribuida).
    
- **Seguridad y Confiabilidad:** Determinar la **importancia de la seguridad** (si es vital, el procesamiento distribuido puede ser costoso) y la necesidad de **certidumbre de la disposición de datos** (los _mainframes_ son más confiables).
    
- **Volumen de Datos:** Evaluar el **volumen de datos a procesar y almacenar** (los _mainframes_ se adecuan mejor a procesamientos de gran escala).
    
- **Sistemas Abiertos:** Establecer la importancia de las iniciativas de los **sistemas abiertos** (el _downsizing_ se adecua mejor y fomenta compartir datos).
    
- **Actitud ante el Riesgo:** Evaluar la **actitud "pionera"** de la empresa, ya que el _downsizing_ implica un uso **nuevo y arriesgado** de plataformas (no se adecua a empresas que escapan al riesgo).
    
- **Estabilidad del Procesamiento:** Evaluar la necesidad de **estabilidad** del procesamiento, ya que cuando es crítica, el ritmo de implementación de las migraciones debe ser cuidadoso.
    

---

### **16. ¿En qué consiste la provisión externa de servicios de SI? ¿Cuáles son las fuentes de este esquema de provisión? ¿Cuál es el principio general de outsourcing?**

La provisión externa de servicios de SI (Outsourcing) consiste en **transferir a terceros la responsabilidad de proporcionar un servicio adaptado** a las necesidades de una organización.

### Fuentes del esquema de provisión de Outsourcing (tercerización)
#### **1. Proveedor de Tiempo Compartido**

**La idea central es "alquilar" poder de cómputo en bruto o una capacidad específica, pagando solo por lo que usás, cuando lo usás.** No cedes un proceso de negocio, solo alquilas la infraestructura para ejecutarlo tú mismo.

**Ejemplo Práctico: Renderizado de una película de animación.**

Imagina que un pequeño estudio de animación crea una película como las de Pixar. Diseñar y modelar los personajes en sus computadoras de escritorio es factible. Sin embargo, el proceso final de **renderizado** (generar las imágenes finales a partir de los modelos 3D) requiere una cantidad masiva de poder de procesamiento que tomaría años en sus computadoras normales.

*   **El Problema:** Comprar un supercomputador (una "granja de renderizado") para usarlo intensamente solo durante los últimos meses de producción es extremadamente caro e ineficiente.
*   **La Solución (Outsourcing):** El estudio contrata los servicios de una "granja de renderizado en la nube" como AWS Thinkbox, Google Cloud Zync Render o Microsoft Azure Batch.
    *   Suben sus modelos 3D a la plataforma.
    *   Alquilan miles de procesadores por hora para realizar los cálculos.
    *   Pagan únicamente por el **tiempo de procesamiento utilizado**.
    *   Una vez que la película está renderizada, dejan de usar el servicio.

Esto encaja perfectamente con la definición: "Provee acceso en línea a una capacidad de procesamiento externa que se cobra según el tiempo utilizado" y se usa para "optimizar la capacidad a corto plazo".

#### **2. Agencia de Servicios**

**La idea central es "tercerizar" un proceso de negocio completo y bien definido.** La empresa se desentiende de *cómo* se hace la tarea; solo le interesa el resultado final.

**Ejemplo Práctico: Liquidación de Sueldos.**

Imagina una empresa mediana de 150 empleados. Cada mes, su departamento de Recursos Humanos debe calcular los sueldos, las horas extras, las deducciones de impuestos, los aportes jubilatorios, etc. Es una tarea compleja, repetitiva y que requiere conocimiento especializado en leyes laborales y fiscales.

*   **El Problema:** Mantener un especialista en nómina, junto con el software y las actualizaciones constantes, es costoso y desvía el foco del negocio principal de la empresa.
*   **La Solución (Outsourcing):** La empresa contrata a una **agencia de servicios** especializada en liquidación de haberes, como ADP o Paychex.
    *   Cada fin de mes, la empresa envía a la agencia un archivo con las novedades: horas trabajadas, ausencias, comisiones, etc.
    *   La agencia se encarga de todo el proceso: calcula los sueldos, genera los recibos, realiza las transferencias bancarias y presenta las declaraciones juradas a los organismos fiscales.
    *   La empresa simplemente paga una tarifa mensual por el servicio.

Esto es exactamente lo que dice la definición: "Se cede una tarea completa a una empresa", como la "liquidación de haberes". La empresa no gestiona el software ni los servidores de la agencia, solo le entrega los datos y espera el resultado correcto.

#### **3. Management Completo de Servicios**

**La idea central es "entregar las llaves" de toda o una gran parte del departamento de TI a un tercero.** El proveedor no solo ejecuta las tareas, sino que también gestiona, planifica y es estratégicamente responsable de toda el área de TI.

**Ejemplo Práctico: Gestión de TI de una cadena de hospitales.**

Una red de 10 hospitales tiene un complejo sistema de TI: servidores en cada hospital, redes que los conectan, software de gestión de pacientes, sistemas de facturación, etc.

*   **El Problema:** La gestión de esta infraestructura es crítica y compleja, pero no es el negocio principal del hospital (que es atender pacientes). Mantener un equipo de TI grande, especializado y actualizado 24/7 es un desafío enorme.
*   **La Solución (Outsourcing):** La red de hospitales firma un contrato de 5 años con una gran consultora tecnológica (como IBM, Accenture o una gran firma local) para que se haga cargo del **management completo** de sus servicios de TI.
    *   La consultora asume la **operación y gestión de todos los servidores**, aunque estos sigan físicamente en los sótanos de los hospitales (como dice la definición, "los elementos de los SI pueden permanecer dentro de las oficinas del cliente").
    *   El equipo de TI del hospital (los técnicos de redes, los administradores de sistemas) puede ser transferido y pasar a ser empleado de la consultora.
    *   La consultora se vuelve responsable de todo: desde el soporte técnico a un médico que no puede imprimir, hasta la planificación estratégica para renovar los servidores en los próximos años.

Esto cumple perfectamente la definición: "La cesión es completa a UNO. El management y la operación de dichos elementos es responsabilidad del tercero contratado". El hospital ya no gestiona TI, sino que gestiona un contrato con la empresa que gestiona su TI.

#### **Tabla Resumen**

| Tipo de Outsourcing                  | Concepto Clave                                                   | Ejemplo Resumido                                                                               |
| :----------------------------------- | :--------------------------------------------------------------- | :--------------------------------------------------------------------------------------------- |
| **Proveedor de Tiempo Compartido**   | Alquilar una herramienta específica (poder de cómputo).          | Un estudio de cine alquila un supercomputador en la nube para renderizar una película.         |
| **Agencia de Servicios**             | Contratar a un especialista para una tarea completa.             | Una empresa contrata a otra firma para que le liquide los sueldos a sus empleados.             |
| **Management Completo de Servicios** | Entregar las llaves de todo el taller de TI a un gestor externo. | Un grupo de hospitales contrata a IBM para que se haga cargo de toda su operación informática. |

### ¿Qué Tareas NO debes Externalizar? (Tus Actividades Esenciales)

#### El Principio General del Outsourcing: ¡Retén el control!

El principio dice que debes externalizar (dar a terceros) las tareas de **apoyo**, pero **nunca** las tareas que definen tu negocio.

##### ¿Qué Tareas NO debes Externalizar? (Tus Actividades Esenciales)

Debes mantener el control de todo aquello que:

1.  **Es tu "Salsa Secreta":** La actividad principal por la que tus clientes te eligen y te pagan (ej. hacer tu producto o dar tu servicio único).
2.  **Define tu Futuro:** Las áreas de **innovación, estrategia e investigación** que te permitirán crecer y mejorar mañana.
3.  **Es tu Experiencia Acumulada:** El *saber hacer* que has perfeccionado a lo largo de los años y que es difícil de replicar.

> **En resumen:** Externaliza la limpieza y la contabilidad, pero **nunca externalices el cerebro y el corazón** de tu empresa.

Un principio general del outsourcing es **retener el control** de las actividades esenciales, que pueden ser:

- Actividades que se llevan a cabo de forma interna, con precedente de larga data.
    
- Actividades fundamentales para el rendimiento empresarial.
    
- Actividades que crean un flujo de potencial.
    
- Actividades que conducen a crecimiento futuro e innovación o actualización de la organización.

### **17. ¿Qué factores o criterios deben tenerse en cuenta para el _outsourcing_?**

Al evaluar la provisión externa de servicios de SI, se deben considerar los siguientes factores, ya que las distintas rutas de adquisición requieren diferentes aptitudes de _management_ 1:

- **Capacidad del _Management_**: Los estilos, la cultura y la idoneidad del _management_ de la empresa forman la base para determinar la adecuación de cualquier ruta de tercerización 2.
    
- **Capacidad del Personal**: La escasez de aptitudes internas (técnicas, de visión comercial, de _management_ de proyectos o de negociación de contratos) puede limitar las alternativas, al igual que el grado de compromiso del personal3.
    
- **Posición a Largo Plazo**: Deben considerarse las posibles consecuencias a largo plazo de la transferencia del _management_, personal y recursos, ya que la especialización externa favorece a la empresa contratada4.
    
- **Costos Convenientes**: Compartir los costos para beneficio mutuo puede compensar el conflicto de intereses inherente a la relación cliente/proveedor5.
    
- **Generalidades de los Requerimientos**: El grado de generalidad de los requerimientos debe afectar la decisión sobre qué tercerizar6.
    

---

### **18. ¿Cómo puede considerar una organización enfocar a un proveedor de servicios de SI?**

Una organización puede enfocar a un proveedor de servicios de SI de dos maneras principales, lo que influye en la gestión de la relación 7:

|**Enfoque**|**Foco**|**Plazo**|**Concepto**|**Management/Gestión**|
|---|---|---|---|---|
|**Como Proveedor**|Control a través del contrato|Corto|**Contratar afuera**|Se gestiona mediante cláusulas punitorias y cumplimiento obligatorio de términos contractuales8.|
|**Como Socio**|Resultados a través de la asociación|Largo|**Alianza estratégica**|Se gestiona con comunicación informal y flexibilidad en la negociación9.|


###### Dos Enfoques para Trabajar con un Proveedor de Servicios de SI

###### 1. Enfoque "Como Proveedor" 📄

Este es un enfoque **frío y legalista**. El proveedor es visto simplemente como una herramienta contratada.

- **Foco:** **Control** estricto a través de un **contrato** muy detallado.
    
- **Plazo:** **Corto**. La relación puede romperse fácilmente si no se cumplen los términos.
    
- **Gestión:** Se basa en la **obligación** y las **cláusulas punitorias** (multas o castigos) si el proveedor no cumple con el servicio exactamente como se especificó en el papel.
    

> **Analogía:** Es como contratar a un **taxista** para un solo viaje. Solo te interesa el servicio acordado de punto A a punto B, y si no cumple, buscas otro inmediatamente.

###### 2. Enfoque "Como Socio" (Alianza Estratégica) 🎯

Este es un enfoque **cálido y colaborativo**. El proveedor es visto como una extensión importante del propio equipo de la empresa.

- **Foco:** Obtener mejores **resultados** a través de la **colaboración mutua**.
    
- **Plazo:** **Largo**. Se busca una relación duradera donde ambos invierten.
    
- **Gestión:** Se basa en la **confianza**, la **comunicación informal** y la **flexibilidad**. Si surge un problema no cubierto en el contrato, se negocia de forma flexible para el beneficio mutuo. Ambos buscan el éxito del otro.
    

> **Analogía:** Es como trabajar con un **co-fundador** o un **inversor estratégico**. Comparten el objetivo a largo plazo y se adaptan juntos a los problemas que aparecen en el camino.


>[!NOTE] El **Enfoque como Socio** es ideal para servicios esenciales y complejos (como el desarrollo de nuevos sistemas), mientras que el **Enfoque como Proveedor** es mejor para servicios sencillos, estandarizados y fáciles de medir (como el soporte técnico básico).


---

### **19. Realice una síntesis del punto 4.3 Recursos humanos y _outsourcing_.**

#### **Síntesis: Recursos Humanos y Outsourcing**

El texto analiza el complejo impacto humano que tiene la tercerización (outsourcing) de los Sistemas de Información (SI), centrándose en los desafíos y las consecuencias para el personal que es transferido del cliente al proveedor.

Los puntos clave son:

1.  **El Miedo y la Resistencia son el Principal Problema:** El outsourcing genera un gran **temor y descontento** entre los empleados de SI. La causa principal es el sentimiento de ser "reemplazable", ya que la meta de ahorrar costos a menudo implica reducir personal. La transferencia al nuevo proveedor suele ser **obligatoria**, lo que genera una fuerte resistencia inicial.

2.  **La Promesa de Estabilidad es Frágil:** Aunque los primeros contratos de outsourcing buscaban retener al personal por su conocimiento (know-how), esta estabilidad no siempre está garantizada. El texto señala que hubo casos donde, pasada la transferencia, el nuevo proveedor **despidió al personal**, reavivando los temores.

3.  **Existe una Oportunidad de Crecimiento Profesional:** A pesar de los miedos, el outsourcing puede ofrecer una **carrera más prometedora** para el personal técnico. La razón es que para un proveedor de servicios de TI, el área de SI es el **negocio principal y un activo importante**, no un "gasto necesario" como suele ser visto dentro de una empresa de otro rubro. Esto puede traducirse en mayor variedad de trabajo y mejores posibilidades de progreso.

4.  **El Costo Oculto es la Pérdida Cultural y de Pertenencia:** La consecuencia final y más sutil es que el outsourcing **reduce la comunicación informal** y ubica al personal **"fuera" de la empresa** cliente. Esto provoca una pérdida del sentido de pertenencia y **disminuye la motivación del empleado por el éxito y la prosperidad de su antigua compañía**, convirtiéndose en un costo oculto del proceso.

#### Una explicación de Gemini...
##### Recursos Humanos y Outsourcing: La Cara Humana de la Externalización

El _outsourcing_ impacta significativamente al personal, ya que **el ahorro de costos que busca a menudo implica reducir la planta**.

La síntesis se centra en que, si bien el objetivo del _outsourcing_ es ahorrar dinero **reduciendo la plantilla**, tiene efectos complejos en el personal.

###### Impactos Negativos (Riesgos)

1. **Miedo e Incertidumbre:** El _outsourcing_ genera **gran temor** entre los empleados. Su principal preocupación es **perder su trabajo** o ser obligados a transferirse a la empresa externa (el proveedor).
    
2. **Pérdida de Conexión:** Cuando el personal se transfiere, puede perder su **vínculo** con la cultura de la empresa original, lo que reduce la **motivación** y la comunicación informal. Esto se considera un **costo oculto** del _outsourcing_.
    
3. **Riesgo de Despido:** Existe el riesgo de que el proveedor, una vez que obtenga el control, se deshaga del personal original para reducir aún más los costos.
    

###### El Contrapeso (El Poder del Conocimiento)

- **El Valor del _Know-how_:** La empresa proveedora a menudo se ve **obligada a retener** al personal original. ¿Por qué? Porque estos empleados son los únicos que tienen el **conocimiento técnico y el _know-how_** específico del sistema de la empresa original. Sin ellos, el proveedor no puede hacer bien el trabajo.
    

###### Impactos Positivos (Oportunidades)

- **Mejoras en la Carrera:** Para el personal de Sistemas de Información (SI) transferido, un proveedor externo puede ofrecer una **carrera más interesante**.
    
- **Mayor Desarrollo:** Las empresas proveedoras son especialistas en SI. Esto significa que pueden ofrecer **más variedad de proyectos** y una orientación más enfocada al negocio y a la tecnología, lo que ayuda al **desarrollo profesional** del empleado.
    

> **En Resumen:** El _outsourcing_ es un arma de doble filo: amenaza con reducir el personal y desmotivarlo, pero el **conocimiento técnico** de los empleados internos es tan valioso que a menudo es su mejor defensa y una llave para mejores oportunidades en su carrera.

---

### **20. Síntesis de "Tercerización en TI por Expertos" (D'Alessio, Barral y Huber)**

**Nota:** Dado que el contenido del libro no fue provisto en el material de estudio, esta pregunta no puede ser resuelta. Si el material se encontrara disponible, se completaría con la síntesis del capítulo 1 y las etapas del capítulo 2.

---

### **21. ¿Qué es y cuál es la importancia del RDP? Efectúe una síntesis de cada parte del RDP.**

- **RDP (Requerimiento de Propuestas):** Es un **documento formal** utilizado para solicitar **ofertas competitivas** para adquisiciones especiales de sistemas de información15.
    
- **Importancia:** Es **fundamental** porque el RDP es el **fundamento y parte integrante de cualquier contrato de compra resultante** 16, asegurando que la respuesta del oferente sea completa, comprometida y viable, y reduciendo costos por imprevistos 17.
    

#### **Síntesis de las Partes del RDP**

| **Sección**                                  | **Foco Principal**                                                                                                                                            |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1. Resumen Ejecutivo                         | Panorama general del contenido del RDP y los requerimientos; es la **última sección en redactarse**.                                                          |
| 2. Propósito                                 | Estructura básica del RDP, objetivos de la adquisición y límites del documento.                                                                               |
| 3. Introducción y Requerimientos Generales   | Descripción del negocio, funciones a soportar y **requerimientos mayores** del sistema propuesto (HW-SW-Servicio).                                            |
| 4. Organizaciones Incluidas                  | Identificación de los departamentos que usarán el sistema y su interrelación.                                                                                 |
| 5. Descripción de la Aplicación              | Descripción del flujo general de información, detalle de subsistemas y plan de **transición** desde el sistema antiguo.                                       |
| 6. Requerimientos de Información             | Detalle de los elementos de información (archivos, BD) y operaciones de **entrada/salida** del sistema.                                                       |
| 7. Restricciones del Diseño del Sistema      | **Cuantificación** de las expectativas de _management_ (crecimiento, flexibilidad y _performance_), distinguiendo entre capacidades obligatorias y deseables. |
| 8. Régimen de Trabajo                        | Alcance y límites de las **responsabilidades del oferente** más allá del sistema básico (plan de proyecto, diseño lógico/físico, entrenamiento).              |
| 9. Información Requerida del Oferente        | Especifica el **formato y contenido de la respuesta** del oferente (descripciones, planes financieros y la tabla de evaluación).                              |
| 10. Criterios de Selección                   | Enuncia el objetivo de la selección e identifica los **métodos de evaluación** a usarse (técnica y financiera) y sus pesos relativos.                         |
| 11. Información Administrativa y Contractual | Establece las implicaciones legales y contractuales.                                                                                                          |
| 12. Apéndice                                 | Especificación del contenido y formato del **resumen de costo(s)** para cada alternativa financiera.                                                          |

---

### **22. Compare el proceso de provisión de RRHH con el de SW y HW.**

|**Aspecto de la Provisión**|**RRHH (Recursos Humanos)**|**SW y HW (Sistemas de Información/Tecnología)**|
|---|---|---|
|**Objeto/Insumo**|Personas (candidatos)30.|Soluciones tecnológicas, HW, SW 31.|
|**Procesos Clave**|**Reclutamiento** (atraer) y **Selección** (escoger/filtrar)32323232.|**Investigación de alternativas**, **Calificación** (parámetros), y **Selección** (del canal/paquete/fuente) 33333333.|
|**Base de la Comparación**|**Ficha Profesiográfica** (requisitos del cargo) vs. **Características del Candidato** 34343434.|**Características y Requerimientos** (obligatorios, deseables, convenientes) vs. **Capacidades del Producto** (parámetros cualitativos/cuantitativos) 35.|
|**Rol del _Management_**|El **Jefe de Línea (Solicitante)** tiene la **decisión final** de aceptar o rechazar al candidato 36.|La **Gerencia Superior** debe tener un rol activo y el proceso involucra una **red de grupos** (Provisión, Compras, Uso) 37373737.|
|**Diferencia Fundamental**|En RRHH, el subsistema de provisión se enfoca en **personas vivas y dinámicas** con potencial de desarrollo38.|En SI/TI, el subsistema se enfoca en **recursos tecnológicos**; la provisión de **SW tiene un continuo de posibilidades** (interno/externo), mientras que el HW es principalmente externo 39.|

Aunque ambos son procesos de "provisión" (obtención de recursos), se gestionan de forma distinta.

##### 🆚 Comparación: Obtener Personal vs. Obtener Tecnología

### 1. El Objeto de la Búsqueda (Insumo)

- **Recursos Humanos (RRHH):** El insumo que buscas son **personas** (candidatos). Son activos **vivos, dinámicos** y con potencial de crecimiento.
    
- **Software y Hardware (SW/HW):** El insumo son **recursos tecnológicos** (máquinas, programas, licencias). Son objetos inanimados o soluciones con capacidades fijas o definidas.
    

### 2. Los Pasos Clave del Proceso

|**RRHH (Obtención de Personas)**|**SW y HW (Obtención de Tecnología)**|
|---|---|
|**Reclutamiento:** Atraer a muchos candidatos.|**Investigación de Alternativas:** Explorar qué opciones hay en el mercado.|
|**Selección:** Escoger/filtrar al mejor candidato.|**Calificación y Selección:** Evaluar si las características del producto cumplen con lo que la empresa necesita.|

### 3. La Base de la Decisión (Comparación)

- **RRHH:** Comparas la **Ficha Profesiográfica** (la lista de requisitos del puesto: qué se necesita saber, qué experiencia debe tener) con las **Características del Candidato** (lo que la persona realmente ofrece).
    
- **SW y HW:** Comparas los **Requerimientos** de la empresa (lo que el sistema debe hacer: obligatorio, deseable) con las **Capacidades del Producto** (lo que el software o hardware puede hacer: sus parámetros y especificaciones).
    

### 4. ¿Quién Toma la Decisión Final? (Rol del Management)

- **RRHH:** El **Jefe de Línea** (el gerente del área donde trabajará la persona) tiene la **decisión final** de "acepto o no acepto" al candidato.
    
- **SW y HW:** La **Gerencia Superior** y una **red de grupos** (Compradores, Usuarios, TI) están más involucrados, ya que la decisión tecnológica afecta a toda la organización a largo plazo.
    

### 5. La Diferencia Fundamental

La mayor diferencia está en la naturaleza del recurso:

- El **Personal** siempre tiene un potencial de desarrollo; no es un recurso estático.
    
- El **Hardware** casi siempre se **compra externamente**.
    
- El **Software** tiene un **continuo de posibilidades**: se puede comprar como paquete externo, o se puede desarrollar internamente.
    

>[!WARNING] **En resumen:** En **RRHH**, el foco está en evaluar a un ser humano único y su potencial. En **TI**, el foco está en evaluar las especificaciones de un producto para ver si encaja en los requerimientos del negocio.
