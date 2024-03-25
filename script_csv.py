#!/usr/bin/env python3

import csv
import os

data = [
    ["Jean", "25 ans", "Paris"],
    ["Marie", "30 ans", "Lyon"],
    ["Pierre", "22 ans", "Marseille"],
    ["Sophie", "35 ans", "Toulouse"]
]

file_path = 'personnes.csv'

try:
    # Vérifier si le fichier existe déjà
    if os.path.isfile(file_path):
        print("Le fichier existe déjà. Le fichier ne sera pas écrasé.")
    else:
        with open(file_path, mode='w', newline='') as file:
            writer = csv.writer(file)
            writer.writerows(data)
            print("Création du fichier CSV réussie.")

except Exception as e:
    print("Une erreur s'est produite lors de la création du fichier CSV:", str(e))

