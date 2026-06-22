#!/bin/sh

DOTFILE_SRC=$(realpath "$(dirname "$BASH_SOURCE[0]")")
INSTALL_SCRIPT_NAME="$DOTFILE_SRC/$(basename "${BASH_SOURCE[0]}")"
LINK_LOCATION="$HOME/.config"

for file in "$DOTFILE_SRC"/*; do
    if [[ "$INSTALL_SCRIPT_NAME" != "$file" ]]; then
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
    fi
done

echo "done"
