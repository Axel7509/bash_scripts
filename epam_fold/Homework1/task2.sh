#!/bin/bash

echo -e "Unknown File Problem\n"
./hello-something-wrong-1.sh

echo -e "Exit code: $?\n"

echo -e "Syntax Problem\n"
./hello-something-wrong-2.sh

echo -e "Exit code: $?\n"

echo -e "Permission Problem\n"
./hello-something-wrong-3.sh

echo -e "Exit code: $?\n"
