#!/bin/sh

shopt -s dotglob

DOTFILE_SRC=$(realpath "$(dirname "$BASH_SOURCE[0]")")
INSTALL_SCRIPT_NAME="$DOTFILE_SRC/$(basename "${BASH_SOURCE[0]}")"
LINK_LOCATION="$HOME/.config"

ignored_files=("install.sh" ".git" ".gitignore")

for file in "$DOTFILE_SRC"/*; do
    for ignored in "${ignored_files[@]}"; do
        pat="$ignored$"
        if [[ "$file" =~ $pat ]]; then
            echo "[SKIPPING] $file"
            continue 2
        fi
    done

    file_base="$(basename "$file")"
    config_path="$LINK_LOCATION/$file_base"
    if [ -L "$config_path" ]; then
        echo -n ".. skipping symlink "
    elif [ -e "$config_path" ]; then
        echo -n "[ERROR] non symlink config at "
    else
        echo -n "++ creating symlink "
        ln -sf "$DOTFILE_SRC/$file_base" "$config_path"
    fi
    echo "$config_path"
done

echo "done"
