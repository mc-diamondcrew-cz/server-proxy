#!/bin/sh
SERVER_MEMORY=$1
DL_JAR=$2
DL_LANG=$3

bash git.sh # (Used only in production to pull latest server version.)
if [ -z "$SEVER_MEMORY" ]; then
    SERVER_MEMORY=1024
fi
if [ "$DL_LANG" ]; then
    echo "Running language script.."
    bash language.sh
fi
if [ "$DL_JAR" ]; then
    echo "Downloading jarfile.."
    curl -o server.jar https://papermc.io/api/v2/projects/velocity/versions/3.1.1/builds/98/downloads/velocity-3.1.1-98.jar
fi
bash variables.sh start # (Custom variables - passwords, ports..) Make your own and don't forget to remove them when committing.

java -Xms"${SERVER_MEMORY}"M -Xmx"${SERVER_MEMORY}"M -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15 -jar server.jar