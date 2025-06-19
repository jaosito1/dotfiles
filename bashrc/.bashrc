#
# ~/.bashrc
#

# If not running interactively, don't do anything 
[[ $- != *i* ]] && return

export PATH=$PATH:/home/jos/.local/bin
eval "$(oh-my-posh init bash --config ~/dotfiles/omp-themes/main-arch.omp.json)"

alias vi='nvim'
alias la='ls -A'
alias ls='ls --color=auto'

vol ()
{
    if [[ -z "$1" ]]; 
    then
       echo "Please input a number from 1-100." 
       return 1
    else
        if  pactl list sinks | grep -q RUNNING;
        then
            local VOLUME=$1
            local SINK=$(pactl list sinks | grep -B1 RUNNING| 
                \awk '/Sink #/{print $2}' | tr -d "#");
            pactl set-sink-volume $SINK $VOLUME%
            echo "Changed volume to $VOLUME%."
        else
            echo "no audio running :(";
        fi
    fi
}


PS1='[\u@\h \W]\$ '

export EDITOR="nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
