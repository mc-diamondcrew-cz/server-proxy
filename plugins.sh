#!/bin/bash
declare -a PLUGINS=(
  ""
)

for plugin in PLUGINS
do
  echo "Downloading plugin ${plugin}."
  (cd plugins || return ; curl -o https://xephia.eu/plugins/${plugin})
done