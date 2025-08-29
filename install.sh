#!/usr/bin/env bash

# -- check if script is in dotfiles dir
root_dir="$(pwd)"

is_root=$(basename "$root_dir")
if [[ "$is_root" != "dotfiles" ]]; then
    echo "Please run the install script form the dotfiles directory directly ^^"
    exit 0
fi

# -- create dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

touch $XDG_CACHE_HOME/wget-hsts
mkdir -p $XDG_CONFIG_HOME/zsh
mkdir -p $XDG_CONFIG_HOME/shell
mkdir -p $XDG_DATA_HOME/gnupg

ln -sf $root_dir/zsh/zprofile $HOME/.zprofile
ln -sf $root_dir/zsh/zshrc $XDG_CONFIG_HOME/zsh/.zshrc
ln -sf $root_dir/zsh/aliasrc $XDG_CONFIG_HOME/shell/aliasrc
echo "Symlinked all zsh files"

# -- import scripts
scripts_dir="$root_dir/scripts"
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
fi

# -- stow config files
stow config/ --target="$XDG_CONFIG_HOME" || exit 1
echo "Symlinked all config files to $XDG_CONFIG_HOME"
exit 0
