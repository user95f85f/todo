#!/bin/bash

if [ "$(uname -o)" = 'Cygwin' ]; then #we're on Windows
  scour_location="/cygdrive/c/Users"
  echo Here are the d2s files in "$scour_location"
  find "$scour_location" -type f -iname '*.d2s'
  echo So which character data save to you want to use/target?
  echo Copy and paste the full path
  read -p '? ' my_target_d2s_file
  if [ -f "$my_target_d2s_file" ]; then
    my_target_d2s_file="$(echo -n "$my_target_d2s_file" | perl -ne 'chomp;print;exit' )"
    echo -n "$my_target_d2s_file" > /etc/diablo-2-tools/selected_char.conf
    echo '/etc/diablo-2-tools/selected_char.conf updated'
    echo "it is now currently set to $(</etc/diablo-2-tools/selected_char.conf)"
    echo "next time you can set the selected Character/Toon/d2s-file-location by going:"
    echo "echo -n '$(</etc/diablo-2-tools/selected_char.conf)' > /etc/diablo-2-tools/selected_char.conf"
  else
    echo 'that d2s file does not exist. exiting.'
  fi
else #we're on Linux
  wine_config_location=
  if [ -z "$WINEPREFIX" ]; then
    wine_config_location=~/.wine
  else
    wine_config_location="$WINEPREFIX"
  fi

  scour_location="$wine_config_location/drive_c/users"
  echo Here are the d2s files in "$scour_location"
  find "$scour_location" -type f -iname '*.d2s'
  echo So which character data save to you want to use/target?
  echo Copy and paste the full path
  read -p '? ' my_target_d2s_file
  if [ -f "$my_target_d2s_file" ]; then
    my_target_d2s_file="$(echo -n "$my_target_d2s_file" | perl -ne 'chomp;print;exit' )"
    echo -n "$my_target_d2s_file" > /etc/diablo-2-tools/selected_char.conf
    echo '/etc/diablo-2-tools/selected_char.conf updated'
    echo "it is now currently set to $(</etc/diablo-2-tools/selected_char.conf)"
    echo "next time you can set the selected Character/Toon/d2s-file-location by going:"
    #TODO: needs testing
    echo "echo -n '$(</etc/diablo-2-tools/selected_char.conf)' > /etc/diablo-2-tools/selected_char.conf"
  else
    echo 'that d2s file does not exist. exiting.'
  fi
fi

