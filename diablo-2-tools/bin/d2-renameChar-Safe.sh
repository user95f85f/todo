#!/bin/bash

function die {
  echo "$1"
  exit 1
}

if [ -z "$2" -o -z "$1" ] ; then
  die 'd2-renameChar-Safe.sh MyOldName MyNewName'
fi

d2s_location="$(</etc/diablo-2-tools/selected_char.conf)"

if [ ! -f "$d2s_location" ] ; then
  die 'ERROR: your toon does not seem to exist.'
fi

cd /usr/local/share/diablo-2-tools || die 'ERROR: could not CD to /usr/local/share/diablo-2-tools'
perl rename-toon.pl "$1" "$2" || die 'rename-toon.pl FAILED'
echo 'you will need to update /etc/diablo-2-tools/selected_char.conf as necessary with d2-selectToonChar-Safe.sh'
