#!/bin/bash

rm *.log

for n in 2 4 8 12 16;
do
	echo "Value of N is " $n | tee -a stress.log #sar.log
	echo "**************** N START ******************" | tee -a stress.log #sar.log
	echo " " | tee -a stress.log #sar.log
        
        for i in `seq 1 5`;
	do
		echo " " | tee -a stress.log #sar.log
		echo "Test run " $i | tee -a stress.log #sar.log
		echo "<<<<<<<<<<<<<<<<<<< iteration start <<<<<<<<<<<<<<<<<<<<<<<" | tee -a stress.log #sar.log
		echo " " | tee -a stress.log #sar.log
	
		stress-ng --pthread $n -pthread-ops 1000000 --pthread-max 64 --metrics-brief --perf | tee -a stress.log &
		#sar -r 2 5 | tee -a sar.log &

		sleep 15
		echo " " | tee -a stress.log #sar.log
		echo ">>>>>>>>>>>>>>>>>>> iteration end >>>>>>>>>>>>>>>>>>>>>" | tee -a stress.log #sar.log
		echo " " | tee -a stress.log #sar.log
	done

	echo " " | tee -a stress.log #sar.log
	echo "***************** N END *****************" | tee -a stress.log #sar.log
	echo " " | tee -a stress.log #sar.log
	echo " " | tee -a stress.log #sar.log
done
