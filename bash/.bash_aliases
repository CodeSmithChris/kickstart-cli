### ALIASES ###
# apt package manager

alias aptup='sudo apt update && sudo apt upgrade'
alias aptupd='sudo apt update'
alias aptupg='sudo apt upgrade'
alias aptin='sudo apt install'
alias aptrm='sudo apt remove'

# ls with all flags
alias ls='ls -lAh --color=auto'

# mkdir create parents
alias mkdir='mkdir -pv'

# confirmations
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias ln='ln -i'

# audio
alias playwav='rhythembox *.wav'
alias playmp3='rhythembox *.mp3'

# video
alias playavi='vlc *.avi'
alias playmov='vlc *.mov'
alias playmp4='vlc *.mp4'

# navigation
alias bd='cd "$OLDPWD"'

# edit bash aliases
alias eba='vim ~/.bash_aliases'

