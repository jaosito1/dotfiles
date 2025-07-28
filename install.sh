#!/usr/bin/env bash

# -- Setup paths
export XDG_CONFIG_HOME=$HOME/.config

root_dir="$(pwd)"
scripts_dir="$root_dir/scripts"

is_root=$(basename "$root_dir")
if [[ "$is_root" != "dotfiles" ]]; then
    echo "Please run the install script form the wsl directory directly ^^"
    exit 0
fi

# -- Config files
stow config/ --target="$XDG_CONFIG_HOME" || exit 1
echo "Symlinked all config files to $XDG_CONFIG_HOME"

# -- Create OMP directory and import layout
omp_dir="$HOME/.local/share/omp"
mkdir -p "$omp_dir"
rm -f "$omp_dir"/*.omp.json

ln -sf "$root_dir/assets/omp-themes/main.omp.json" "$omp_dir/main.omp.json" 
echo "Created OMP directory at $omp_dir"

# -- Import scripts
pushd "$scripts_dir" > /dev/null || exit 1 

shopt -s nullglob
for s in *; do 
    if [[ "$s" == *.sh ]]; then
        echo "$s was not imported, please verify your scripts."
        exit 0
    fi
    chmod +x "$s"
done
shopt -u nullglob

popd > /dev/null


curr_dir=$(basename $(pwd))
if [[ "$(basename $(pwd))" == "dotfiles" ]]; then
    stow scripts -t "$HOME/.local/bin" || echo "Failed to stow scripts"
    echo "All scripts were stored succesfully."
    exit 0
fi

