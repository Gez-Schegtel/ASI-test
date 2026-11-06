# 1) El escenario — ¿qué está pasando en el caso?

- **La empresa**: National Australia Bank (NAB), grupo financiero global con ~2.000 sucursales y millones de clientes. Declara que su principal fortaleza “es su gente” y que invierte fuerte en desarrollo (solo en 2002, >USD 55M en capacitación).
    
- **El reto**: seguir siendo competitivos **atraendo y reteniendo talento** y, a la vez, **mejorar productividad y eficiencia de costos** del sistema de gestión de RR.HH.
    
- **La solución**: el director de Global eBusiness impulsa un **portal de empleados** (intranet de RR.HH.) tras investigar mejores prácticas; obtiene inversión de **USD 11M** y lo pone en marcha en **84 días**, con **>100 aplicaciones** (directorio, manuales, capacitación, prestaciones, etc.), **18.000 empleados** australianos lo usan; ahora quieren **ampliarlo a NZ y Europa** y te piden **cómo presentarlo** y qué harías tú.
    

👉 Palabra clave de la cátedra: esto se enmarca en **Mantenimiento de RR.HH.** (todo lo que sostiene y retiene a la gente ya incorporada: compensaciones/beneficios, higiene y seguridad, relaciones laborales, asistencias/jornada, capacitación continua, etc.). El **portal** es un **recurso tecnológico** para **estandarizar, automatizar y dar autoservicio** a esos procesos de mantenimiento.

---

# 2) ¿Es útil esta aplicación?

Sí: ataca directamente el objetivo por el que surgió (mejorar la gestión de RR.HH. y la eficiencia), ofreciendo **autoservicio**, **centralización**, **trazabilidad** y **datos para decidir**. Aun así, tiene riesgos si no se gestiona el **cambio cultural**, la **seguridad** y la **localización** normativa.

### Cuadro: ventajas vs. desventajas (respecto al objetivo declarado)

|Aspecto|Ventajas (cómo ayuda al objetivo)|Desventajas / Riesgos (a gestionar)|
|---|---|---|
|Eficiencia operativa|Autoservicio reduce tickets y tiempos de ciclo; unifica procesos 24/7.|“Shadow processes” si áreas no adoptan; picos de carga sin capacidad adecuada.|
|Costos|Menos tareas manuales repetitivas; menos papel; mejor control de horas/ausentismo.|Costo inicial alto (licencias/desarrollo); costos de cambio y entrenamiento.|
|Calidad/Consistencia|Políticas únicas, versiones controladas; flujos con validaciones y SLAs.|Si no se localiza por país, puede generar incumplimientos o fricción.|
|Datos/KPIs|Tableros (rotación, ausentismo, cursos, siniestralidad, etc.); mejores decisiones.|Datos malos → malas decisiones; necesidad de gobierno de datos.|
|Experiencia del empleado|Una sola puerta de entrada (beneficios, recibos, turnos, formación).|Si la UX es pobre, cae el uso; brecha digital en ciertos colectivos.|
|Cumplimiento (compliance)|Trazas, auditoría, consentimientos, H&S reportable.|Multilegalidad compleja (UE/GDPR, NZ, etc.) y gestión de privacidad.|
|Escalabilidad global|Arquitectura común + localización: reuso y despliegues más rápidos.|Diferencias de convenio/idioma generan “forks” si no se diseña bien.|

---

# 3) Siendo Gerente de SI/TI en **AGUNSA**: ¿qué contenido definiría y para qué?

Pensado para logística multi-país 24/7 (puertos, depósitos, transporte), y alineado a “mantenimiento”:

### Núcleo de autoservicio del empleado

- **Perfil & Directorio**: datos personales, skills, certificaciones; búsqueda de expertos. → **Para**: reducir tickets y mejorar asignaciones a tareas críticas.
    
- **Recibos de sueldo/beneficios**: descarga, simuladores, “Total Rewards”. → **Para**: transparencia y menos consultas.
    
- **Licencias & Asistencias**: solicitud/validación de ausencias, horas extra, turnos. → **Para**: control operativo y cumplimiento.
    
- **Formación (LMS)**: rutas por rol (montacargas, IATA, aduanas, seguridad portuaria), micro-learning móvil. → **Para**: habilitaciones al día y menor siniestralidad.
    
- **Higiene y Seguridad (H&S)**: reporte de incidentes/casi-incidentes, checklist EPP, aptos médicos, permisos de trabajo. → **Para**: reducir riesgos y demostrar cumplimiento.
    
