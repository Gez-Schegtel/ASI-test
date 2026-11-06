
Se adjunta Caso de Estudio: "SEGURO VIRTUAL" (Fuente: Revista mensual **Information Technology Nº 191 - Agosto 2013**) y la publicación digital **"Afianzadora Latinoamericana y su éxito con VMware"** extraída de http://www.datamation.com.ar/afianzadora-latinoamericana-y-su-exito-con-vmware-4193.

## Consignas

# **A) Provisión de SI/TI**

## **I) Los siguientes criterios han sido considerados para guiar la migración de las aplicaciones. Complete la tabla, de acuerdo con lo pedido (12ptos. 4 ptos cada criterio completamente correcto, sino 0ptos)**

|                                                 | Escalabilidad                                                                                                                                                                                                                                                | Disponibilidad                                                                                                                                     | Requerimientos de HW                                                                                                                  |
| :---------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------ |
| **Especificación del criterio en el escenario** | Otro beneficio ganado es en cuanto a la capacidad de crecimiento «La posibilidad de escalar en las máquinas, sea en memoria o disco, es enorme. No se paraliza ningún procedimiento y proceso, mientras tanto, y se asegura la continuidad de la operación». | En cuanto a la disponibilidad, el gerente de operaciones es terminante: «No tuvimos caídas de servicio y ni una máquina virtual que se haya roto». | **Hardware:** Dos servidores Dell R710 con 32 GB de RAM, dos procesadores Quad-Core, cincuenta Desktops Banghó Y tres notebooks Dell. |
| **Tipo de parámetro al que dará origen**        | CUALITATIVO                                                                                                                                                                                                                                                  | CUALITATIVO                                                                                                                                        | CUANTITATIVO                                                                                                                          |

>[!important]
>**PARÁMETRO CUANTITATIVO**: Relacionarlo con la carga de trabajo empresarial (especificar con un número concreto porque vienen de cálculos).
>**PARÁMETRO CUALITATIVO**: Sujeto a preferencias y subjetividad de la empresa (no tiene números, puede tener porcentajes). Habla de **funcionalidades** que puede tener o funcionalidades.

> [!] ***FACILIDADES*** -> Aplicación (software facilities).

## **II) ¿Qué esquema de provisión y de qué recurso de SI/TI mantienen Afianzadora Latinoamericana con la empresa Manas-TI?. Explique detallada, profunda y fundadamente. (8ptos).**
> [!hint] **RTA.** El esquema de provisión es Outsourcing del tipo **Agencia de Servicios**, ya que Afianzadora contrata a la consultora Manas-TI para llevar a cabo el proyecto de migración de servidores, implementación de los programas virtualización y del nuevo servicio de correo electrónico, pero no le otorga una responsabilidad de management completa.


>[!info] Cuando se refieren a **recursos de SI/TI** tenemos que pensar tanto en recursos de HW y SW. Lo ideal es identificarlos en el escenario y detallarlos en la respuesta.
>
>Por ejemplo, en este escenario podemos identificar los siguientes: 
>
>* Recurso de HW: "Los servidores Dell R710."
>* Recurso de SW: "V-Sphere  5 de VMware."


Para ver esto pensa lo siguiente: Los esquemas de provision de HW/SW son 3
- ***DESARROLLO***
	- Cuando en el escenario te diga que los tipos decidieron armar una solucion de SW propia.
	- El programa que necesitas es tan **especial** que si lo usas, serás mejor que tus rivales. Si lo compras ya hecho, tu rival también podría comprarlo.
	- La solución que buscas es muy **novedosa o específica** para tu negocio, y simplemente no existe una aplicación estándar que la satisfaga.
- ***ADQUISICION***
	- Una pequeña empresa que necesita un sistema contable que funcione bien con el sistema de ventas, sin tener que gastar en modificaciones.
	- Usar software genérico que cualquier empresa necesita (ej. un programa de correo electrónico o una hoja de cálculo).
