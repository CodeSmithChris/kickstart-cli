<h1> Rudimentary cli-kickstart script </h1>
<h2> Note </h2>
- This script will overwrite various files, you may want to create a backup of them.
- There are several known issues when trying to run this script on Raspian version Buster
- .bashrc will not automatically source. please run `source ~/.bashrc` upon completion

## How to use ##
- Run from inside the /configs/ directory 
- Using `pwd` should return `~/.../configs`
- From within that directory perform the following commands:
- `chmod +x kickstart-cli.sh`
- `sudo ./kickstart-cli.sh`

You'll be met with the initial prompt of Y or N and the script will autocomplete after that.
Once the script completes feel free to delete this repo if desired.

#### Setup Contents ####

| Installed programs | Description |
|--------------------|-------------|
| curl | Used similarly to apt |
| starship | Used for adjusting the appearance of prompt |
| fontconfig | Used along with starship |
| git | Likely already installed, used for version control |
| tldr | Used similarly to the command `man` | 
| autojump | Used for quick movement through directories i.e. `j configs` |
| neofetch | Displays system hardware & OS |
| btop | Displays running programs & system resources |
| vim | Terminal text editor |
| sc | Terminal based spreadsheet |
| bc | Terminal based binary calculator |
| gcc | Terminal compiler for c programs |
| g++ | Terminal compiler for c++ programs |
| default-jdk | Java Development Kit, allows for creation, compiling and running of java source code |

| Other Installed | Description |
|-----------------|-------------|
| Meslo Nerd Fonts | For use with new prompt appearance |
| Directory `~/.fonts/` | created to hold fonts |

| Files altered | Description |
|---------------|-------------|
| .bashrc | Refrences starship to change prompt appearance, adds path to enable autojump |
| .bash_aliases	| Creates file specifically for aliases |
| .bash_functions | Creates file specifically for functions |
| .vimrc | Creates file dictating appearance and funtionality inside vim |
| .config/starship.toml | Creates directory ~/.config/ along with starship file dictating appearance |

---

<h1> Other Contents </h1>

Repo holds config files for the following:
Kitty Terminal Emulator
Neovim

They are *NOT* involved in the kickstart script but feel free to utilize them.
