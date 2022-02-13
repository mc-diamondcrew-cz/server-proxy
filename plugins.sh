#!/bin/bash
declare -A PLUGINS=(
  [Plan.jar]=Plan-5.4-build-1516.jar
)

for plugin in "${!PLUGINS[@]}"
do
  echo "Downloading plugin ${plugin}."
  (cd plugins || return ; curl -o "$plugin" https://plugin.xephia.eu/plugins/"${PLUGINS[$plugin]}")
done