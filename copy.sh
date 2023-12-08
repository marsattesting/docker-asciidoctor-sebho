CONF=$(cat /documents/.command/.configuration-asciidoctor)
if [[ "${CONF}" == *"/output"* ]]; then
    echo output
    copy-distinct.sh
fi 
#else
#    echo no output
#    copy-unified.sh
#fi 