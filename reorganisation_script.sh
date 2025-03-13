#!/bin/bash

# creation des 3 repos
mkdir -p Root/Repo_Devops
mkdir -p Root/Repo_Data
mkdir -p Root/Repo_fonctionnel

#parcourir le repo Repo_Devops
liste=$(ls Repo_Devops)

for element in $liste
do
        #parcourir les element et tirer les noms des dossiers

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
        #
        milliseconde=$(echo "$element" | cut -d'-' -f7 | cut -d'.' -f1)

        #creation des nouveaux dossiers
        path="Root/Repo_Devops/$prefix/$annee/$mois/$jour/$heure"
        mkdir -p "$path"

        #renommer les nouveaux fichier
        new_file="${minute}${seconde}${milliseconde}.dat"

        #copier les nouveaux fichiers dans leur nouvelle destination
        cp "Repo_Devops/$element" "$path/$new_file"

        #modifier le contenu des fichiers
        echo "nom du script : creation_script.sh" >> "$path/$new_file"
        echo "ancien nom : $element" >> "$path/$new_file"
        echo "chemin d'origine : Repo_Devops/$element" >> "$path/$new_file"

        #modifier les droit de lecture sur les fichiers
        sudo chmod 700 "$path/$new_file"
done


liste=$(ls Repo_Data)

for element in $liste
do
        prefix=$(echo "$element" | cut -d'_' -f1)
        #echo "prefix : $prefix"
        #
        annee=$(echo "$element" | cut -d'_' -f2 | cut -d'-' -f1)
        #echo "année : $annee"
        #
        mois=$(echo "$element" | cut -d'-' -f2 | cut -d'-' -f1)
        #echo "mois : $mois"

        jour=$(echo "$element" | cut -d'-' -f3 | cut -d'-' -f1)
        #echo "jour : $jour"

        heure=$(echo "$element" | cut -d'-' -f4 | cut -d'-' -f1)
        #echo "heure : $heure"

        minute=$(echo "$element" | cut -d'-' -f5 | cut -d'-' -f1)

        seconde=$(echo "$element" | cut -d'-' -f6 | cut -d'-' -f1)
        #
        milliseconde=$(echo "$element" | cut -d'-' -f7 | cut -d'.' -f1)

        path="Root/Repo_Data/$prefix/$annee/$mois/$jour/$heure"
        mkdir -p "$path"

        new_file="${minute}${seconde}${milliseconde}.dat"
        cp "Repo_Data/$element" "$path/$new_file"

        echo "nom du script : creation_script.sh" >> "$path/$new_file"
        echo "ancien nom : $element" >> "$path/$new_file"
        echo "chemin d'origine : Repo_Data/$element" >> "$path/$new_file"

        sudo chmod 700 "$path/$new_file"

done


liste=$(ls Repo_fonctionnel)

for element in $liste
do
        prefix=$(echo "$element" | cut -d'_' -f1)
        #echo "prefix : $prefix"
        #
        annee=$(echo "$element" | cut -d'_' -f2 | cut -d'-' -f1)
        #echo "année : $annee"
        #
        mois=$(echo "$element" | cut -d'-' -f2 | cut -d'-' -f1)
        #echo "mois : $mois"

        jour=$(echo "$element" | cut -d'-' -f3 | cut -d'-' -f1)
        #echo "jour : $jour"

        heure=$(echo "$element" | cut -d'-' -f4 | cut -d'-' -f1)
        #echo "heure : $heure"

        minute=$(echo "$element" | cut -d'-' -f5 | cut -d'-' -f1)

        seconde=$(echo "$element" | cut -d'-' -f6 | cut -d'-' -f1)
        #
        milliseconde=$(echo "$element" | cut -d'-' -f7 | cut -d'.' -f1)

        path="Root/Repo_fonctionnel/$prefix/$annee/$mois/$jour/$heure"
        mkdir -p "$path"

        new_file="${minute}${seconde}${milliseconde}.dat"
        cp "Repo_fonctionnel/$element" "$path/$new_file"

        echo "nom du script : creation_script.sh" >> "$path/$new_file"
        echo "ancien nom : $element" >> "$path/$new_file"
        echo "chemin d'origine : Repo_fonctionnel/$element" >> "$path/$new_file"

        sudo chmod 700 "$path/$new_file"

done
