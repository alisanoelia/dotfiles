#!/bin/bash

Clock() {
  TIME=$(date '+%I:%M %p')
  echo "$TIME"
}

Date() {
  DATE=$(date '+%a %d %b, %Y')
  echo "$DATE"
}

Batery() {
  BATERY=$(cat /sys/class/power_supply/BATT/capacity)
  STATUS=$(cat /sys/class/power_supply/BATT/status)
  echo "$BATERY% $STATUS"
}

Title() {
  len=$(echo -n "$(xdotool getwindowfocus getwindowname)" | wc -m)
  max_len=70
  if [ "$len" -gt "$max_len" ];then
    echo -n "$(xdotool getwindowfocus getwindowname | cut -c 1-$max_len)..."
  else
    echo -n "$(xdotool getwindowfocus getwindowname)"
  fi
}

Disco() {
  d=$(df -h | awk '$6 == "/" {print $3}')
  echo "$d"
}

Alsa() {
  alsa_output=$(amixer -c 1 get Master | tail -n1)
  volume=$(echo "$alsa_output" | awk -F'[][]' '{print $2}')
  mute_status=$(amixer -c 1 get Master | grep -o '\[off\]')

  if [ "$mute_status" = "[off]" ]; then
    echo "Mute"
  else
    echo "$volume"
  fi
}

Mayus() {
  caps_lock_status=$(xset q | grep "Caps Lock" | awk '{print $4}')

  if [ "$caps_lock_status" == "on" ]; then
    echo "ON"
  else
    echo "OFF"
  fi

}

Xbps() {
  updates=$(xbps-install -Mun 2> /dev/null | wc -l)

  if [ -n "$updates" ] && [ "$updates" -gt 0 ]; then
    echo "$updates updates"
  else
    echo "0 updates"
  fi
}

Wifi() {
  if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
    echo "Connected"
  else
    echo "Disconnected"
  fi
}

LocalIP() {
  ip_address=$(ip -o -4 address show scope global | awk '{split($4, a, "/"); print a[1]}')
  echo "$ip_address"
}

# Ejecutar Lemonbar con la configuración de colores y posición
while true; do
  echo " %{l} $(Xbps) | $(LocalIP) | $(Wifi) %{c}$(Title) %{r} MAYUS $(Mayus) | VOL $(Alsa) | DISK $(Disco) | BAT $(Batery) | $(Date) $(Clock) "
  sleep 5

  # Actualizar Xbps cada 30 minutos (1800 segundos)
  if [ $(($SECONDS % 1800)) -eq 0 ]; then
    Xbps
  fi
done | lemonbar -p -d -f "Liga SFMono Nerd Font:size=8" -B#191724 -g 1346x18+10+5 &
