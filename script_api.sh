#!/bin/bash

# URL de l'API JSONPlaceholder pour récupérer les publications
API_URL="https://jsonplaceholder.typicode.com/posts"

# Fichier de journal pour enregistrer les requêtes et les réponses
LOG_FILE="api_jsonplaceholder_log.txt"

# Fonction pour vérifier si curl est installé
check_curl() {
    if ! command -v curl &> /dev/null; then
        echo "Erreur: curl n'est pas installé. Veuillez l'installer pour utiliser ce script."
        exit 1
    fi
}

# Fonction pour envoyer une requête GET à l'API JSONPlaceholder
send_api_request() {
    local url="$1"
    local log="$2"

    # Validation de l'URL
    if [[ ! "$url" =~ ^https?:// ]]; then
        echo "Erreur: URL invalide."
        exit 1
    fi

    # Effectuer la requête GET avec cURL et enregistrer la réponse dans le journal
    if ! curl -s -o "$log" "$url"; then
        echo "Erreur: La requête GET a échoué."
        exit 1
    fi
}

# Vérifier si curl est installé
check_curl

# Appel de la fonction pour envoyer la requête à l'API JSONPlaceholder
send_api_request "$API_URL" "$LOG_FILE"

# Vérification de la réussite de la requête
if [ $? -eq 0 ]; then
    echo "Requête à l'API JSONPlaceholder réussie. Voir le fichier de journal: $LOG_FILE"
else
    echo "Échec de la requête à l'API JSONPlaceholder. Voir le fichier de journal pour les détails."
fi

