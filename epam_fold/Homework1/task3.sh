#!/bin/bash


echo -e "Task 3.1 grep : "
grep "dolore" lorem

echo -e "Task 3.2 cut : "

cat /etc/group | cut -d: -f1 | head -10 

echo -e "Task 3.3 sed : "

sed '/Linux/d' sed_task
echo

sed '0,/xterm/s//Bash/' sed_task
echo

sed '/Linux/d; 0,/xterm/s//Bash/' sed_task

echo -e "Task 3.4 awk : "
cat /etc/passwd | awk -F: '{print $1}' | head -10
