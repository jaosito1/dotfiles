#!/usr/bin/env bash

# -- Setup paths
export XDG_CONFIG_HOME=$HOME/.config

ROOTDIR="$(pwd)"
CONFIGDIR="$ROOTDIR/config"
SCRIPTSDIR="$ROOTDIR/scripts"

# -- Config files
pushd "$CONFIGDIR" > /dev/null || exit 1 

for d in *; do 
    if [ -d "$d"  ]; then
        stow "$d" -t "$XDG_CONFIG_HOME" || echo "Failed to stow $d"
    fi
done

popd > /dev/null

# -- Create OMP directory and import layout

OMPDIR="$HOME/.local/share/omp"

mkdir -p "$OMPDIR"
rm -f "$OMPDIR"/*.omp.json

ln -sf "$ROOTDIR/assets/omp-themes/main.omp.json" "$OMPDIR/main.omp.json" 

# -- Import scripts

pushd "$SCRIPTSDIR" > /dev/null || exit 1 

shopt -s nullglob
for s in *.sh; do 
    chmod +x "$s"
done
shopt -u nullglob

popd > /dev/null

if [[ "$ROOTDIR" == "$HOME/dotfiles" ]]; then
    stow scripts -t "$HOME/.local/bin" || echo "Failed to stow scripts"
fi
