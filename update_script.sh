#!/bin/bash

# Vérification des privilèges
if [ "$(id -u)" -ne 0 ]; then
    echo "Erreur: Ce script doit être exécuté avec des privilèges. Utilisez sudo pour l'exécuter."
    exit 1
fi

# Fonction pour vérifier et mettre à jour les logiciels
check_update() {
    echo "Recherche des mises à jour disponibles..."
    if apt update > /dev/null 2>&1; then
        echo "Mises à jour disponibles."
        read -rp "Voulez-vous procéder à la mise à jour des logiciels ? (O/n) " choice
        case "$choice" in
            [oO]|[yY]|"")
                echo "Mise à jour en cours..."
                if ! apt upgrade -y; then
                    echo "Erreur: La mise à jour des logiciels a échoué."
                    exit 1
                else
                    echo "Mise à jour réussie."
                fi
                ;;
            [nN])
                echo "Mise à jour annulée."
                ;;
            *)
                echo "Choix invalide. Mise à jour annulée."
                ;;
        esac
    else
        echo "Impossible de vérifier les mises à jour."
        exit 1
    fi
}

# Exécuter la fonction de vérification et de mise à jour des logiciels
check_update
