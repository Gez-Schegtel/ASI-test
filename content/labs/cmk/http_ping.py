from pwn import *
import time
import sys
import requests
import signal

url='http://localhost:8081'

# aqui puedes ajustar el intervalo de tiempo entre las peticiones
interval=0.02


def signal_handler(sig, frame):
    # print("\nSaliendo...")
    p1.failure("Saliendo...")
    p2.failure("INTERRUPT")

    sys.exit(1)

# esto es para cuando hace una interrupcion
signal.signal(signal.SIGINT, signal_handler)


def main():
    
    global p1 
    global p2
    
    p1 = log.progress("HTTP Ping - Grupo 7")
    p2 = log.progress("Pinging a %s" % url)


    while True:
        try:
            response = requests.get(url)
            # print(f"Codigo de estado: {response.status_code}")

            p2.status("Codigo de estado: %s" % response.status_code)


            time.sleep(interval)

        except requests.exceptions.RequestException as e:

            # en caso de que ocurra un error, lo imprime y sale del bucle
            # print(f"Error: {e}")
            p2.failure("Error: %s" % e)            
            break


if __name__ == "__main__":
    main()
