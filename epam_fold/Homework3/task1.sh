#!/bin/bash

cur_date=$(( $(date +%m) - 1 ))

leanYearMonths=(31 28 31 30 31 30 31 31 30 31 30 31)

echo -e "\n${leanYearMonths[$cur_date]}\n"

