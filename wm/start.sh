[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xsetroot -cursor_name left_ptr
feh --bg-scale /home/epifiano/Imagenes/Wallpapers/pollina.jpg
picom &
exec ~/.config/polybar/launch.sh &
