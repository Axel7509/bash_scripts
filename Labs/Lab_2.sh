#!/bin/bash

my_list=$(cat car_products.txt)

declare -A items
row=1
#cat car_products.txt | awk -F',' '{print $1}' 

echo "$my_list" | awk -F',' '{
 
    for (i = 1; i <= NF; i += 3) {
        name = $i;
        quantity = $(i + 1);
        price = $(i + 2);
        items[row, "Name"] = name;
        items[row, "Count"] = quantity;
        items[row, "Price"] = price;
        row++;
    }
    
    # Вывод элементов массива
    for (i = 1; i < row; i++) {
        printf("Name: %s, Count: %s, Price: %s\n", items[i, "Name"], items[i, "Count"], items[i, "Price"]);
    }
}'
echo -e "----row = $row----"

