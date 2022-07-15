#!/bin/bash

ICONS=./tmp/*.svg

for i in $ICONS;
do
  sed -i -E 's/fill="([^"]+)"//g' $i;
done