- ***OUTSOURCING***
	- Tercerizar. Tiene diferentes tipos.


| Tipo de Outsourcing                  | Concepto Clave                                                                                                                                   | Ejemplo Resumido                                                                               |
| :----------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------- |
| **Proveedor de Tiempo Compartido**   | Alquilar una herramienta específica (poder de cómputo).<br>- Tarea pequeña y para procesamiento externo.<br>- Te cobran por el tiempo. Ej.: AWS. | Un estudio de cine alquila un supercomputador en la nube para renderizar una película.         |
| **Agencia de Servicios**             | Contratar a un especialista para una **tarea completa**.                                                                                         | Una empresa contrata a otra firma para que le liquide los sueldos a sus empleados.             |
| **Management Completo de Servicios** | Entregar las llaves de todo el taller de TI a un gestor externo.                                                                                 | Un grupo de hospitales contrata a IBM para que se haga cargo de toda su operación informática. |
|                                      |                                                                                                                                                  |                                                                                                |


## **B) Subsistema de Aplicación de SI/TI. Planificación de la capacidad. Subsistema de Seguimiento de los SI/TI (30 ptos - 10 ptos cada respuesta completamente correcta)**

**Para el escenario en estudio:**

## **I. ¿Qué unidades de predicción natural (UPN) seleccionaría para planificar la demanda potencial en un ambiente informático de seguros de caución? Fundamente su respuesta.**

> [!hint] **RTA.** Las unidades de predicción natural que identificamos son...
> 
> * Pólizas de seguros.
> * Beneficiarios (o clientes).
> 
> Las unidades de predicción que identificamos en el escenario son las pólizas de los seguros y beneficiarios. Ambas son variables de negocio que tendrán un impacto directo en la utilización de recursos del sistema, ya que son actores de la operación diaria constituyendo la carga de trabajo. 

**II. ¿Cómo considera que puede ser el comportamiento de la carga de trabajo de esas UPN? Fundamente su respuesta.**

> [!hint] **RTA.** Tendencia positiva. 
> 
> Según lo descrito en el escenario, podemos esperar una **tendencia** hacia el crecimiento o aumento de la carga de trabajo. Esto se refleja, por ejemplo, en la situación que dio inicio al proyecto... 
> 
> *«Pasamos de 11 a 35 usuarios, detalla Gagazzi.»*
> 
> Esto nos da la pauta de que no solo habrá más beneficiarios, sino que también aumentará el número de pólizas "a procesar".

**III. ¿Con qué técnica de predicción estimaría la carga futura para cada UPN identificada en el punto B.I)? Justifique la propuesta en forma individual**

> [!hint] **RTA.** Regresión lineal.
> 
> Cuando el patrón de datos históricos muestra una tendencia uniforme de crecimiento (como en nuestro caso) o decrecimiento, la técnica más adecuada para proyectar la carga futura es la de **regresión lineal**. 
> 
> Si tomamos la UPN "beneficiarios" como la variable a estimar y al tiempo como la variable independiente, podemos predecir o proyectar el número que Afianzadora tendrá de dichos beneficiarios.    
> 
> El gráfico resultante tendrá características similares al siguiente (es una función lineal):
> 
![[Pasted image 20251117130446.png]]


##### como hacemos esta cagada?

![[Pasted image 20251115182942.png]]


El autor Xavier Molero en su libro *"Evaluación y modelado del rendimiento de los sistemas informáticos"* describe cuatro patrones básicos que se pueden encontrar en la carga de un sistema:

##### **PATRÓN: TENDENCIA → *MÉTODO: REGRESIÓN LINEAL***
1.  **Tendencia (Trend):** Los datos muestran un movimiento sostenido a largo plazo, ya sea hacia arriba (crecimiento) o hacia abajo (decrecimiento).
    *   **¿Cómo se ve?:** Como una línea que, en general, sube o baja.
    *   **Ejemplo:** El número de usuarios activos mensuales de una nueva aplicación (tiende a crecer). El espacio libre en un disco duro (tiende a decrecer).
    
