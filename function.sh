#!/bin/bash

function user_details {
	echo "User Name: $(whoami)"
	echo "Home directory: $HOME"
}

user_details
echo
user_details
echo

string_a="UNIX"
string_b="GNU"

echo "Are $string_a and $string_b strings equal?"
[ $string_a = $string_b ]

echo -e "Exit code: $?\n"

num_a=100
num_b=100

echo "Is $num_a equal to $num_b ?" 
[ $num_a -eq $num_b ]

echo -e "Exit code: $?\n"
