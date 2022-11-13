#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

neofetch
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias gacp='git add * && git commit -m "update" && git push origin HEAD'
alias discord='discord --no-sandbox'

#startx on tty1
TTY="$(/usr/bin/tty | sed 's:.*/::')"
if [[ ! ${DISPLAY} && ${TERM} == 'linux' && ${TTY} == 'tty1' ]]; then
  unset TTY
  exec startx
fi
unset TTY
