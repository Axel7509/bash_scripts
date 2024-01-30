#!/bin/bash
echo

echo -n "Input first num: "
read num_1
echo -n "Input second num: "
read num_2

echo 

if [ $num_1 -lt $num_2 ]; 
then
	echo -e "$num_1 is less than $num_2\n"
elif [ $num_1 -gt $num_2 ]; 
then
	echo -e "$num_1 is greate than $num_2\n"
else
	echo -e "$num_1 is equal $num_2\n"
fi
