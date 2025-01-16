export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="alyssa"

# export BROWSER=min
export VISUAL=nvim
export EDITOR=nvim
export PATH="$HOME/bin:$PATH"
export RUST_BACKTRACE=full
export ANDROID_HOME=$HOME/Android/Sdk
export TERM=xterm-256color
export GEMINI_API_KEY="AIzaSyBn0eamrukK7CTE1s_Q4OXDIPTUCmP5qwU"

eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/alyssa > /dev/null 2>&1

plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  z
)

source $ZSH/oh-my-zsh.sh

alias grub='doas grub-mkconfig -o /boot/grub/grub.cfg'
alias ls='lsd'
alias la='lsd -la'
alias zh='nvim ~/.zshrc'
alias reboot='doas reboot'
alias poweroff='doas poweroff'
alias rm='doas rm -rv'
alias commit='git commit -m'
alias push='git push origin main'
alias s='doas xbps-query -Rs'
alias i='doas xbps-install -S'
alias r='doas xbps-remove -R'
alias update='doas xbps-install -Su'
alias lg='lazygit'
alias cp='cp -rv'
alias mv='mv -v'
alias vim='nvim'
alias mk='doas make clean install'
alias bat='bat --theme=base16'
alias notas='nvim ~/notas'

# pnpm
export PNPM_HOME="/home/asha/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# bun completions
[ -s "/home/asha/.bun/_bun" ] && source "/home/asha/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

echo '\e[5 q'
