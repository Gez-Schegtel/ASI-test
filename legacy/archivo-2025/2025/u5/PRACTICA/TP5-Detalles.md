# Apunte Detallado: RUO, DyAC y Sistema de Gestión de Flotas

## 📌 Introducción

En **Administración de Sistemas de Información (ASI)** nos interesa responder a una pregunta clave:  
👉 ¿Cómo organizamos, gestionamos y dimensionamos el área de SI/TI para que apoye estratégicamente al negocio?

Este apunte recorre tres ejes:
1. **RUO**: Rol, Ubicación y Organización del área SI/TI.  
2. **DyAC**: Descripción y Análisis de Cargo.  
3. **Gestión de Flotas**: cómo planificar capacidad y rendimiento en un sistema transaccional.

> [!tip]  
> El objetivo es **conectar teoría con práctica**, usando el caso de AGUNSA (empresa logística).

---

## PARTE 1 – RUO, DyAC y comparación con Líder de Proyecto

### 1. RUO (Rol, Ubicación y Organización)

#### Concepto básico
- **Rol**: ¿para qué existe el área de SI/TI?  
- **Ubicación**: ¿a qué nivel jerárquico y con qué autonomía opera?  
- **Organización**: ¿cómo se estructura internamente?  

#### En la práctica (AGUNSA)
- **Rol:** *“Hacer algo con ellos”* → coproducción con áreas usuarias.  
  - Ejemplo: Sistemas trabaja junto a Logística para diseñar un módulo de ruteo.
- **Ubicación:** *Delegada* → descentralización con lineamientos comunes.  
  - Permite adaptarse a distintos países/regulaciones.  
- **Organización:** *Proyectos funcionales* → equipos mixtos y flexibles.  
  - **Desarrollo de Aplicaciones** (analistas, arquitectos, devs, QA).  
  - **Infraestructura** (IT Manager, DBA, soporte, seguridad).  
  - **Líderes de Proyecto** integran ambos para proyectos específicos.

> [!note]  
> RUO es un marco para alinear la gestión de SI con la estrategia empresarial.  

---

### 2. DyAC (Descripción y Análisis de Cargo)

#### Concepto básico
- Herramienta de **Recursos Humanos** para definir un puesto.  
- Incluye: misión, responsabilidades, autoridad, requisitos, competencias, condiciones.

#### En la práctica (Gerente de SI/TI)
- **Misión:** alinear SI/TI con el negocio, garantizar continuidad.  
- **Responsabilidades:** estrategia, seguridad, proveedores, presupuesto.  
- **Autoridad:** aprobar estándares, contratos, inversiones.  
- **Requisitos:** Ingeniero en Sistemas, +10 años experiencia.  
- **Competencias:** liderazgo, negociación, visión estratégica.  
- **Condiciones:** trabajo de oficina + visitas operativas.  
- **Indicadores (SLA/KPIs):** disponibilidad, satisfacción usuarios, cumplimiento presupuestario.

> [!example] Ejemplo de responsabilidad  
> “Asegurar que los sistemas críticos de logística estén disponibles 99,9% del tiempo”.

---

### 3. Comparación: Gerente de SI/TI vs Líder de Proyecto

| Atributo          | Gerente de SI/TI (estratégico)                          | Líder de Proyecto (táctico)                 |
|-------------------|--------------------------------------------------------|---------------------------------------------|
| **Atribuciones**  | Define estrategia, estándares y presupuesto             | Define alcance, cronograma y entregables     |
| **Funciones**     | Estrategia TI, seguridad, gestión global del área       | Planificar, coordinar y ejecutar proyectos   |
| **Responsables**  | ROI, disponibilidad, seguridad                          | Proyecto en tiempo, costo y calidad          |
| **Formación**     | Ingeniería en Sistemas, posgrado deseable               | Gestión de proyectos (PMI, Scrum, Ágil)      |

> [!warning] Error común  
> Confundir al **Líder de Proyecto** con un “mini gerente de TI”.  
> El primero gestiona **proyectos concretos**, el segundo **la visión estratégica del área**.

---

## PARTE 2 – Sistema de Gestión de Flotas

### i) Tipo de sistema

