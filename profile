# export PS1="\h:\W \u\$" # default
suits=('\[\033[01;31m\]♦' '\[\033[01;31m\]♥' '\[\033[01;30m\]♣' '\[\033[01;30m\]♠')
export PS1="\[\033[00;47m\] ${suits[RANDOM % 4]} \[\033[00;32m\] \W \[\033[00;34m\]\$(git rev-parse --abbrev-ref HEAD 2>>/dev/null || echo '')\$\[\033[00m\] " 

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=./node_modules/.bin:$PATH
export EDITOR='vim'

# GIT
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"

