#!/bin/bash

rm *.log

for s in `seq 1 2`
do
	echo "Value of S is " $s | tee -a stress.log sar.log top.log
	echo "++++++++++++++++++ S START ++++++++++++++++++" | tee -a stress.log sar.log top.log
	echo " " | tee -a stress.log sar.log top.log

	iter=$((60 / s))

	for n in 25 50 75 100;
	do
		echo "Value of N is " $n | tee -a stress.log sar.log top.log
		echo "**************** N START ******************" | tee -a stress.log sar.log top.log
		echo " " | tee -a stress.log sar.log top.log
		
		for j in `seq 1 5`;
		do
			echo " " | tee -a stress.log sar.log top.log
			echo "Test run " $j | tee -a stress.log sar.log top.log
			echo "<<<<<<<<<<<<<<<<<<< iteration start <<<<<<<<<<<<<<<<<<<<<<<" | tee -a stress.log sar.log top.log
			echo " " | tee -a stress.log sar.log top.log
			
			stress-ng -v --cpu 8 --cpu-load $n -t 60s | tee -a stress.log &
			sar -P ALL $s $iter | tee -a sar.log &
			top -d $s -n $iter | tee -a top.log &

			sleep 65
			echo " " | tee -a stress.log sar.log top.log
			echo ">>>>>>>>>>>>>>>>>>> iteration end >>>>>>>>>>>>>>>>>>>>>" | tee -a stress.log sar.log top.log
			echo " " | tee -a stress.log sar.log top.log
		done
	
		echo " " | tee -a stress.log sar.log top.log
		echo "***************** N END *****************" | tee -a stress.log sar.log top.log
		echo " " | tee -a stress.log sar.log top.log
		echo " " | tee -a stress.log sar.log top.log
	done
	
	echo " " | tee -a stress.log sar.log top.log
	echo "**************** S End ******************" | tee -a stress.log sar.log top.log
	echo " " | tee -a stress.log sar.log top.log
	echo " " | tee -a stress.log sar.log top.log
done
