#!/bin/bash

# Fonction pour installer un paquet s'il n'est pas déjà installé
install_if_not_exists() {
   if ! dpkg -l | grep -q "^ii.*$1"; then
      sudo apt-get install -y "$1"
   else
      echo "Le paquet $1 est déjà installé."
   fi
}

# Mise à jour de la liste des paquets disponibles
if ! sudo apt-get update; then
    echo "Erreur lors de la mise à jour de la liste des paquets. Veuillez vérifier votre connexion Internet."
    exit 1
fi

# Installer Apache ou Nginx (choix de l'utilisateur)
read -p "Choisissez votre serveur Web (1 pour Apache, 2 pour Nginx): " server_choice

case "$server_choice" in
    1)
        install_if_not_exists apache2
        ;;
    2)
        install_if_not_exists nginx
        ;;
    *)
        echo "Choix invalide. Installation d'Apache par défaut."
        install_if_not_exists apache2
        ;;
esac

# Installer phpMyAdmin
install_if_not_exists phpmyadmin

# Installer MySQL ou MariaDB (choix de l'utilisateur)
read -p "Choisissez votre système de gestion de base de données (1 pour MySQL, 2 pour MariaDB): " db_choice

case "$db_choice" in
    1)
        install_if_not_exists mysql-server
        ;;
    2)
        install_if_not_exists mariadb-server
        ;;
    *)
        echo "Choix invalide. Installation de MySQL par défaut."
        install_if_not_exists mysql-server
        ;;
esac

# Installer Node.js avec npm
install_if_not_exists nodejs
install_if_not_exists npm

# Installer git
install_if_not_exists git

echo "Installation des dépendances terminée."
