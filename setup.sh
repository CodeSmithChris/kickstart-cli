#!/bin/bash

# Function to check if a program is installed
is_installed() {
    command -v "$1" >/dev/null 2>&1
}

# Install curl
if ! is_installed curl; then
    echo "Installing curl..."
    sudo apt-get update
    sudo apt-get install curl -y
fi

# Install starship
if ! is_installed starship; then
    echo "Installing starship..."
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

# Install git
if ! is_installed git; then
    echo "Installing git..."
    sudo apt-get install git -y
fi

# Install tldr
if ! is_installed tldr; then
    echo "Installing tldr..."
    sudo apt-get install tldr -y
	echo "tldr -u"
fi

# Install autojump
if ! is_installed autojump; then
    echo "Installing autojump..."
    sudo apt-get install autojump -y
fi

# Install neofetch
if ! is_installed neofetch; then
	echo "Installing neofetch..."
	sudo apt-get install neofetch -y
fi

# Install btop
if ! is_installed btop; then
	echo "Installing btop..."
	sudo apt-get install btop -y
fi

# Install vim
if ! is_installed vim; then
	echo "Installing vim..."
	sudo apt-get install vim -y
fi

# Create ~/.fonts directory if it doesn't exist
if [ ! -d "$HOME/.fonts" ]; then
    echo "Creating ~/.fonts directory..."
    mkdir -p "$HOME/.fonts"
fi

# Download and install Meslo fonts
if [ ! -f "$HOME/.fonts/MesloLGSDZ-Regular.ttf" ]; then
    echo "Installing Meslo fonts..."
    curl -o "$HOME/.fonts/MesloLGSDZ-Regular.ttf" -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
    curl -o "$HOME/.fonts/MesloLGSDZ-Bold.ttf" -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
    curl -o "$HOME/.fonts/MesloLGSDZ-Italic.ttf" -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
    curl -o "$HOME/.fonts/MesloLGSDZ-BoldItalic.ttf" -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

    # Refresh font cache
    fc-cache -f -v
fi

echo "Installations complete"

# Setup of configurations
echo "Beginning configurations"

# Create ~/.config directory if it doesn't exist
create_config_directory



# Creation of starship.toml
echo 'format = """
[](#3B4252)\
$username\
[](bg:#434C5E fg:#3B4252)\
$directory\
[](fg:#434C5E bg:#4C566A)\
$git_branch\
$git_status\
[](fg:#4C566A bg:#86BBD8)\
$c\
$elixir\
$elm\
$golang\
$haskell\
$java\
$julia\
$nodejs\
$nim\
$rust\
[](fg:#86BBD8 bg:#06969A)\
$docker_context\
[](fg:#06969A bg:#33658A)\
$time\
[ ](fg:#33658A)\
"""
command_timeout = 5000
# Disable the blank line at the start of the prompt
# add_newline = false

# You can also replace your username with a neat symbol like  to save some space
[username]
show_always = true
style_user = "bg:#3B4252"
style_root = "bg:#3B4252"
format = '[$user ]($style)'

[directory]
style = "bg:#434C5E"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

# Here is how you can shorten some long paths by text replacement
# similar to mapped_locations in Oh My Posh:
[directory.substitutions]
"Documents" = " "
"Downloads" = " "
"Music" = " "
"Pictures" = " "
# Keep in mind that the order matters. For example:
# "Important Documents" = "  "
# will not be replaced, because "Documents" was already substituted before.
# So either put "Important Documents" before "Documents" or use the substituted version:
# "Important  " = "  "

[c]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[docker_context]
symbol = " "
style = "bg:#06969A"
format = '[ $symbol $context ]($style) $path'

[elixir]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[elm]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[git_branch]
symbol = ""
style = "bg:#4C566A"
format = '[ $symbol $branch ]($style)'

[git_status]
style = "bg:#4C566A"
format = '[$all_status$ahead_behind ]($style)'

[golang]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[haskell]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[java]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[julia]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[nodejs]
symbol = ""
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[nim]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[rust]
symbol = ""
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[time]
disabled = false
time_format = "%R" # Hour:Minute Format
style = "bg:#33658A"
format = '[ $time ]($style)'' > ~/.config/starship.toml

# Creation of .bash_aliases
echo "### ALIASES ###
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

# edit bashrc
alias ebrc='vim ~/.bashrc'" > ~/.bash_aliases

#Creation of .bash_functions
functions=$(cat <<'EOF'
# Goes up a specified number of directories (i.e. up 4)

up ()
{
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# Extracts any archive(s)
extract () {
	for archive in "$@"; do
		if [ -f "$archive" ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}
EOF
)
echo "$functions" > ~/.bash_functions

# Creation of simple .bashrc
echo "eval "$(starship init bash)"
. /usr/share/autojump/autojump.sh

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_functions ] && source ~/.bash_functions" > ~/.bashrc

# Creation of .vimrc
echo ":set numbers
:set cursorline
:set tabstop=4
:set shiftwidth=4
:syntax on" > ~/.vimrc

echo "Configuration complete."

exit