>[!important] La regresión lineal es, por definición, una técnica para encontrar la **línea recta** que mejor representa una serie de datos. Si tus datos muestran un patrón de crecimiento o decrecimiento constante, este método es perfecto porque su suposición matemática (que los datos pueden ser descritos por una línea) coincide con la realidad de tus datos.
> *   **Por qué funciona:** Extiende esa línea hacia el futuro para predecir dónde estarán los próximos puntos.
> * **Cuándo NO funciona:** Si los datos tienen un fuerte componente estacional, la línea recta ignorará los picos y valles, generando grandes errores en la predicción.

**PATRON: ESTACIONAL/CICLICO -> *SUAVIZADO EXPONENCIAL***
1.  **Estacional (Seasonal):** Los datos muestran picos y valles que se repiten en intervalos de tiempo fijos y predecibles (horas del día, días de la semana, meses del año).
    *   **¿Cómo se ve?:** Como una onda regular y repetitiva.
    *   **Ejemplo:** El tráfico de una red corporativa, que tiene un pico de 9 a.m. a 5 p.m. y es casi nulo por la noche, repitiéndose cada día. Las ventas de un e-commerce, que siempre tienen un pico en diciembre.

2.  **Cíclico (Cyclical):** Similar a la estacionalidad, pero los picos y valles ocurren en intervalos de tiempo más largos e irregulares. A menudo están ligados a ciclos económicos o de negocio.
    *   **¿Cómo se ve?:** Como ondas más largas y menos predecibles que las estacionales.
    *   **Ejemplo:** Los ciclos de inversión en hardware de una empresa, que pueden ocurrir cada 3-5 años sin una fecha fija.

>[!important] ***SUAVIZASDO EXPONENCIAL***
> *   **Por qué funciona:** Da más peso a los datos nuevos, permitiendo que la predicción "aprenda" y se ajuste rápidamente a los cambios recientes en el comportamiento de la carga. 
> *   **Cuándo NO funciona:** La versión simple descrita en tu material no maneja bien ni la tendencia ni la estacionalidad por sí sola (aunque existen versiones avanzadas como Holt-Winters que sí lo hacen).


**PATRON: ESTACIONARIO -> *MEDIAS MOVILES***
3.  **Estacionario o Aleatorio (Stationary / Random):** Los datos no muestran ninguna tendencia ni patrón estacional. Fluctúan alrededor de un valor promedio constante. Puede haber variaciones, pero son impredecibles a corto plazo.
    *   **¿Cómo se ve?:** Como un conjunto de puntos dispersos horizontalmente alrededor de una media.
    *   **Ejemplo:** El número de fallos de red por día en un sistema estable.

>[!important] MEDIAS MOVILES
> *   **La Relación:** Si los datos no tienen tendencia y solo "ruido" aleatorio alrededor de un promedio, la suposición más lógica es que el futuro se parecerá al promedio del pasado reciente. Las medias móviles formalizan exactamente esto.
> *   **Por qué funciona:** Al promediar los últimos 'N' valores, se "suaviza" el ruido aleatorio y se obtiene una estimación estable del promedio central. Es una predicción conservadora pero robusta para datos estables.
> *   **Cuándo NO funciona:** Si aparece una tendencia, las medias móviles siempre irán "por detrás" del crecimiento real, subestimando constantemente los valores futuros.


