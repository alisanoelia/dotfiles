#!/bin/sh -e
#
printf "Holaaaa, $USER \n"
printf "... \n"
sleep 0.5
printf "Actualizaremos el sistema\n"
sudo xbps-install -Sy

printf "Sistema actualizado \n"
printf "Se instalaran los paquetes minimos y necesarios para sowm y bspwm \n"
sleep 0.2
printf "... \n"
sudo xbps-install -y \
  make \
  gcc \
  git \
  xorg-server \
  neovim \
  zsh \
  libXft-devel \
  libX11-devel \
  harfbuzz-devel \
  xf86-video-ati \
  xf86-input-libinput \
  bspwm \
  sxhkd \
  polybar \
  hsetroot \
  ranger \
  sx \
  xauth \
  unzip \
  lazygit \
  lsd \
  bat \
  bottom \
  zellig \
  mesa-dri \
  wpa_supplicant \
  dhcpcd \

printf "Vamos bien, ten paciencia ... \n"

# Funetes
#
printf "Vamos por la fuente\n"

fonts_dir="$HOME/.fonts"

if [ -d "$fonts_dir" ]; then
  printf "La carpeta de fuentes ya existe.\n"

  # Verificar si las fuentes ya están instaladas
  if find "$fonts_dir" -name "Symbols*.ttf" -print -quit | grep -q . && find "$fonts_dir" -name "JetBrainsMono*.ttf" -print -quit | grep -q .; then
    printf "Las fuentes ya están instaladas.\n"
  else
    cd "$fonts_dir"

    # Descargar las fuentes
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/NerdFontsSymbolsOnly.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/JetBrainsMono.zip

    # Descomprimir las fuentes
    unzip -o "*.zip"

    # Eliminar los archivos ZIP
    rm -fv "*.zip"

    printf "Las fuentes se han descargado e instalado correctamente.\n"
  fi
else
  mkdir -pv "$fonts_dir"
  printf "Se ha creado la carpeta para las fuentes.\n"
fi

printf "Inicio \n"

sxrc_file="$HOME/.config/sx/.sxrc"

if [ -e "$sxrc_file" ]; then
  printf "El archivo ya existe.\n"
else
  touch "$sxrc_file"
  chmod +x "$sxrc_file"
  printf "Se ha creado el archivo correctamente.\n"
fi

if grep -q "exec bspwm" "$sxrc_file"; then
  printf "La línea ya existe.\n"
else
  echo "exec bspwm" >> "$sxrc_file"
  printf "La línea se ha agregado correctamente.\n"
fi

sxrc_file="$HOME/.config/sx/sxrc"
shortcut_file="$HOME/sxrc"

# Verificar si el enlace simbólico ya existe
if [ -L "$shortcut_file" ]; then
  printf "El acceso directo ya existe.\n"
else
  # Crear el enlace simbólico
  ln -s "$sxrc_file" "$shortcut_file"
  printf "Se ha creado el acceso directo correctamente.\n"
fi

# carpetas
config_dir="$HOME/.config"
dotfiles="$HOME/dotfiles"
if [ -d "$config_dir" ]; then
  printf "La carpeta ya existe"
else
  mkdir -v "$config_dir"
  printf "Se ha creado, se copiaran los archivos"
fi

cp -rv "$dotfiles/bspwm" "$config_dir"
cp -rv "$dotfiles/sxhkd" "$config_dir"
cp -rv "$dotfiles/nvim" "$config_dir"
cp -rv "$dotfiles/neofetch" "$config_dir"
cp -rv "$dotfiles/.zshrc" "$HOME"
cp -rv "$dotfiles/polybar" "$config_dir"
cp -rv "$dotfiles/rofi" "$config_dir"


shfetch_dir="$HOME/shfetch"
if [ -d "$shfetch_dir" ]; then
  rm -rfv "$shfetch_dir"
else
  printf "no existe shfetch \n"
  cd "$HOME"
  git clone https://github.com/alisanoelia/shfetch
  cd "$shfetch_dir"
  sudo make install
  printf  "Se ha instalado shfetch\n"
fi

printf "Ha finalizado la instalacion ...\n"
sleep 2.0
exit
