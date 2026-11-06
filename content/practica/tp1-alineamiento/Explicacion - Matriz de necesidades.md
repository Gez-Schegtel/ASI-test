## ¿Qué es y para qué sirve esta matriz?

Imaginate que los directores de Vialidad no saben de bases de datos, APIs ni servidores. Ellos saben de presupuestos, baches, camiones y contratos. Por otro lado, el equipo de sistemas no siempre sabe cómo se calcula una certificación de obra.

La **Matriz de Necesidades** es el "traductor". Agarra los problemas de los jefes (Negocio) y los convierte en soluciones de software (Sistemas de Información/Tecnología).

La tabla se lee **de izquierda a derecha** siguiendo esta lógica:

1. **Dirección (¿Quién?):** El área de la empresa que tiene el problema.
2. **Necesidad de Información (¿Qué le falta?):** El dato o control que hoy no tienen (o que hacen a mano en papel y es un caos).


3. **Resultado de la Estrategia SI/TI (¿Cómo lo solucionamos?):** El nombre del sistema o módulo que el equipo de sistemas va a construir o comprar para solucionar ese problema específico.



---

## Traducción de la matriz "en criollo" (Fila por Fila)

Vamos a ver los ejemplos más claros de tu propia tabla para que veas lo fácil que es:

### 1. El caso de la Alta Dirección (Los Jefes Máximos)

* **Su problema:** Necesitan ver los indicadores consolidados de presupuesto y costos en tiempo real. No pueden estar llamando área por área para saber cuánta plata queda.


* **La solución de Sistemas:** **DVP-BI**. Un *Data Warehouse* (una gran base de datos centralizada) con *Dashboards* (pantallas llenas de gráficos y alertas visuales). El jefe aprieta un botón y ve el estado de todo Chaco en tiempo real.



### 2. Logística y Mantenimiento (Los Camiones y Talleres)

* **Su problema:** Hoy el control de combustible se hace en planillas de papel completadas a mano (un peligro de que se pierdan datos o haya desvíos). Necesitan saber el stock real en las 5 delegaciones de la provincia.


* **La solución de Sistemas:** **SiCC Móvil**. Una aplicación para el celular. El playero carga los litros en la app desde el terreno, y si un camión gasta de más, el sistema tira una alerta al instante.



### 3. Construcciones / Conservación (Las Rutas)

* **Su problema:** El sistema que usan para controlar a los Consorcios Camineros es de un proveedor externo, no tienen el código y están "rehenes" de ellos. Además, necesitan cruzar cuánto avanzó la obra físicamente con la plata que se pagó.


* **La solución de Sistemas:** **ERP Vial Integral (In-House)**. Sistemas va a desarrollar un software *propio* (hecho en casa) para gestionar licitaciones y contratos, eliminando al tercero y tomando el control total de los datos.



### 4. Secretaría General (Recursos Humanos)

* **Su problema:** Tienen los datos de los empleados fragmentados: la asistencia por un lado, las calificaciones por otro, la entrega de ropa por otro, y los viáticos en otro sistema.


* **La solución de Sistemas:** **Legajo Digital Único**. Conectar todos esos sistemas sueltos mediante APIs para que, al buscar a un empleado, aparezca una "pantalla 360°" con toda su vida laboral junta.



---

## Resumen para tu defensa o examen

Si te preguntan qué hace esta matriz, la respuesta ganadora es:

> "La matriz vincula los objetivos estratégicos de Vialidad con los proyectos de software del último bloque. Demuestra que cada sistema que proponemos desarrollar (como GeoVial, LabVial o SiCC Móvil) no es por capricho tecnológico, sino porque responde directamente a una necesidad operativa o financiera insatisfecha de alguna dirección del organismo."





### 5. Ingeniería Vial / Planificación

* **La Necesidad (El problema):** Necesitan ver en un mapa (*estado georreferenciado*) cómo están las rutas, puentes y alcantarillas, y además cruzarlo con los datos de dónde ocurren más accidentes (*puntos críticos de accidentología*). Hoy esa información está dispersa.


* **La Solución (GeoVial):** Se propone un sistema **GIS** (Sistema de Información Geográfica). Es literalmente un Google Maps interno de Vialidad pero con "capas" de datos técnicos. El ingeniero puede ver visualmente qué ruta está rota y si coincide con una zona de muchos accidentes para priorizar arreglarla primero.



### 6. Administración

* **La Necesidad (El problema):** El área contable necesita hacer un *cruce instantáneo* entre lo que gasta Logística (repuestos, arreglos de camiones, combustible) y la plata que queda disponible en el presupuesto. Si no están integrados, corren el riesgo de gastar de más o enterarse tarde de que se quedaron sin fondos.


* **La Solución (APIs integradas):** En lugar de hacer planillas manuales para cruzar los datos, se crean **APIs** (puentes de comunicación de software) para conectar tres sistemas que hoy funcionan por separado: *TallerDLM*, *StockDVP* y *OrdenesDVP*. Cuando un taller usa un repuesto, el presupuesto se actualiza automáticamente sin que nadie tenga que cargar nada a mano.



### 7. Tecnología Vial (El laboratorio de materiales)

* **La Necesidad (El problema):** Ellos hacen los ensayos químicos, mecánicos y de suelo para ver si el asfalto que pone una empresa contratista es de buena calidad. El problema es que esos resultados se suelen anotar de forma informal (cuadernos, PDFs sueltos) y es difícil auditarlos a lo largo del tiempo o usarlos como prueba legal si una ruta se rompe antes de tiempo.


* **La Solución (LabVial):** Una base de datos centralizada y formal donde se cargan todos los ensayos de suelos y materiales. Si en dos años una ruta se deforma, el organismo tiene el registro digital e histórico para demostrar si el contratista usó materiales defectuosos y exigirle la garantía de obra.



### 8. Asuntos Jurídicos

* **La Necesidad (El problema):** Manejan juicios, amparos y expropiaciones de terrenos para poder pasar las rutas por las 5 delegaciones zonales. Si se les pasa un vencimiento o un plazo legal por tener los papeles desorganizados, el Estado Provincial pierde mucha plata.


* **La Solución (LexDoctor):** En lugar de gastar tiempo y recursos de sistemas en programar algo desde cero, se decide mantener y renovar las licencias de **LexDoctor**, que es un software comercial que ya es el estándar nacional para abogados y procuración. Les sirve para alarmas de vencimientos, plazos procesales y seguimiento de expedientes jurídicos.

