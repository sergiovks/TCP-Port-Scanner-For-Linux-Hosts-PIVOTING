#!/bin/bash

function ctrl_c(){
        echo -e "\n\n[!] Saliendo...\n"
        tput cnorm; exit 1
}

# Ctrl+C

trap ctrl_c INT

tput civis

# Change the IP address for the IP that you want to scan to pivot

for i in $(seq 1 65535); do
        timeout 1 bash -c "echo '' > /dev/tcp/10.10.0.128/$port" 2>/dev/null && echo "[+] El puerto $port esta abierto" &
done; wait

tput cnorm

