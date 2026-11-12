---
title: "Presentación — TP1: Alineamiento de SI/TI"
---

# Presentación — TP1: Alineamiento de SI/TI

UTN — FACULTAD REGIONAL RESISTENCIA

Alineación del Plan Estratégico de
SI/TI
Trabajo Práctico N°1 — Dirección de Vialidad Provincial del Chaco
Profesores: Montiel, Raul Alejandro · Ramirez, Rosina · Soria Ojeda, Claudia
Integrantes: Esquivel, Emilio · Fernández, Facundo Nahuel · Gomez, Christian · Medina,
Mariano · Retamozo Enrique, Agustín Rubén · Robales, Lautaro · Orgoñ, Nahiara · Velazco
Gez Schegtel, Juan Ignacio

---

FASE 1

Dirección de Vialidad
Provincial del Chaco
Organismo público encargado de la planificación, construcción,
mantenimiento y administración de la red vial provincial, con impacto
directo en la conectividad, producción y desarrollo social del Chaco.

Construcción

Mantenimiento

Rutas, pavimento urbano y
obras por administración o
licitación.

Conservación de caminos y
coordinación con municipios.

Objetivos Clave
Optimizar el Fondo Vial, proyectar planes de obras y coordinar con
la Dirección Nacional de Vialidad.
La estructura organizativa incluye un Administrador y
Subadministrador General (designados por el Poder Ejecutivo por 4
años), un Ingeniero Jefe como referente técnico, y nueve direcciones
especializadas: Ingeniería Vial, Planificación Vial, Asuntos Jurídicos,
Administración, Tecnología Vial, Construcciones, Secretaría General,
Logística y Mantenimiento, Conservación y Vialidad Urbana.

---

FASE 2

Análisis FODA — Situación Actual

💪 Fortalezas

⚠️ Debilidades

Sistemas preexistentes: Viaticar, RopasDVP, TallerDLM, StockDVP,

Sistemas "silo" sin comunicación entre áreas

OrdenesDVP

Carencia de herramientas BI y dashboards para directores

Proactividad de la alta dirección (Ing. Canela y directores de área)

Control de combustible (SiCC) basado en planillas físicas manuales

Aceptación del cambio: digitalización exitosa de procesos manuales
(Calificaciones, Viáticos)

Falta de canales digitales ciudadanos (mapa vial interactivo)

GesTaller como referente técnico provincial interinstitucional

🚀 Oportunidades

🔴 Amenazas

Implementación de BI para explotar datos existentes

Vendor lock-in en sistema de Consorcios (código cerrado)

Aplicaciones móviles para trabajo en terreno en 5 delegaciones

Riesgo de fugas de recursos sin modernización del SiCC

zonales

Limitaciones presupuestarias que exigen demostrar ROI rápido

Integración interinstitucional con GesTaller
IA, chatbots y georreferenciación avanzada
Integración de sistemas actuales en una arquitectura unificada.

---

FASE 2

Sistemas de Información Existentes
La DVP dispone de múltiples sistemas operativos, pero funcionan como islas de información sin integración ni explotación analítica.

Viaticar

RopasDVP

Gestión de viáticos y rendiciones. Sin análisis de datos.

Pedidos de indumentaria laboral. Sin reportes de gastos.

TallerDLM

StockDVP

Insumos y órdenes de trabajo mecánica. Sin reportes analíticos.

Movimientos de stock (cubiertas, repuestos). Solo registración
operativa.

SiCC

GesTaller

Cargas de combustible con planillas manuales. Limitada
explotación.

Parque automotor provincial interinstitucional. Solo operativo.

RRHH + Calificaciones

LexDoctor

Gestión integral del personal y evaluación de desempeño
digitalizada.

Procesos judiciales digitalizados: expedientes, plazos, audiencias y
escritos automatizados.

Consorcio

OrdenesDVP

Sistema tercerizado para consorcios camineros. Sin acceso al
código fuente.

Órdenes de provisión y compra por dirección. Escasa capacidad
analítica.

---

FASE 3

Matriz de Necesidades — Alineación SI/TI
Cada dirección tiene necesidades de información específicas que el plan SI/TI debe resolver.
Dirección

Necesidad de Información

Resultado de la Estrategia SI/TI

Alta Dirección

Indicadores consolidados de ejecución
presupuestaria y costos operativos en tiempo
real

DVP-BI: Data Warehouse centralizado con
Dashboards y KPIs en tiempo real para la
Alta Dirección.

Ingeniería Vial / Planificación

Estado georreferenciado de infraestructura vial y
puntos críticos de accidentología

GeoVial (GIS): Entorno geográfico
avanzado con capas de inventario vial y
análisis de accidentología.

Construcciones /
Conservación

Avance físico-financiero de obras y
certificaciones auditable de consorcios

ERP Vial Integral (In-House): Plataforma
propia para licitaciones, certificaciones y
consorcios, eliminando dependencia de
terceros.

Logística y Mantenimiento

Control exacto de combustible in situ y stock real
en 5 delegaciones zonales

SiCC Móvil: App para registro digital in situ
con alertas de consumos atípicos en
tiempo real.

