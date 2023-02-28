#!/bin/bash

function ctrl_c(){
        echo -e "\n\n[!] Leaving...\n"
        tput cnorm; exit 1
}

# Ctrl+C
trap ctrl_c INT
tput civis

read -p "Enter the IP address that you want to scan: " ip

for port in $(seq 1 65535); do
        timeout 1 bash -c "echo '' > /dev/tcp/$ip/$port" 2>/dev/null && echo "[+] The TCP port $port is OPEN" &
done; wait

tput cnorm

for port in $(seq 1 65535); do
        timeout 1 bash -c "echo '' > /dev/udp/$ip/$port" &>/dev/null && echo "[+] The UDP port $port is OPEN" &
done; wait

tput cnorm
