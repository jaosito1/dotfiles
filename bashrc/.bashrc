#
# ~/.bashrc
#

# If not running interactively, don't do anything 
[[ $- != *i* ]] && return

alias vi='nvim'

alias la='ls -A'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
