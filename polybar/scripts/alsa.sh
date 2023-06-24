#!/bin/bash

# Obtener el estado de silencio y nivel de volumen de la tarjeta 1 de Alsa
alsa_output=$(amixer -c 1 get Master | tail -n1)
volume=$(echo "$alsa_output" | awk -F'[][]' '{print $2}')
mute_status=$(amixer -c 1 get Master | grep -o '\[off\]')

# Comprobar si está en modo silencio
if [[ $mute_status == "[off]" ]]; then
  echo " Mute"
else
  echo " $volume"
fi
