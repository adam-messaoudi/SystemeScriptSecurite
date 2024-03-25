#!/bin/bash

# Répertoire parent où se trouve le répertoire Plateforme
parent_directory="$HOME/Documents/SystemeScriptSecurite"

# Répertoire source à sauvegarder
source_directory="$parent_directory/Plateforme"

# Répertoire de sauvegarde
backup_directory="$parent_directory/backup_plateforme"

# Nom du fichier d'historique
log_file="$backup_directory/historique_sauvegardes.txt"

# Fonction pour sauvegarder le répertoire et mettre à jour l'historique
function sauvegarder {
    # Créer le répertoire de sauvegarde s'il n'existe pas
    mkdir -p "$backup_directory" || { echo "Erreur : Impossible de créer le répertoire de sauvegarde."; exit 1; }

    # Nom du répertoire de sauvegarde avec timestamp
    backup_folder="$backup_directory/$(date +'%Y-%m-%d_%H-%M-%S')"

    # Copier le contenu du répertoire source vers le répertoire de sauvegarde
    cp -r "$source_directory" "$backup_folder" || { echo "Erreur : Impossible de copier les fichiers vers le répertoire de sauvegarde."; exit 1; }

    # Enregistrer l'opération dans l'historique
    echo "$(date +'%Y-%m-%d %H:%M:%S') : Sauvegarde effectuée dans $backup_folder" >> "$log_file" || { echo "Erreur : Impossible d'enregistrer l'opération dans l'historique."; exit 1; }
}

# Exécuter la sauvegarde
sauvegarder
