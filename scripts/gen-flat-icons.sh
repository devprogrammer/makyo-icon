#!/bin/bash

DIR=src/assets/color-icons/flat
ICONS=${DIR}/*.svg

for i in $ICONS;
do
  FILE=$(basename $i)
  EXT="${FILE##*.}"
  NAME=$(echo "${FILE%.*}" | sed -r 's/(^|[-_])([a-z])/\U\2/g' | sed 's/[-_]//g')
  echo "export { ReactComponent as ${NAME^} } from 'assets/color-icons/flat/$FILE'"
done > src/FlatIcon.tsx