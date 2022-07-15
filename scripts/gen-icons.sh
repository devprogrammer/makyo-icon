#!/bin/bash

DIR=src/assets/icons
ICONS=${DIR}/*.svg


for i in $ICONS;
do
  FILE=$(basename $i)
  EXT="${FILE##*.}"
  NAME=$(echo "${FILE%.*}" | sed -r 's/(^|-)([a-z])/\U\2/g' | sed 's/-//g')
  echo "export { ReactComponent as ${NAME^} } from 'assets/icons/$FILE'"
done > src/Icon.tsx