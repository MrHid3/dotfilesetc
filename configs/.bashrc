#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

neofetch
alias ls='ls --color=auto'
alias discord='discord --no-sandbox'
PS1='[\u@\h \W]\$ '
