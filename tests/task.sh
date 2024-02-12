#!/bin/bash

cat parking_info | cut -d' ' -f1

cat parking_info | cut -d' ' -f2

cat parking_info | cut -d' ' -f2 | cut -d/ -f1

cat parking_info | cut -d' ' -f2 | cut -d/ -f1 | cut -d- -f1
