#!/bin/bash

# creation des 3 repos
mkdir -p Root/Repo_Devops
mkdir -p Root/Repo_Data
mkdir -p Root/Repo_fonctionnel

repositories="Repo_Devops Repo_Data Repo_fonctionnel"

#repo  = Repo_Devops, Repo_Data, Repo_fonctionnel
#liste = contenue des repos
#element = les fichiers de repo
#liste_2=$(ls -I creation_script_dynamique.sh -I reorganization_script.sh -I Root)

for repo in $repositories
do

liste=$(ls $repo)

    for element in $liste
    do
        prefix=$(echo "$element" | cut -d'_' -f1)
        #echo "prefix : $prefix"

        annee=$(echo "$element" | cut -d'_' -f2 | cut -d'-' -f1)
        #echo "année : $annee"

        mois=$(echo "$element" | cut -d'-' -f2 | cut -d'-' -f1)
        #echo "mois : $mois"

        jour=$(echo "$element" | cut -d'-' -f3 | cut -d'-' -f1)
        #echo "jour : $jour"

        heure=$(echo "$element" | cut -d'-' -f4 | cut -d'-' -f1)
        #echo "heure : $heure"

        minute=$(echo "$element" | cut -d'-' -f5 | cut -d'-' -f1)

        seconde=$(echo "$element" | cut -d'-' -f6 | cut -d'-' -f1)

        milliseconde=$(echo "$element" | cut -d'-' -f7 | cut -d'.' -f1)

        path="Root/$repo/$prefix/$annee/$mois/$jour/$heure"
        mkdir -p "$path"

        new_file="${minute}${seconde}${milliseconde}.dat"
        cp "$repo/$element" "$path/$new_file"

        echo "nom du script : creation_script.sh" >> "$path/$new_file"
        echo "ancien nom : $element" >> "$path/$new_file"
        echo "chemin d'origine : $repo/$element" >> "$path/$new_file"

        chmod 700 "$path/$new_file"

    done

done
