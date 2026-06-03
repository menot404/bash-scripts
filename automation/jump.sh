#!/bin/bash

# A simple bash script to move up to a desired directory level

function jump() {

    # Vérifie qu'un argument a été passé
    if [[ -z "$1" ]]; then
        echo "Usage: jump <directory_name>" >&2
        return 1
    fi

    # Sauvegarde et redéfinit IFS pour splitter sur "/"
    local OLDIFS="$IFS"
    IFS=/

    # Convertit le chemin courant en tableau
    # ex: /my/path/is/like/this -> ["", "my", "path", "is", "like", "this"]
    local path_arr=($PWD)

    # Restaure IFS proprement
    IFS="$OLDIFS"

    local pos=-1
    local found=0

    # Itère sur path_arr (nom cohérent)
    for dir in "${path_arr[@]}"; do
        pos=$(( pos + 1 ))            # Fix: syntaxe arithmétique correcte
        if [[ "$1" == "$dir" ]]; then # Fix: espace avant ]]
            found=1
            local dir_in_path=${#path_arr[@]}
            local cwd="$PWD"
            local limit=$(( dir_in_path - pos - 1 ))  # Fix: syntaxe arithmétique

            for (( i = 0; i < limit; i++ )); do
                cwd="$cwd/.."
            done

            cd -P "$cwd"  # -P résout les symlinks et nettoie les ".."
            break
        fi
    done

    # Fix: message d'erreur si cible introuvable
    if [[ $found -eq 0 ]]; then
        echo "jump: '$1' not found in current path" >&2
        return 1
    fi
}