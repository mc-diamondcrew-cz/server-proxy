#!/bin/bash
file=$(cat variables.txt)
declare -A VARIABLES="$file"

# Replaces all occurrences of $1 with $2 in all files and subdirectories.
# File extensions: .yml, .toml
replaceAll() {
  echo "Replacing $1 with $2."
  grep -irl --include=\*.yml --include=\*.toml "$1" ./ | xargs sed -i "s/$1/$2/"
}

type="$1"
if [ -z "$type" ]; then
    echo "Type cannot be null! Use \"start\" or \"stop\"."
elif [ "$type" == "start" ]; then
    for variable in "${!VARIABLES[@]}"
      do
        replaceAll "{\$$variable}" "${VARIABLES[$variable]}"
      done
elif [ "$type" == "stop" ]; then
        for variable in "${!VARIABLES[@]}"
          do
            replaceAll "${VARIABLES[$variable]}" "{\$$variable}"
          done
else
  echo "Wrong type specified! Use \"start\" or \"stop\"."
  exit
fi