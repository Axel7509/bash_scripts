#!/bin/bash

default_value="Default Value"

if [[ $MY_VAR == "" ]]; then
	echo "MY_VAR is null"
fi

echo "MY_VAR = ${MY_VAR:-$default_value}"
