#!/bin/ash

# Fonctionne avec entr
#while $(true); do
  # echo ./my_watch_dir | entr -dnr echo "Running trigger..."
#  echo /documents | entr -dnr asciidoctor $@
#done;

while inotifywait -r /documents -e create,delete,modify; do 
{
  #CONF=$(cat /documents/.command/.configuration-asciidoctor)
  #if [[ "${CONF}" == *"/output"* ]]; then
  #    echo output
  #    copy-distinct.sh
  #else
  #    echo no output
  #    copy-unified.sh
  #fi
  copy.sh
  $(cat /documents/.command/.configuration-asciidoctor);
}; 
done