- **Transaccional en tiempo real**: procesa eventos cortos y frecuentes.  
- Ejemplos de transacciones:  
  - GPS cada pocos segundos.  
  - Sensores (motor, combustible, incidentes).  
  - Rutas calculadas en base a tráfico.  

> [!tip]  
> Lo importante en logística no es “guardar datos”, sino **procesarlos rápido para reaccionar en el momento**.

---

### ii) UPNs (Unidades de Predicción Natural)

#### Concepto
- Medidas de negocio que generan carga en el sistema.  
- Relacionan crecimiento del negocio con crecimiento de la carga.

#### UPNs elegidas
- **APM (Actualizaciones de Posición):** GPS/minuto.  
- **LSM (Lecturas de Sensores):** motor, combustible, tacógrafo.  
- **ROCD (Rutas Optimizadas Calculadas por Día).**  
- **AIGD (Alertas e Incidentes Generados).**  
- **RGU (Reportes Generados por Usuario).**

> [!example]  
> Si duplico los vehículos de 300 → 600, también se duplican las APM y LSM.

---

### iii) Variables y SLA

#### Externas (usuario percibe)
- GPS ≤ **3s**  
- Ruta ≤ **10s**  
- Reporte ≤ **30s**  
- Productividad: ≥ **300 rutas/hora**

#### Internas (sistema)
- Uso CPU/Disco ≤ 70–80%  
- Latencia red ≤ 1–2s  
- Solapamiento CPU+I/O 40–60%

> [!note]  
> Estos SLA se diseñan para **evitar que la logística se frene**.  
> 3 segundos de retraso en GPS puede significar una decisión equivocada de ruteo.

---

### iv) Variables de comportamiento

- **Fiabilidad:** sistema no falla frecuentemente (MTBF alto).  
- **Disponibilidad:** ≥ 99,9% (servicio casi continuo).  
- **Seguridad:** proteger datos de vehículos y conductores.  
- **Mantenibilidad:** facilidad para reparar tras un fallo.  
- **Performabilidad:** mantener un rendimiento aceptable incluso ante fallos.

> [!tip]  
> Piensa estas variables como la “salud” del sistema.  
> No basta con que funcione: debe ser **seguro, confiable y mantenible**.

---

## En la puesta en común

- “El RUO que planteamos es colaborativo porque TI necesita coproducir con las áreas operativas”.  
- “Definimos el sistema como transaccional en tiempo real: lo central son posiciones GPS y sensores cada pocos segundos”.  
- “La UPN clave son las actualizaciones de posición: si duplicamos la flota, duplicamos los mensajes por segundo”.  
- “Un SLA de GPS ≤ 3s es crítico: si tarda más, el monitoreo pierde valor en logística”.

---

## ✅ Conclusión

Este apunte te lleva de cero a experto en tres pasos:
1. **RUO**: cómo ubicar estratégicamente al área de TI.  
2. **DyAC**: cómo definir roles y cargos clave.  
3. **Gestión de Flotas**: cómo traducir necesidades de negocio en métricas técnicas (UPN, SLA, comportamiento).  

Con esto no solo podés **explicar la resolución**, sino también **defenderla con lógica de negocio y fundamentos técnicos**.





La consigna no pide solo hablar de **RUO** (Rol, Ubicación y Organización), sino también de **DyAC** (Dirección y Administración de los Sistemas de Información) y de la **comparación con el Líder de Proyecto**.

Eso se hace porque en la teoría que tenés en el apunte, se plantean distintos **enfoques de management de SI/TI**. Entonces:

---

### 🔹 RUO (Rol – Ubicación – Organización)

Sirve para **definir cómo se estructura el área de Sistemas** en relación con el resto de la empresa:

- **Rol** → qué papel juega el área de SI frente a los usuarios.
    
- **Ubicación** → dónde se toman las decisiones (central, descentralizada o delegada).
    
- **Organización** → cómo se agrupa el personal de SI (tradicional, por proyectos, centros de información, etc.).
    

Esto responde a la pregunta: _¿Cómo se dispone el área de Sistemas dentro de la empresa?_

---

### 🔹 DyAC (Dirección y Administración de los SI/TI)

