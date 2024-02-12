#!/bin/bash

my_list=$(cat car_products.txt)

unique_items=$(echo "$my_list" | awk -F',' '!seen[$1]++ {print $1}')

echo "$unique_items" | while IFS= read -r item; 
do
    quantity=$(echo "$my_list" | grep -w "$item" | awk -F',' '{sum+=$2} END{print sum}')
    
    
    price=$(echo "$my_list" | grep -w "$item" | awk -F',' '{sum+=$3} END{print sum}')
    
    count=$(echo "$my_list" | grep -w "$item" | wc -l)
    
    average_price=$(echo "scale=2; $price / $count" | bc)
    
    total_cost=$(echo "$quantity * $average_price" | bc)
    
    echo "Name: $item, Count: $quantity, Average price: $average_price, Total cost: $total_cost"
done
