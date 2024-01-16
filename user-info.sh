#!/bin/bash

echo
echo "Home dir: $HOME"
echo
echo "User Name: `whoami`"
echo
echo -e "User ID: $(id -u)\n"

echo -e "Group Information: $(getent group users)\n"

echo -e "Terminal Type: $TERM\n"

echo -e "Current Directory: $(pwd)\n"

echo -e "System Date/Time: $(date)\n"

echo -e "Exit code: $?\n"
