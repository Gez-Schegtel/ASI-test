# Checkmk RAW en Docker

Este proyecto levanta una instancia de [Checkmk Raw Edition](https://checkmk.com/product/raw) usando Docker Compose para facilitar la monitorización de sistemas y servicios.

## 🚀 ¿Qué hace este `docker-compose.yml`?

- Descarga la imagen oficial de Checkmk Raw 2.3.

- Expone el puerto web en `localhost:8080`.

- Expone el puerto del agente en `localhost:8000`.

- Usa un volumen persistente (`checkmk_data/`) para guardar la configuración del sitio.

- Monta correctamente un sistema de archivos temporal (`tmpfs`) para mejorar el rendimiento.

- Crea automáticamente un contenedor llamado `monitoring`.

- Mantiene la zona horaria del host montando `/etc/localtime`.

## ▶️ ¿Cómo se usa?

1. Ejecuta:

- Para Linux:
```bash
docker-compose up
```

- Para Windows
```bash
docker compose up
```

2. En la salida del terminal (solo la primera vez) verás:

```
Created new site cmk with version 2.3.0p1.cre.
 The admin user for the web applications is cmkadmin with password: <CONTRASEÑA>
```

3. Abre tu navegador en:

   👉 [http://localhost:8080/cmk](http://localhost:8080/cmk)

4. Inicia sesión con:

   * **Usuario:** `cmkadmin`

   * **Contraseña:** (la que aparece en los logs)

## 🔐 ¿Olvidaste la contraseña?

Podés volver a verla con:

```bash
docker logs monitoring
```

O cambiarla así:

```bash
docker exec -it monitoring bash
omd su cmk
cmk-passwd cmkadmin
```

## 🗂️ ¿Qué archivos y directorios se crean?

### ✅ Usados por Docker Compose

* `checkmk_data/`: volumen donde Docker guarda la configuración del sitio Checkmk (`/omd/sites`). **Este directorio es importante y no debe eliminarse.**

## 📦 Persistencia

Los datos del sitio `cmk` se almacenan en el volumen `checkmk_data`, por lo que aunque detengas o reinicies el contenedor, la configuración se conserva.

---


# 🛰️ HTTP Ping - Grupo 7

Este proyecto permite simular un "ping" a un servidor HTTP utilizando Python y un entorno visual mejorado gracias a `pwntools`. Además, se provee un script en Bash que automatiza todo el proceso: iniciar un servidor web, activar el entorno virtual y ejecutar el script principal.

## 📁 Archivos

- `http_ping.py`: script principal que realiza peticiones HTTP periódicas al servidor.

- `runtest.sh`: script Bash que inicia el servidor y ejecuta el ping.

- `requirements.txt`: contiene las dependencias necesarias (por ejemplo, `pwntools`, `requests`).


## 🚀 Requisitos

- Python 3

- `pip`

- Entorno virtual (`venv`) creado en la raíz del proyecto


## ⚙️ Instalación

1. **Cloná o descargá el proyecto.**

2. **Creá y activá un entorno virtual:**

```bash
   python3 -m venv venv
   source venv/bin/activate
```

3. **Instalá las dependencias:**


```bash
   pip install -r requirements.txt
```


## 🧪 Uso

Una vez que el entorno virtual esté configurado e instalado:

```bash
chmod +x runtest.sh
./runtest.sh
```

Este script:

* Muestra un banner decorativo.

* Inicia un servidor HTTP en el puerto `8081`.

* Activa el entorno virtual.

* Ejecuta `http_ping.py` para empezar a enviar peticiones al servidor.


## ❌ Salida segura

Para detener la ejecución, simplemente presioná `Ctrl + C`. Ambos scripts están preparados para manejar la interrupción limpiamente y cerrar los procesos de forma segura.


## 🧠 Notas

* El intervalo entre peticiones HTTP está definido en `http_ping.py` (línea 10). Podés modificarlo si necesitás ajustar la frecuencia de los pings.

* El servidor HTTP sirve el contenido del directorio actual.