Administración

Cruce instantáneo entre consumo logístico y
saldos presupuestarios

APIs integradas: Interoperabilidad entre
TallerDLM, StockDVP y OrdenesDVP para
automatizar el flujo de gasto operativo.

Secretaría General (RRHH)

Perfil unificado de cada agente: asistencia,
calificaciones, viáticos, indumentaria

Legajo Digital Único: Ecosistema API que
unifica RRHH, Calificaciones, Viaticar y
RopasDVP con visión 360° del empleado.

Tecnología Vial

Registro centralizado y auditable de ensayos
físicos, químicos y mecánicos

LabVial: Base de datos centralizada para
resultados de ensayos de suelos y
materiales, eliminando registros
informales.

Asuntos Jurídicos

Estado procesal y vencimientos de expedientes
legales en 5 delegaciones

LexDoctor: Mantenimiento del estándar
legal nacional para seguimiento de plazos
procesales y expropiaciones.

---

FASE 3

Estrategias de SI/TI por Área
Control de Gestión Institucional (Alta Dirección)
Estrategia de SI: Facilitar la toma de decisiones estratégicas de la Alta Gerencia mediante el acceso a información
consolidada y en tiempo real sobre la ejecución presupuestaria y costos operativos, garantizando el uso eficiente de
los recursos provinciales.
Estrategia de TI: Implementar una solución de Inteligencia de Negocios (DVP-BI) basada en un Data Warehouse que
centralice la extracción de datos de todas las áreas para la generación de Dashboards y KPIs en tiempo real.

Planificación y Análisis Territorial (Ingeniería Vial)
Estrategia de SI: Disponer de una visión integral y georreferenciada del territorio provincial que permita analizar la
relación entre el estado del inventario vial y los índices de accidentología, facilitando la planificación estratégica de
intervenciones y la toma de decisiones basada en datos geográficos precisos y actualizados.
Estrategia de TI: Implementar el sistema GeoVial (GIS) como un entorno geográfico avanzado que centralice la
visualización y el análisis espacial de la red vial. El sistema debe permitir la integración de capas de datos estadísticos
dinámicas, herramientas de mapeo del inventario físico y módulos de análisis de accidentología, proporcionando a las
áreas técnicas una plataforma interactiva para la planificación territorial.

Gestión Misional y Soberanía Tecnológica (Ingeniería y Construcciones)
Estrategia de SI: Disponer de una plataforma de gestión unificada y soberanía tecnológica que permita informatizar,
estandarizar y auditar los procesos misionales de ingeniería, obras y conservación, garantizando la trazabilidad
financiera de las certificaciones de obra.
Estrategia de TI: Desarrollar de forma evolutiva un ERP Vial Integral propio (In-House) para eliminar la dependencia
tecnológica de terceros y centralizar la operación de las Direcciones en módulos específicos para la gestión de
licitaciones, certificación de obras y administración de Consorcios.

Control de Recursos en Terreno (Combustible)
Estrategia de SI: Optimizar el control operativo en terreno y la transparencia en el uso de insumos críticos, eliminando
la incertidumbre de los registros manuales para garantizar un seguimiento estricto de los despachos de combustible.
Estrategia de TI: Implementar la aplicación móvil "SiCC Móvil" para reemplazar el circuito de papel. La herramienta
debe permitir el registro digital y la validación in situ de cada carga, integrando un motor de alertas que detecte
consumos atípicos en tiempo real.

---

FASE 3

Estrategias de SI/TI por Área
Trazabilidad del Gasto Operativo (Logística y Administración)
Estrategia de SI: Disponer de una visión integral y unificada de la cadena de suministros y los costos operativos,
permitiendo la trazabilidad automática de los gastos institucionales para asegurar un control financiero preciso.
Estrategia de TI: Implementar una arquitectura de interoperabilidad basada en APIs que integre los sistemas
TallerDLM, StockDVP y OrdenesDVP, erradicando los silos de datos para automatizar el flujo de información desde el
consumo hasta el presupuesto.

Visión integral del Capital Humano (Secretaría General / RRHH)
Estrategia de SI: Contar con una perspectiva integral y centralizada del desempeño e historial de cada agente,
facilitando la gestión del talento mediante un acceso rápido a la información consolidada del personal.
Estrategia de TI: Desarrollar un ecosistema de integración mediante APIs que unifique los sistemas de RRHH,
Calificaciones, Viaticar y RopasDVP para conformar un Legajo Digital Único con visión 360° del empleado.

Control de Calidad (Dirección de Tecnología Vial)
Estrategia de SI: Disponer de una base de conocimiento técnico auditable que garantice el aseguramiento de la calidad
de los materiales y procesos constructivos, permitiendo a la institución respaldar técnica y legalmente el cumplimiento
de las garantías de obra frente a las empresas contratistas.
Estrategia de TI: Desarrollar e implementar el sistema "LabVial" como una base de datos centralizada para el registro,
consulta y resguardo digital de todos los resultados de laboratorios de suelos y materiales, eliminando la dependencia
de registros informales en cuadernos o archivos PDF aislados.

