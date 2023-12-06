#!/bin/ash

# Fonctionne avec entr
#while $(true); do
  # echo ./my_watch_dir | entr -dnr echo "Running trigger..."
#  echo /documents | entr -dnr asciidoctor $@
#done;

while inotifywait -r /documents -e create,delete,modify; do { $(cat /documents/.command/.configuration-asciidoctor); }; done