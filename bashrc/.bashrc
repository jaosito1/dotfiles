#
# ~/.bashrc
#

# If not running interactively, don't do anything 
[[ $- != *i* ]] && return

export PATH=$PATH:/home/jos/.local/bin
eval "$(oh-my-posh init bash --config /home/jos/dotfiles/omp-themes/main-arch.omp.json)"

alias vi='nvim'

alias la='ls -A'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
