#!/bin/bash


echo -e "\nTask 4.1: \n"

mystring=abcdefghijklmn
echo "full string : $mystring"
echo ${mystring:2:5}

echo -e "\nTask 4.2: \n"

hello="Hello world"

echo "$hello" | sed 's/Hello/Goodbye/'

echo -e "${hello//Hello/Goodbye}"

echo -e "\nTask 4.3: \n"

jesus="water wine water wine water wine"

echo ${jesus//water/wine}

echo "$jesus" | sed 's/water/wine/g'

echo -e "\nTask 4.4: \n"

path=$(pwd)

parent_path=$(dirname "$path")
echo "$parent_path"

