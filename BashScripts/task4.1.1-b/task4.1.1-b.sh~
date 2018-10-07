#!/bin/bash

rm *.log

for n in 1000000 2000000 3000000 4000000 5000000;
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
		
		stress-ng --cpu 8 --cpu-load 100 -v --backoff $n -t 60s | tee -a stress.log &
		sar -P ALL 1 60 | tee -a sar.log &
		top -d 1 -n 60 | tee -a top.log &

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
