# UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

export BROWSER=brave-browser-nightly
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
 zsh-syntax-highlighting
  zsh-autosuggestions
  z
)

source $ZSH/oh-my-zsh.sh

# Example aliases
alias grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias ls='lsd'
alias la='lsd -a'
alias l='lsd -la'
alias zh='nvim ~/.zshrc'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias rm='sudo rm -rv'
alias addgit='git commit -m'
alias upgit='git push origin main'
alias s='sudo xbps-query -Rs'
alias actualizar='sudo xbps-install -Su'
alias i='sudo xbps-install -S'
alias lg='lazygit'
alias cp='cp -rv'
alias mv='mv -v'
alias mkdir='mkdir -pv'

# Inicio
shfetch
echo "Bienvenido a \033[1;34m$(basename "$SHELL"), \033[1;31m$USER! \n"
