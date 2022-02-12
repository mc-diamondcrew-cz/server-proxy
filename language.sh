#!/bin/bash
declare -A LANGUAGES=(
  []=
)

for lang in "${!LANGUAGES[@]}"
do
  echo "Downloading language ${LANGUAGES[$lang]}.."
  (cd "${lang//./}" || return ; curl -O "${LANGUAGES[$lang]}")
done