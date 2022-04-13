# export PS1="\h:\W \u\$" # default
suits=('♦' '♥' '♣' '♠')
# export PS1="\[${suits[RANDOM % 4]}\] \[$(tput setaf 2)\]\W\[$(tput setaf 4)\]\$(__git_ps1 ' %s')\[$(tput sgr0)\]\n> \[$(tput sgr0)\]"
export PS1="\[${suits[RANDOM % 4]}\] \[$(tput setaf 2)\]\W\n\[$(tput sgr0)\]❯ "

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/sbin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="$PATH:$(pwd)"

export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
export BASH_SILENCE_DEPRECATION_WARNING=1

# https://github.com/beyondgrep/ack2/blob/dev/ConfigDefault.pm
GREP_OPTIONS="--color=auto"
# default
for pattern in .git .svn node_modules; do
    GREP_OPTIONS+=" --exclude-dir=$pattern"
done
GREP_OPTIONS+=" --exclude=\*.swp"
GREP_OPTIONS+=" --exclude=\*.{pdf,jpg,jpeg,png}"
GREP_OPTIONS+=" --exclude=\*.{css,js}.map"
GREP_OPTIONS+=" --exclude=\*.min.{css,js}"
# custom
for pattern in .releases .autopep8 .venv dist; do
    GREP_OPTIONS+=" --exclude-dir=$pattern"
done

alias grep="grep -r $GREP_OPTIONS"

# brew install bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# find / -type f -name "git-completion.bash"
# vim /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
[ -f ~/git-completion.bash ] && . ~/git-completion.bash

arc completion bash > ~/.arc/completion.bash && source ~/.arc/completion.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# append to the history file, don't overwrite it
shopt -s histappend

# Combine multiline commands into one in history
shopt -s cmdhist
