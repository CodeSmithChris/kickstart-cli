eval "$(starship init bash)"
. /usr/share/autojump/autojump.sh

export PATH=~/bin:.:$PATH
export PATH="/opt/Vircon32/Emulator/:/usr/local/DevTools/:$PATH"

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_functions ] && source ~/.bash_functions
