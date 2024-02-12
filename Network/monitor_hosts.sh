#!/bin/bash 

hosts=("google.com" "yandex.ru" "192.168.0.1")
log_file="ping_log.txt"

cur_time=$(date)

echo -e "\n$cur_time\n" >> "$log_file"

for host in "${hosts[@]}";do
	if ping -c 1 "$host";then
		#echo "$cur_time - Host $host is reachable"
            	echo "- Host $host is reachable" >> "$log_file"
        else 
        	#echo "$cur_time - Host $host is Unreachable"
            	echo "- Host $host is Unreachable" >> "$log_file"
	fi
done

echo