| ***Patrón de Datos Históricos (Diagnóstico)*** | ***Descripción Visual***                                  | ***Método de Predicción Adecuado (Prescripción)***     | ***Razón de la Relación (Por qué funciona)***                                                                                                                   |
| :--------------------------------------------- | :-------------------------------------------------------- | :----------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Tendencia**                                  | Los puntos siguen una dirección general (arriba o abajo). | **Regresión Lineal**                                   | ***Modela matemáticamente esa línea*** de tendencia y la proyecta.                                                                                              |
| **Estacional**                                 | Ondas regulares y predecibles.                            | **Suavizado** (Métodos estacionales como Holt-Winters) | Da más peso a los datos nuevos, permitiendo que la predicción "aprenda" y ***se ajuste rápidamente*** a los cambios recientes en el comportamiento de la carga. |
| **Cíclico**                                    | Ondas largas e irregulares.                               | **Suavizado** (Análisis más complejo)                  | Intenta capturar la duración y amplitud de las ondas, aunque es más difícil.                                                                                    |
| **Estacionario**                               | Puntos dispersos horizontalmente sin dirección.           | **Medias Móviles**                                     | ***Asumen que el futuro será similar al promedio del pasado.*** El suavizado es más rápido para adaptarse a cambios.                                            |


## Artículo
### **Seguro virtual**
*Por Vanina Poledri*

---

Para ganar en disponibilidad y escalabilidad, Afianzadora implementó una solución de virtualización y mejoró su correo con una inversión de U$S 50.000.

Empresa joven. Optimización tecnológica. Baja inversión. Alta disponibilidad. Cuatro variables, todas relacionadas con Afianzadora Latinoamericana.

**Esta compañía ofrece seguros de caución** que son instrumentos de garantía por los cuales el asegurador garantiza al beneficiario el cumplimiento de las obligaciones no dinerarias de un tercero que es el tomador de las pólizas. 
Dentro del mercado asegurador es uno de los rubros más pequeños y, aunque las grandes compañías lo ofrecen, también es provisto por empresas especializadas, como es el caso de Afianzadora, que factura $100 millones al año.

La firma **nació en el 2005 con un plantel compuesto por los tres dueños más ocho personas**. Con solo once empleados, en ese momento la infraestructura tecnológica que se desplegó fue básica: **un servidor** (en realidad, era *una computadora personal* que cumplía tal fin) y **las estaciones de trabajo para los usuarios**. 

> **"No se paraliza ningún procedimiento ni proceso y se asegura la continuidad de la operación"**
>
> — Fernando Gagazzi, Gerente de Operaciones de Afianzadora

---

(Página 2)

