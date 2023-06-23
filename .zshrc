export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export BROWSER=min
export VISUAL=nvim
export EDITO=nvim

export PATH="$HOME/.config/bin:$PATH"

export RUST_BACKTRACE=full

f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/alyssa > /dev/null 2>&1

plugins=(
 zsh-syntax-highlighting
  zsh-autosuggestions
  z
)

source $ZSH/oh-my-zsh.sh

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
alias ht='btm'
alias r='sudo xbps-remove -R'
alias w3m="w3m -o ext_image_viewer=1"
alias feh='feh -B white'
alias nv='nvim'

shfetch
echo "Bienvenido a \033[1;34m$(basename "$SHELL"), \033[1;31m$USER! \n"


eval "$(starship init zsh)"
