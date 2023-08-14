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

# Install sc
if ! is_installed sc; then
	echo "Installing sc..."
	sudo apt-get install sc -y
fi

# Install bc
if ! is_installed bc; then
	echo "Installing bc..."
	sudo apt-get install bc -y
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
cat .config/starship.toml > ~/.config/starship.toml

# Creation of .bash_aliases
cat bash/.bash_aliases > ~/.bash_aliases

#Creation of .bash_functions
cat bash/.bash_functions > ~/.bash_functions

# Creation of simple .bashrc
cat bash/.bashrc > ~/.bashrc

# Creation of .vimrc
cat .config/.vimrc > ~/.vimrc

echo "Configuration complete."

exit
