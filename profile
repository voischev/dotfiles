# export PS1="\h:\W \u\$" # default
suits=('♦' '♥' '♣' '♠')
export PS1="\[${suits[RANDOM % 4]}\] \[$(tput setaf 2)\]\W \[$(tput setaf 4)\]\$(git rev-parse --abbrev-ref HEAD 2>>/dev/null || echo '')\[$(tput sgr0)\]\n\$ \[$(tput sgr0)\]"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/sbin:$PATH"
export PATH="./node_modules/.bin:$PATH"

export EDITOR="vim"
export WATCH_BUILDER="0"

if [ -f $(brew --prefix)/etc/bash_completion  ]; then
    . $(brew --prefix)/etc/bash_completion
fi

