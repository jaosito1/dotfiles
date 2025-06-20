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
        local VOLUME=$1
        local LIST=$(pactl list sinks)
        local SINK=""

        if echo "$LIST" | grep -q RUNNING; 
        then
            SINK=$(echo "$LIST" | grep -B1 RUNNING | awk '/Sink #/{print $2;exit}' | tr -d "#")
        elif echo "$LIST" | grep -q SUSPENDED;
        then
            SINK=$(echo "$LIST" | grep -B1 SUSPENDED | awk '/Sink #/{print $2;exit}' | tr -d "#")
        else
            echo "no audio running or suspended :("
            return 1 
        fi
        pactl set-sink-volume $SINK $VOLUME%
        echo "Changed volume to $VOLUME%."
    fi
}


PS1='[\u@\h \W]\$ '

export EDITOR="nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