Retención Legal (Dirección de Asuntos Jurídicos)
Estrategia de SI: Asegurar el seguimiento y control estricto de la situación jurídica y procesal del organismo,
garantizando el cumplimiento ineludible de los plazos legales para mitigar el riesgo de sanciones, juicios o pérdidas
patrimoniales para el Estado provincial.
Estrategia de TI: Aplicar una estrategia de "Retención y Mantenimiento" renovando y manteniendo las licencias del
software LexDoctor (estándar nacional en el ámbito legal). Esta decisión evita el desgaste de desarrollar un sistema a
medida, optimizando la eficiencia del presupuesto de TI para enfocar los recursos de programación exclusivamente en
el Core del negocio (el ERP).

---

FASE 3

Valor de la Inversión — Beneficios Esperados
Eficiencia (E1 — Automatizar)

Efectividad (E2 — Informar)

SiCC Móvil: Ahorro de USD 18.000/año en papelería; reducción del
45% en tiempo de carga (120 hs-hombre/mes liberadas)

DVP-BI: Monitoreo en tiempo real del Fondo Vial para corrección
proactiva de partidas presupuestarias

Sistemas Logísticos: Reducción del 40% en time-to-repair; 15%

Legajo Digital: Decisiones de ascenso basadas en mérito real,

menos stock ocioso (USD 25.000 evitados en el primer año)

reduciendo favoritismo subjetivo

ERP Vial: Certificaciones de 45 a 12 días; USD 35.000/año evitados

Integración Logística: Mayor disponibilidad operativa de la flota con

en intereses por mora

control presupuestario auditado

LabVial: Evitación del 8% en presupuestos de bacheo prematuro
mediante garantías contractuales exigibles

Avance Estratégico (E3 — Transformar)
ERP In-House: Recuperación del control total del ciclo de obra pública
y redefinición del poder de negociación con contratistas
GeoVial GIS: Transformación de ente reactivo a planificador territorial
estratégico, alineado con reducción de mortalidad vial

---

FASE 3

Cartera de Aplicaciones y Estilos de Gestión
Clasificación según impacto estratégico y operativo (Modelo Andreu, Ricart y Valor / Robson).

Tipos de Inversión (Robson)
Valor Operacional: SiCC Móvil, APIs logísticas, Legajo Digital,
LabVial
Valor Estratégico: ERP Vial In-House, GeoVial GIS, DVP-BI
Umbral (obligatoria): LexDoctor
Infraestructura: Arquitectura de APIs como cableado lógico
institucional

Estilos de Gestión TI

→

Planificación Centralizada Estratégicos
Hilo Conductor Alto Potencial
Monopolio Clave para Operaciones
Recurso Escaso Apoyo

→
→
→

---

FASE 4

Programación de Actividades — Año 1
El Comité de TI/SI aprueba la implementación del Sistema Integrado Misional (ERP Vial In-House + SIG GeoVial) con enfoque incremental para mitigar
riesgos.

Hito 1 — Mes 1 a 4

1

Mapa Base e Inventario Vial: Relevamiento cartográfico y
lanzamiento del Mapa Interactivo GeoVial para visualización
centralizada de la red vial provincial.

Hito 3 — Mes 11 a 12

2
3

Hito 2 — Mes 5 a 10
Gestión de Obras y Certificaciones: Despliegue del Módulo de
Construcciones (ERP) para cálculo automatizado del Avance
Físico-Financiero y generación de certificaciones.

Integración Espacial y Tablero Gerencial: Vinculación del ERP
con GeoVial y estructuración del DVP-BI (Tableros de Control)
para la Alta Dirección.

4

Hito 4 — Mes 13 a 18
Consorcios y Despliegue Zonal: Circuito administrativo para
Consorcios Camineros y capacitaciones presenciales en las 5
Delegaciones Zonales.

---

FASE 4 — CIERRE

Recursos, Evaluación y Entregables Finales
Asignación de Recursos

Plan de Evaluación

1 Analista Funcional / DOP: 1.920 hs-hombre/año (100%
dedicación)

Validación iterativa de prototipos (mockups) con directores de área
antes de programar

1 Programador Senior Full-Stack: 1.920 hs-hombre/año (100%
dedicación)

Revisiones de hito: informe de estado ante el Comité de TI/SI al
concluir cada fase

Usuarios Clave: 240 hs-hombre/año (5 hs/semanales por
dirección)

Métricas de control: cumplimiento de plazos y ejecución
presupuestaria

Infraestructura: 2 servidores (app/BD + GIS) + 2 workstations de
desarrollo

Entregables Finales del Alineamiento

Software: Open Source (PostgreSQL/PostGIS, Node.js) — sin
licencias comerciales

1. Cartera de proyectos documentada y aprobada (ERP Vial In-House +
GeoVial)

Contingencia: 15% del presupuesto para desviaciones
operativas/técnicas

2. Calendario de ejecución estricto (12 meses + proyección a 18
meses)

3. Asignación de recursos transparente: horas-hombre, infraestructura
y presupuesto económico

El plan aprobado garantiza soberanía tecnológica, dato único auditable y planificación territorial basada en datos para la Dirección de
Vialidad Provincial del Chaco.

---
