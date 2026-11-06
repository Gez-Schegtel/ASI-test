
---

## 📌 La idea central

En el suavizado exponencial, cada nuevo pronóstico es una **mezcla entre el dato real más reciente y la previsión anterior**.

La fórmula es:

ft+1=ft+α(yt−ft)f_{t+1} = f_t + \alpha (y_{t} - f_t)

o equivalente:

ft+1=αyt+(1−α)ftf_{t+1} = \alpha y_t + (1 - \alpha) f_t

---

## 📌 ¿Qué significa el α=0,6?

- El nuevo valor pronosticado se compone de:
    
    - **60% (α=0,6)** del dato real más reciente.
        
    - **40% (1–α=0,4)** de la previsión anterior.
        

👉 Esto quiere decir que **el último dato manda más**.

---

## 📌 Ejemplo con enero–febrero

- Diciembre tuvo una previsión de **88,16**.
    
- Enero el valor real fue **30**.
    

Cálculo de febrero:

ffeb=(0,6×30)+(0,4×88,16)=18+35,26=53,26f_{feb} = (0,6 \times 30) + (0,4 \times 88,16) = 18 + 35,26 = 53,26

👉 Entonces:

- No se va directo a 30 (como haría si α=1).
    
- No se queda en 88,16 (como haría si α=0).
    
- Sino que hace un “promedio ponderado” con **60% de lo nuevo y 40% de lo viejo**.
    

---

## 📌 Cómo interpretarlo

- **α alto (ej. 0,9)** → casi todo el peso es el último dato → el pronóstico reacciona **muy rápido** (pero puede ser inestable).
    
- **α bajo (ej. 0,2)** → se priorizan los valores anteriores → el pronóstico es **más estable**, pero se atrasa cuando hay cambios bruscos.
    
- **α=0,6** → es un punto medio: da bastante importancia a lo nuevo, pero no olvida del todo la tendencia previa.
    

---

👉 En clase podés decir algo como:

> “Con α=0,6 el suavizado exponencial prioriza en un 60% el valor más reciente y en un 40% la previsión anterior. Esto le permite reaccionar rápido a cambios recientes en la carga, sin volverse tan inestable como si solo tomara el último dato.”

---


La ecuación

ft+1=ft+α(yt+1−ft)f_{t+1} = f_t + \alpha (y_{t+1} - f_t)

es **otra forma de escribir exactamente lo mismo** que te mostré antes:

ft+1=αyt+1+(1−α)ftf_{t+1} = \alpha y_{t+1} + (1-\alpha) f_t

---

## 📌 ¿Por qué existen las dos formas?

👉 Empecemos desde la segunda (la más intuitiva):

ft+1=αyt+1+(1−α)ftf_{t+1} = \alpha y_{t+1} + (1-\alpha) f_t

- α = peso del dato nuevo.
    
- (1–α) = peso de la previsión anterior.
    

---

Si abrís el paréntesis de la primera fórmula:

ft+1=ft+α(yt+1−ft)f_{t+1} = f_t + \alpha(y_{t+1} - f_t) ft+1=ft+αyt+1−αftf_{t+1} = f_t + \alpha y_{t+1} - \alpha f_t ft+1=(1−α)ft+αyt+1f_{t+1} = (1-\alpha) f_t + \alpha y_{t+1}

👉 ¡Es lo mismo! Solo que está reordenado.

---

## 📌 ¿Por qué se usa esa forma?

Porque escrita así:

ft+1=ft+α(yt+1−ft)f_{t+1} = f_t + \alpha (y_{t+1} - f_t)

- Se interpreta como: **la nueva previsión es la previsión anterior + un ajuste**.
    
- Ese ajuste es α veces la diferencia entre lo que pasó en realidad (yt+1y_{t+1}) y lo que esperábamos (ftf_t).
    

👉 Es como decir:

> “Si me equivoqué, corrijo en parte mi previsión anterior, pero no del todo: solo un α de la diferencia”.

---

## 📌 Ejemplo práctico con enero 2025

- Previsión anterior (diciembre): fdic=88,16f_{dic} = 88,16.
    
- Valor real (enero): yene=30y_{ene} = 30.
    
- Diferencia: yene−fdic=30−88,16=−58,16y_{ene} - f_{dic} = 30 - 88,16 = -58,16.
    

Cálculo:

fene=88,16+0,6(−58,16)f_{ene} = 88,16 + 0,6(-58,16) fene=88,16−34,90=53,26f_{ene} = 88,16 - 34,90 = 53,26

👉 ¿Qué pasó? La previsión bajó, porque el valor real fue mucho más bajo.  
Pero **no bajó todo el camino hasta 30**: solo corrigió el 60% de la diferencia.

---

## 📌 En resumen

- Las dos fórmulas son iguales matemáticamente.
    
- La forma
    
    ft+1=ft+α(yt+1−ft)f_{t+1} = f_t + \alpha(y_{t+1}-f_t)
    
    se usa porque muestra la **idea de corrección parcial**: cada mes ajusto mi pronóstico anterior según lo que pasó, pero solo en una fracción α.
    


## 📌 Los símbolos

- yty_t → **valor real observado** en el periodo tt.  
    👉 Ejemplo: en enero 2025, el sistema midió **30 s de CPU**. Ese 30 es un yy.
    
- ftf_t → **valor previsto (forecast)** que yo tenía para ese mismo periodo tt.  
    👉 Ejemplo: antes de que llegara enero, mi previsión (a partir de diciembre) era **88,16**. Ese es un ff.
    
- ft+1f_{t+1} → la **nueva previsión** que calculo para el siguiente periodo, usando el valor real que recién observé (yty_t) y mi previsión pasada (ftf_t).
    

---

## 📌 Cómo se usan en el cálculo

Ejemplo con **diciembre → enero**:

1. Tenía una **previsión para diciembre**:  
    fdic=88,16f_{dic} = 88,16.
    
2. Veo el **valor real en enero**:  
    yene=30y_{ene} = 30.
    
3. Calculo la **nueva previsión para enero** usando la fórmula:
    
    fene=fdic+α(yene−fdic)f_{ene} = f_{dic} + \alpha (y_{ene} - f_{dic})
    
    Sustituyendo:
    
    fene=88,16+0,6(30−88,16)f_{ene} = 88,16 + 0,6(30 - 88,16) fene=53,26f_{ene} = 53,26

👉 Resultado: mi nueva previsión para enero es 53,26.

---

## 📌 Interpretación

- yy = lo que pasó en la realidad.
    
- ff = lo que yo había previsto (y lo que voy ajustando).
    
- El método va corrigiendo ff **cada mes**, acercándolo a la realidad, pero **solo en una fracción α** (no del todo).
    

---

👉 Podés pensarlo así:

- yy = “el presente real”.
    
- ff = “mi expectativa del futuro”.
    
- Fórmula = “ajusto mi expectativa en base a lo que pasó, pero con cautela (α)”.
    