Teníamos un presupuesto mínimo, por lo que buscábamos software open source para no tener problemas legales. Recuerda Fernando Gagazzi, gerente de operaciones de Afianzadora. Con esa estructura, a su cargo quedó también el área de sistemas, y actualmente continúa como responsable de la misma, además de sus tareas operativas. 
Desde el inicio, Afianzadora se apoyó en la consultora Manas-TI para la gestión tecnológica, que realiza el soporte de usuarios y el mantenimiento. Fue precisamente esta consultora la que en el 2011 alertó a Afianzadora de que la estructura les estaba quedando chica. Es que seis años no habían pasado en vano. De los originales 11 usuarios, habían pasado a 35, y eso era evidente tanto en la disponibilidad como en la lentitud que estaban experimentando en el uso de los aplicativos. El objetivo fue darle alta disponibilidad a la plataforma sin complejizarla y lograr un buen respaldo de los datos. 
«Manas nos sugirió que la mejor opción era virtualizar. Pensé también en migrar todo a la nube, pero no me terminó de cerrar», reconoce Gagazzi. Entonces la consultora les propuso dos opciones, Microsoft Hyper-V y VMware. «La versión de Hyper-V de ese momento era un poco más barata en la adquisición, pero estaba más cruda en estabilidad», recuerda Enrique Estigavirga, socio de Manas-TI. «La de VMware es fácil de manejar, tiene lo mejor del mundo Microsoft en la facilidad y lo mejor de Linux en cuanto a la estabilidad», opina Estigavirga. 
Para ese entonces la arquitectura de Afianzadora era un mix de los mundos de Microsoft y Linux, por lo que se decidió continuar con esa mezcla. La implementación se realizó con un presupuesto de U\$S42.000 para invertir en servidores, storage, cintas de backup y en las licencias de Zimbra (también de VMware) para correo electrónico, más U\$S 8.000 dólares en consultoría, que fue provista por Manas-TI.
#### A paso seguro. 
La nueva infraestructura incluye servidores Dell —adquiridos con el sistema de leasing—, replicados con máquinas virtualizadas. La implementación, desde que llegaron los servidores, duró entre 15 y 20 días, con virtualización y simulacro de carga y transacciones para evitar inconvenientes, tras lo que se migró en forma definitiva. «Arrancaron con una infraestructura de 7 servidores, y ahora tienen 20. Crearon un ambiente de prueba y de calidad que no tenían», detalla Estigavirga. 
Se migró también el core de seguros (que es de DC Sistemas y está basado en Linux) así como las autorizaciones de usuarios; otras funcionalidades están en Windows e Integra, que es un servidor que maneja aplicaciones con AFIP, «ya que tenemos la obligación de facturar con código de autorización electrónica y hacer las pólizas electrónicas a favor de la aduana, que se presentan a la AFIP a través del SIAP», detalla, Gagazzi. También se migró Sirius, un servidor que maneja la relación de afianzadora con productores y brokers.
Una de las ventajas que resalta Gagazzi es la flexibilidad que ahora tienen para ampliar o modificar los servidores. «Trabajo en estos temas desde 1979, y con la tecnología tradicional, cada vez que hay que agregar memoria o espacio en discos sigue siendo un problema. Ahora, cualquier modificación es totalmente simple. Las máquinas virtuales son fabulosas», destaca, y agrega que eso es algo sumamente necesario para una empresa que no tiene un equipo interno de sistemas. 
La migración del correo a Zimbra fue algo más traumática, más que nada por el cambio de interfaz para los usuarios acostumbrados al Outlook. «Se migró el histórico de correos de las 40 personas distribuidas entre la sede en Buenos Aires, más las sucursales en Córdoba, Mendoza, Mar del Plata y Rosario, que acceden a esta prestación», enumera Gagazzi.
Este cambio se hizo en paralelo. «La migración de Zimbra fue conviviendo con el servidor nuevo, migrando cada cuenta de a una, pese a que estaban en servidores distintos y de distintas marcas, permitiendo el uso en paralelo».
El cuello de botella fue una pequeña parte: El servidor de BlackBerry, que para Estigavirga «es una herramienta bastante tosca», aunque para Gagazzi sigue siendo bueno el resultado que obtienen los smartphones del proveedor canadiense. En cuanto a la disponibilidad, el gerente de operaciones es terminante: «No tuvimos caídas de servicio y ni una máquina virtual que se haya roto». Otro beneficio ganado es en cuanto a la capacidad de crecimiento «La posibilidad de escalar en las máquinas, sea en memoria o disco, es enorme. No se paraliza ningún procedimiento y proceso, mientras tanto, y se asegura la continuidad de la operación». 
La administración también ganó ventajas. «La practicidad más concreta es cuando hacemos ajustes replicando el servidor físico, lo que la herramienta hace automáticamente, más las alarmas visuales que se encienden cuando el servidor necesita más rendimiento, cierra Gagazzi.
#### **HIGHLIGHTS**
**Objetivo:** Darle alta disponibilidad a la plataforma sin tener que complejizarla y mejorar el sistema de correo electrónico.
**Plazo:** Cuatro meses.
**Inversión:** U\$S42.000 en hardware y software, U\$S 8.000 en consultoría e implementación.
**Líder de proyecto:** Fernando Gagazzi, gerente de operaciones de afianzadora.
#### **TECNOLOGÍA**
**Solución:** VMware Sphere 5, VMware Simbra.
**Proveedor:** Manas-TI y VMware.
**IT Corporativa:** 
**Hardware:** Dos servidores Dell R710 con 32 GB de RAM, dos procesadores Quad-Core, cincuenta Desktops Banghó Y tres notebooks Dell.
**Software:** VMware vCenter, Zimbra Integra, Sirius, DC Sistemas, SQL Server.
**Telecomunicaciones:** IPLAN (internet), Movistar (móvil), Telefónica (telefonía fija).
