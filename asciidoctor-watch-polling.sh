#!/bin/ash

# Fonctionne avec entr
#while $(true); do
  # echo ./my_watch_dir | entr -dnr echo "Running trigger..."
#  echo /documents | entr -dnr asciidoctor $@
#done;

mini-watcher -r /documents -s /documents/.command/.configuration-asciidoctor