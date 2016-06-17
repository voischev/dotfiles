export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=./node_modules/.bin:$PATH
export EDITOR='vim'

# GIT
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"

alias disk="open ~/Yandex.Disk.localized"

# Notes
create_note() {
    vim ~/Yandex.Disk.localized/Notes/$1.txt
}
alias note=create_note

