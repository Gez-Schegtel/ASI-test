#!/bin/bash

trap ctrl_c INT
tput civis

# colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No color

sleep 1

ctrl_c ()
{
    echo -e "\n${RED}[+] SALIENDO...${NC}\n"
    tput cnorm
    # matamos todos los procesos de python
    pkill -f python3
    exit 1
}


banner()
{
echo -e """
'########::'#######::'##::::'##:'####:'########:::'#######:::::::::::::::::'########:
 ##.....::'##.... ##: ##:::: ##:. ##:: ##.... ##:'##.... ##:::::::::::::::: ##..  ##:
 ##::::::: ##:::: ##: ##:::: ##:: ##:: ##:::: ##: ##:::: ##::::::::::::::::..:: ##:::
 ######::: ##:::: ##: ##:::: ##:: ##:: ########:: ##:::: ##::::'#######::::::: ##::::
 ##...:::: ##:'## ##: ##:::: ##:: ##:: ##.....::: ##:::: ##::::........:::::: ##:::::
 ##::::::: ##:.. ##:: ##:::: ##:: ##:: ##:::::::: ##:::: ##:::::::::::::::::: ##:::::
 ########:. ##### ##:. #######::'####: ##::::::::. #######::::::::::::::::::: ##:::::
........:::.....:..:::.......:::....::..::::::::::.......::::::::::::::::::::..::::::
"""

}

# root_check()
# {
#     if [ "$EUID" -ne 0 ]; then
#         echo -e "${RED}[+] Necesitas permisos de root para correr este script${NC}"
#         tput cnorm
#         exit 1
#     fi
# }

start_server()
{
    echo -e "${GREEN}[+] Iniciando servidor en el puerto 8081...${NC}"
    python3 -m http.server 8081 &
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[+] Servidor iniciado con exito${NC}"
        sleep 2
    else
        echo -e "${RED}[+] Error al iniciar el servidor${NC}"
        tput cnorm
        exit 1
    fi
}

activate_venv()
{
    if [ -d "venv" ]; then
        source venv/bin/activate
        echo -e "${GREEN}[+] Entorno virtual activado${NC}"
    else
        echo -e "${RED}[+] No se encontro el entorno virtual${NC}"
        tput cnorm
        exit 1
    fi
}

main()
{
    banner

    # root_check
    start_server
    activate_venv

    sleep 2
    clear
    
    # corremos el programa
    # echo -e "${GREEN}[+] Corriendo el programa...${NC}"
    python3 http_ping.py
    
}

main
tput cnorm
