#!/bin/bash

DIR=src/assets/icons
ICONS=${DIR}/*.svg


cat > example/src/IconList.tsx <<EOF
import { Icon } from '@makyoapp/makyo-icon'
import './IconList.css'
import React from 'react'

export default function IconList() {
  return (
    <div className='icon-list'>
EOF

for i in $ICONS;
do
  FILE=$(basename $i)
  EXT="${FILE##*.}"
  NAME=$(echo "${FILE%.*}" | sed -r 's/(^|-)([a-z])/\U\2/g' | sed 's/-//g')
  echo "      <div className='box'><Icon.${NAME^} /><div className='info'><code>&lt;Icon.${NAME^} /&gt;</code></div></div>"
done >> example/src/IconList.tsx

cat >> example/src/IconList.tsx <<EOF
    </div>
  )
}
EOF
