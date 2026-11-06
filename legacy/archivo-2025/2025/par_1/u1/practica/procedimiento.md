
## [[Esquema general del procedimiento de alineacion de las estrategias de SI-TI con las estrategias organizacionales]]

ESTRATEGIA ORGANIZACIONAL -> NECESIDADES DE INFORMACION -> ESTRATEGIA DE SI -> ESTRATEGIA DE TI

## Fase 1 - Presentacion y compromiso del equipo
1. Decision de elaborar un paln de SI-TI.
2. Apoyo total de alta direccion
3. Formacion del ***COMITE DE SI-TI***
 
```mermaid
graph TD
		D[maximo responsable]
		D --> E[Responsable de cada area]
		D --> F[Responsable de SI]
```
ellos se encargan de 
- Supervisar
- Priotrizar
- Asignan recursos
- Aprueban

4. Conformacion del ***GRUPO BASE***
```mermaid
graph TD
		A[Responsable de SI]
		C[DOP]
		A --> C
```

En el caso de que el responsable no tenga idea sobre SI-TI, se debe contar con un Director de SI-TI

```mermaid
graph TD
		A[Responsable de SI]
		B[Director de SI-TI]
		C[DOP]
		A --> B
		B --> C
```

En caso de que se requiera de un apoyo externo, se debe contar con un Consultor de SI-TI

```mermaid
graph TD
		A[Responsable de SI]
		B[Director de SI-TI]
		C[Consultor de SI-TI]
		D[DOP]
		A --> B
		A --> C
		B --> D
```

Donde:
- Lider del proyecto (el que este por arriba del DOP) dirige al DOP

Este grupo:
- Pinesa el plan
- negocia ocn usuarios
- supervisa al equipo

5. Identificar areas y procesos clave
	En la practica cuando se ve un escenario a la hora de identificar las areas es por ejemplo:
	Area de ventas, area de produccion, area de compras, etc.
	Y los procesos clave son los que se consideran mas importantes por cada area. Ejemplo:
	Area de ventas -> Proceso de ventas
	Area de produccion -> Proceso de produccion

6. Conformacion del ***EQUIPO DE TRABAJO***
```mermaid
graph TD
	A[Responsable de areas invcolcradas]
	B[Personal de Areas]
	C[DOP]
	D[Personal de SI]
	A --> B
	C --> D
```



## Fase 2 - Descripcion de la Situacion actual
1. Identificar ***AREAS Y PROCESOS*** de negocio
2. Describir SI existentes
3. Criticar SI existentes
	1. Den negocio -> soporte adecuado
	2. Tecnico -> Rendimiento
4. Infomre final

## Fase 3 - Elaboracion de plan de SI/TI
1. Agregar Areas detectadas en Fase 2 al equipo
2. Determinar necesidades de Informacion
	- ***MATRIZ DE NECESIDADES***: Funciones/procesos - **Estrategia de SI**
3. Estructura globnal de SI Emergente
	- Director de SI-TI y DOP refinan
	- Comite de SI-TI aprueba
	- Se obtiene ***SUBSISTEMAS A  CONSTRUIR + RECURSOS NECESARIOS***
4. Evaluacion de recursos y escenarios
	- Propuestas tecnicas
5. Evaluacion + seleccion + priorizacion 
	- ***CARTERA DE APLICACIONES***

| Tipo de aplicación                                   | Descripción breve                                                                    |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------ |
| 🧪 **[[Aplicaciones de ALTO POTENCIAL]]**            | Aún no tienen impacto actual, pero **podrían ser clave en el futuro**.               |
| 🎯 **[[Aplicaciones ESTRATEGICAS]]**                 | Son **fundamentales hoy y en el futuro**. Alineadas con la estrategia del negocio.   |
| 🛠️ **[[Aplicaciones CLAVES PARA LAS OPERACIONES]]** | Tienen **alto impacto hoy**, pero **no son clave a futuro**. Necesarias para operar. |
| 🧩 **[[Aplicaciones de APOYO]]**                     | No son críticas hoy ni lo serán mañana, pero **ayudan en tareas específicas**.       |

## Fase 4 - Programacion de Actividades
1. Listar proyectos necesarios para 1 año
2. Cronograma detallado para 1 año
3. Asignar recursos a los proyectos para 1 año
4. plan de evaluacion y recvision
