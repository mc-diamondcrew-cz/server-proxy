#!/bin/bash
declare -a LANGUAGES=(
  ""
)

for lang in "${LANGUAGES[@]}"
do
  echo "Downloading language ${lang}.."
  (cd plugins/"${lang%\/*}" || exit ; curl -O https://raw.githubusercontent.com/mc-diamondcrew-cz/translates/master/"${lang}")
done