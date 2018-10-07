#!/bin/bash

clear
echo 
echo "START"
echo 

for d in *
do
	if [[ -d $d ]]; then
		cd "$d"
		echo "Executing >>" *.sh
		cd ..
		./*.sh > /dev/null 2>&1
	fi
done

echo
echo "DONE"
echo 
