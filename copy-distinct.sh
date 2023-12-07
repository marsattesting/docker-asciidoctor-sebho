#!/bin/ash

folders='js css assets'
for folder in $folders; do
  rsync -a --delete /documents/.design/$folder/ /output/$folder/ 
done