- **Relaciones Laborales**: políticas, convenios, canal de reclamos, historial de actuaciones. → **Para**: orden y evidencia.
    

### Gestión para mandos/HRBP

- **Cuadrantes & Scheduling** (turnos, guardias, picos estacionales). → **Para**: optimizar dotación vs. demanda.
    
- **Onboarding/Offboarding** con workflows (RR.HH., TI, Seguridad Física). → **Para**: alta/baja sin fricciones y con controles.
    
- **Desempeño & Objetivos** (OKR/KPI), feedback 360, calibraciones. → **Para**: alinear desempeño con operaciones.
    
- **People Analytics**: rotación, ausentismo, costo HH, accidente x millón de HH, cumplimiento de capacitaciones, heatmaps por sitio. → **Para**: decisiones basadas en datos.
    

### Plataforma y gobierno (SI/TI)

- **SSO/MFA** (AD/AzureAD), **perfiles por rol y país**. → **Para**: seguridad y mínima fricción.
    
- **Integraciones**: nómina, control de accesos, fichado biométrico, T&A, ERP/WMS/TMS. → **Para**: datos consistentes end-to-end.
    
- **Privacidad/Compliance**: GDPR/LatAm, retenciones documentales, auditoría, consentimientos. → **Para**: cumplir marcos legales multi-país.
    
- **Mobile-first & Offline**: uso en patio/almacén con conectividad limitada. → **Para**: adopción real en operación.
    
- **Catálogo de servicios HR** + **mesa** (tickets, SLA, conocimiento). → **Para**: ordenar la demanda y medir.
    

---

# 4) ¿Cómo presentarlo y desplegarlo (lo que te pide el caso NAB)?

_(Esto responde al “How to present this program” al expandir a NZ/UE; adaptado a AGUNSA por similitud de reto multi-país)._

1. **Mensaje**: “Un solo lugar para todo lo de RR.HH.” — eficiencia, transparencia, seguridad y tu desarrollo. Historias cortas de valor (ej.: “María pide licencia en 2 minutos desde su móvil”).
    
2. **Localización**: idiomas, moneda, feriados, convenios y políticas locales desde el día 1.
    
3. **Despliegue por olas** (piloto→sitio→país), con **champions** en operaciones y RR.HH.
    
4. **Entrenamiento**: micro-videos, “cómo hago para…”, soporte en campo la primera semana.
    
5. **Métricas de éxito**: % adopción mensual, reducción de tickets HR, tiempo aprobación licencias, cumplimiento de capacitaciones críticas, NPS empleado.
    
6. **Gobierno continuo**: comité HR-TI, backlog de mejoras, gestión de cambios y releases.
    

---

# 5) Entregables directos para tu trabajo

## 5.1. Cuadro de ventajas y desventajas (listo para pegar)

_(Ya incluido arriba: puedes copiar la tabla tal cual.)_

## 5.2. Lista de “contenido y para qué” (AGUNSA)

- Autoservicio (perfil, recibos, licencias, beneficios) → **Reducir costos operativos y tiempos**.
    
- LMS habilitaciones críticas → **Cumplimiento y seguridad operacional**.
    
- H&S (incidentes, EPP, aptos) → **Menos siniestros y evidencia regulatoria**.
    
- Scheduling/turnos → **Cobertura eficiente de la demanda**.
    
- On/Offboarding con workflows → **Controles y experiencia del empleado**.
    
- People Analytics → **Planificación de dotación y decisiones con datos**.
    
- Integraciones (ERP/WMS/TMS, biométricos) → **Información coherente**.
    
- SSO/MFA, roles, privacidad → **Seguridad y compliance**.
    
- Catálogo + mesa HR con SLA → **Orden y mejora continua**.
    

---

# 6) Cómo cerrar la puesta en común

- **Sí, la aplicación es útil**: alinea mantenimiento de RR.HH. con eficiencia y experiencia.
    
- **Ventajas/desventajas**: presentadas en la tabla, con foco en objetivo (productividad y costos).
    
- **Como SI/TI de AGUNSA**, definimos un **portal de RR.HH.** con módulos concretos, integraciones y gobierno, orientado a **operación logística multi-país 24/7**.
    
- **Plan de presentación/despliegue**: comunicación clara, localización, olas, formación, KPIs.
    

Si querés, te lo armo en formato **Google Docs/Obsidian** con secciones numeradas y anexos (KPIs sugeridos, mapa de integración, plan de adopción de 90 días).