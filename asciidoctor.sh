#!/bin/ash



#if [ -n "$(ls -A /output 2>/dev/null)" ]
#then
#  folders='js css assets'
#  for folder in $folders; do
#    mkdir -p "/output/$folder" && cp /documents/.design/$folder/* /output/$folder/ 
#  done
#else
#  echo "empty (or does not exist)"
#fi
#copy-design.sh
#CONF=$(cat /documents/.command/.configuration-asciidoctor)
#if [[ "${CONF}" == *"/output"* ]]; then
#    echo output
#    copy-distinct.sh
#else
#    echo no output
#    copy-unified.sh
#fi
copy.sh
$(cat /documents/.command/.configuration-asciidoctor)