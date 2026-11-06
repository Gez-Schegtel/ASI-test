
# Tipos de parámetros: Cuantitativos y Cualitativos.
![[Pasted image 20251116204458.png]]

> [!cite] *Los parámetros cuantitativos surgen de mediciones y/o proyecciones de cantidades y capacidades...*
 
> [!warning] *Según la profe, los parámetros cualitativos se manifiestan como un porcentaje también.*

> [!cite] Citando a Rosina...
> *«Relacionados con requerimientos que se basan en la CARGA DE TRABAJO (real o proyectada), es decir que surgen de la operatoria de la empresa».*


## **Explicación de los Conceptos**

Cuando necesitas elegir un nuevo software (SW) o hardware (HW), no puedes simplemente decir "quiero el mejor". Tienes que definir una lista de criterios medibles para comparar las distintas opciones de forma objetiva. Estos criterios se dividen en dos grandes grupos: cuantitativos y cualitativos.

### **Parámetros Cuantitativos (Los Números)**

Piensa en ellos como **todo aquello que se puede medir con un número y una unidad de forma objetiva**. Son las especificaciones técnicas duras.

*   **Definición sencilla:** Son las métricas de capacidad, cantidad o velocidad de un componente de hardware o software.
*   **¿Cómo se obtienen?** Surgen de mediciones directas o proyecciones basadas en fórmulas matemáticas. No admiten opinión: un disco de 2 Terabytes es objetivamente más grande que uno de 1 Terabyte.
*   **Pregunta que responden:** ¿Cuánto? ¿Qué tan rápido? ¿Qué capacidad?
*   **Ejemplos del texto:**
    *   **tps (transacciones por segundo):** ¿Cuántas operaciones puede procesar la base de datos por segundo?
    *   **Tasa de transferencia:** ¿A qué velocidad (en Megabytes por segundo) puede leer o escribir datos el disco duro?
    *   **Capacidad de almacenamiento:** ¿Cuántos Terabytes de información puede guardar?
*   **Otros ejemplos claros:**
    *   **Memoria RAM:** 64 GB.
    *   **Velocidad del procesador:** 3.5 GHz.
    *   **Latencia de la red:** Menos de 10 milisegundos.
    *   **Número de usuarios simultáneos:** Capaz de soportar 500 usuarios conectados.

### **Parámetros Cualitativos (Las Cualidades)**

Piensa en ellos como **los atributos o características que no se pueden medir con un número de forma natural**. Dependen de la experiencia, la observación y las políticas de la empresa. Son subjetivos.

*   **Definición sencilla:** Son las cualidades "blandas" que determinan si un equipo es el adecuado para la organización, más allá de sus especificaciones técnicas.
*   **¿Cómo se tratan?** Como son subjetivos, el apunte menciona dos formas de manejarlos:
    1.  **Transformarlos en cuantitativos:** Se les asigna un puntaje en una escala (por ejemplo, del 1 al 5) para poder compararlos.
    2.  **Controlar su peso:** Asegurarse de que no representen más del 20% del total de la decisión para que la elección siga siendo mayormente objetiva.
*   **Pregunta que responden:** ¿Qué tal es? ¿Es compatible? ¿Es fácil de usar? ¿Es confiable?
*   **Ejemplos del texto:**
    *   **Tecnología de disco:** No se refiere a la capacidad (eso es cuantitativo), sino al *tipo* de tecnología. Por ejemplo: ¿Usamos discos HDD (tecnología más antigua y probada) o SSD NVMe (más nueva pero quizás menos probada en nuestro entorno)? La elección depende de la política de riesgo de la empresa.
    *   **Dimensiones de pantalla:** ¿El monitor de 27 pulgadas cabe físicamente en los escritorios de los empleados? ¿Su diseño es ergonómico?
    *   **Estética:** ¿El diseño de las laptops se alinea con la imagen profesional que queremos proyectar?
*   **Otros ejemplos claros:**
    *   **Facilidad de uso del software:** ¿Qué tan intuitiva es la interfaz para un usuario nuevo?
    *   **Calidad del soporte técnico del proveedor:** ¿Responden rápido? ¿Son eficientes?
    *   **Reputación de la marca:** ¿Es un fabricante conocido por su fiabilidad o por sus fallos?
    *   **Compatibilidad con sistemas existentes:** ¿El nuevo software se integra bien con nuestro sistema de facturación actual?


## **Analogía: Comprar un Auto para una Familia**

Imagina que estás eligiendo un auto nuevo. Tu proceso de decisión usaría ambos tipos de parámetros:

