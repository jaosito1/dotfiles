#
# ~/.bashrc
#

# If not running interactively, don't do anything 
[[ $- != *i* ]] && return

export PATH=$PATH:/home/jos/.local/bin
eval "$(oh-my-posh init bash --config ~/dotfiles/omp-themes/main-arch.omp.json)"

# Setup aliases

alias vi='nvim'
alias la='ls -A'
alias ls='ls --color=auto'
alias bt='bluetui'

# Import scripts
if [ -f "$HOME/dotfiles/scripts/volume.sh" ]; then
    . "$HOME/dotfiles/scripts/volume.sh"
fi

PS1='[\u@\h \W]\$ '

export EDITOR="nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
