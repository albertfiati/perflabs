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
		./*.sh
		cd ..
	fi
done

echo
echo "DONE"
echo 