| Parámetros Cuantitativos (del folleto) | Parámetros Cualitativos (de tu juicio) |
| :--- | :--- |
| **Potencia del motor:** 150 caballos de fuerza. | **Comodidad de los asientos:** ¿Son cómodos para viajes largos? |
| **Consumo de combustible:** 5 litros cada 100 km. | **Seguridad percibida:** ¿La marca tiene buena reputación en seguridad? |
| **Capacidad del baúl:** 500 litros. | **Diseño y Estética:** ¿Te gusta cómo se ve el auto? |
| **Número de asientos:** 5. | **Facilidad de manejo:** ¿Es ágil para estacionar en la ciudad? |

## **Ejemplo Práctico en la Selección de un Servidor (Tu Escenario)**

Supongamos que Afianzadora necesita comprar un nuevo servidor.

1.  **Definición de Criterios Obligatorios:**
    *   **Parámetros Cuantitativos:**
        *   Debe tener al menos 128 GB de RAM.
        *   Debe tener 4 TB de almacenamiento en discos SSD.
        *   Debe tener una tarjeta de red de 10 Gbps.
    *   **Parámetros Cualitativos:**
        *   Debe ser compatible con VMware vSphere 5 (como en el caso).
        *   El proveedor debe ofrecer soporte técnico 24/7 en español.

2.  **Ponderación y Calificación (Transformando lo cualitativo):**
    Ahora comparas dos proveedores, A y B, que cumplen todos los requisitos cuantitativos. Para decidir, calificas los cualitativos en una escala de 1 a 10.

| Criterio Cualitativo | Proveedor A | Proveedor B |
| :--- | :--- | :--- |
| Calidad del soporte técnico | 9 (muy buena reputación) | 6 (reputación regular) |
| Calidad de la documentación | 8 (muy clara) | 5 (confusa y en inglés) |
| Reputación de la marca | 10 (líder del mercado) | 7 (marca secundaria) |
| **Total Cualitativo** | **27** | **18** |

**Decisión:** Aunque ambos servidores tenían la misma "potencia" (parámetros cuantitativos), eliges el del **Proveedor A** porque sus parámetros cualitativos, una vez ponderados, demuestran que se adapta mejor a las necesidades y políticas de la organización.

## Ejemplos de los distintos parámetros según prácticos


> [!info] *Esto salió del TP de provisión de SI/TI del año 2025.*

### Parámetros Cuantitativos
​
* La capacidad de gestionar al menos 10 proyectos simultáneamente.
* Manejar al menos 10 plantillas en edición en simultáneo.
* La aplicación debe permitir el seguimiento de al menos 100 tareas por proyecto, con alertas automáticas para cambios de estado y fechas de entrega.
* Debe permitir la exportación de datos con al menos 1.000 registros por proyecto.
* La herramienta debe permitir el registro de hasta 500 recursos por proyecto, junto con la capacidad de asignar hasta 100 tareas por cada RRHH.
* La aplicación debe manejar al menos 100 hitos por proyecto con alertas automáticas configurables para cada uno.
* Debe soportar al menos 50 roles de usuario diferentes con niveles de acceso definidos.

### Parámetros Cualitativos

* Las plantillas deben ser flexibles y adaptables a los diferentes tipos de proyectos que maneja la organización (edificios, viviendas, obras viales, etc.).
* La herramienta debe ofrecer visibilidad clara y accesible sobre cada proyecto, lo que permitirá una fácil supervisión y control.
* Disponibilidad de API para integrar con otras herramientas 

> [!warning] **Para que sea correcto este punto hay que especificar las herramientas que deben integrarse con la API.**

* Las alertas deben ser configurables para adaptarse a las necesidades de cada proyecto, incluyendo diferentes niveles de urgencia y tipos de notificaciones (correo electrónico, SMS, etc.).
* Exportación de datos a múltiples formatos (.csv, .pdf, .xls, .tsv).
* La exportación debe ser intuitiva y fácil de usar, sin necesidad de formación avanzada.
* La herramienta debe proporcionar una vista integral de los recursos disponibles, incluyendo la utilización de cada recurso en tiempo real, y ser flexible para adaptarse a cambios rápidos en la asignación de recursos.
* Las notificaciones deben ser personalizables en cuanto a su formato y frecuencia, permitiendo que los usuarios se ajusten a sus preferencias y necesidades de gestión.
* Las métricas deben ser fáciles de interpretar, con gráficos visuales que permitan una rápida toma de decisiones.
* Los reportes deben ser fáciles de personalizar y adaptarse al estilo de presentación de la organización.
* La gestión de roles debe ser flexible y permitir una configuración precisa de los permisos, de modo que se respete la estructura jerárquica de la organización.
* La herramienta debe permitir la personalización de plantillas de proyecto.
* La aplicación debe contar con la posibilidad de generar al menos 5 métricas clave por proyecto, como tiempo de ejecución, costo, avance de obra, cumplimiento de plazos, entre otras.
* La herramienta debe generar reportes automáticos con una cobertura de al menos el 90% de las métricas y datos relevantes de cada proyecto.