- **Dirección** = nivel estratégico (CIO, alta gerencia) → decide políticas y objetivos.
    
- **Administración** = niveles tácticos y operativos → gerencias medias y jefaturas que gestionan día a día.
    

Esto responde a la pregunta: _¿Quién conduce y quién gestiona los SI/TI en la práctica?_

---

### 🔹 Comparación con Líder de Proyecto

El **Líder de Proyecto** es una figura táctica: no dirige toda el área de SI, sino que se encarga de **proyectos concretos** (ej: sistema de flotas, ERP, CRM).

- Arma equipos mixtos (usuarios + técnicos).
    
- Coordina tiempos, recursos y entregables.
    
- Reporta a la dirección, pero su foco es puntual.
    

Esto responde a la pregunta: _¿Qué diferencia hay entre organizar todo el área de SI (RUO/DyAC) y organizar un proyecto puntual (Líder de Proyecto)?_

---

✅ En síntesis:  
Se hace **RUO, DyAC y comparación con Líder de Proyecto** porque:

1. **RUO** define la forma general del área de SI.
    
2. **DyAC** aclara cómo se administra y dirige en distintos niveles.
    
3. **Comparación con Líder de Proyecto** muestra que no es lo mismo gestionar el área completa que coordinar un proyecto particular.
    


### 📌 1. Rol: “Hacer algo con ellos”

- **Teoría**: el apunte dice que hay distintos modelos de relación entre el área de Sistemas (IS) y los usuarios:
    
    - _“hacerles algo a ellos”_ (modelo tradicional),
        
    - _“hacer algo para ellos”_ (modelo de servicio),
        
    - _“hacer algo con ellos”_ (participación),
        
    - _“ayudarlos a que lo hagan por sí mismos”_ (apoyo al usuario final).
        
- **Resolución**: eligieron _“hacer algo con ellos”_ porque AGUNSA necesita que sistemas trabaje en conjunto con logística, finanzas, etc., no de manera aislada.
    
- **¿Por qué se hace así?** → Porque eso da mayor alineación con el negocio: el área de TI deja de ser un simple “soporte técnico” y pasa a ser un socio estratégico que co-crea soluciones.
    

---

### 📌 2. Ubicación: Delegada

- **Teoría**: existen tres ubicaciones posibles:
    
    - Centralizada (todo en un único lugar),
        
    - Descentralizada (mini centros replicados),
        
    - Delegada (cada área/localidad tiene autonomía con control propio).
        
- **Resolución**: pusieron _delegada_ porque AGUNSA trabaja en distintos países y contextos legales, entonces necesitan que cada región pueda decidir rápido sobre sus sistemas.
    
- **¿Por qué se hace así?** → Porque si fuera centralizado, cada cambio tendría que esperar a la casa matriz y sería lento. La delegación da flexibilidad para adaptarse localmente, pero con lineamientos corporativos para no romper la integración.
    

---

### 📌 3. Organización: Por proyectos funcionales

- **Teoría**: además del modelo tradicional (departamentos rígidos), existe la organización por **grupos de proyectos funcionales**.
    
- **Resolución**: eligieron esta porque permite mezclar gente de distintas áreas de SI (desarrollo + infraestructura) según el proyecto.
    
- **¿Por qué se hace así?** → Porque AGUNSA necesita rapidez y enfoque. Si se arma un equipo temporal con roles específicos, se logra más eficiencia que si todo se maneja en la estructura tradicional de “jefaturas” fijas.
    

Ejemplo:

- Proyecto “Sistema de Flotas” → equipo con analista funcional + desarrollador + DBA + soporte.
    
- Proyecto terminado → se integran los resultados al estándar de la empresa.
    

---

👉 En resumen:

- **Se hace así porque cada decisión (Rol – Ubicación – Organización) responde a lo que la teoría recomienda según el contexto**.
    
- Tu grupo analizó el caso de AGUNSA y aplicó:
    
    - _Rol colaborativo_ (trabajo conjunto),
        
    - _Ubicación delegada_ (flexibilidad internacional),
        
    - _Organización por proyectos_ (equipos mixtos según necesidad).
        
