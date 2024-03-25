#!/bin/bash

# Fonction pour surveiller l'utilisation du CPU
monitor_cpu() {
    echo "Timestamp,CPU Usage (%)"
    while true; do
        echo "$(date +"%Y-%m-%d %H:%M:%S"),$(top -bn1 | awk '/Cpu\(s\)/{print $2}')"
        sleep 1
    done
}

# Fonction pour surveiller l'utilisation de la mémoire
monitor_memory() {
    echo "Timestamp,Memory Usage (%)"
    while true; do
        echo "$(date +"%Y-%m-%d %H:%M:%S"),$(free | awk '/Mem/{printf "%.2f", $3/$2 * 100}')"
        sleep 1
    done
}

# Gestion des exceptions
set -e

# Exécuter les fonctions de surveillance
monitor_cpu &
monitor_memory &

# Attendre la fin des processus enfants avant de quitter
wait
