### ALIASES ###
# apt package manager

alias aptup='sudo apt update && sudo apt upgrade'
alias aptupd='sudo apt update'
alias aptupg='sudo apt upgrade'
alias aptin='sudo apt install'
alias aptrm='sudo apt remove'

# flatpaks
alias flatup='flatpak update'

# ls with all flags
alias ls='ls -lh --color=auto'

# mkdir create parents
alias mkdir='mkdir -pv'

# confirmations
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias ln='ln -i'

# navigation
alias bd='cd "$OLDPWD"'

# version control
alias gcommit='git commit -m'
alias hcommit='hg commit -m'
alias gpush='git push'
alias hgpush='hg push'
alias gpull='git pull'
alias hpull='hg pull; hg update'

# ssh
alias Lab46='ssh cburling@lab46.g7n.org'

# misc
alias weather='curl wttr.in'

# edit bash aliases
alias eba='vim ~/.bash_aliases'

