#!/bin/bash

rm *.log

for i in `seq 1 8`;
do
	echo "Value of N is " $i | tee -a stress.log sar.log
	echo "**************** N START ******************" | tee -a stress.log sar.log
	echo " " | tee -a stress.log sar.log
        
        for j in `seq 1 5`;
        do
		echo " " | tee -a stress.log sar.log
		echo "Test run " $j | tee -a stress.log sar.log
		echo "<<<<<<<<<<<<<<<<<<< iteration start <<<<<<<<<<<<<<<<<<<<<<<" | tee -a stress.log sar.log
		echo " " | tee -a stress.log sar.log
		
		stress-ng --crypt $i --metrics-brief --perf -t 10s | tee -a stress.log &
		sar -P ALL 2 5 | tee -a sar.log &

		sleep 15
		echo " " | tee -a stress.log sar.log
		echo ">>>>>>>>>>>>>>>>>>> iteration end >>>>>>>>>>>>>>>>>>>>>" | tee -a stress.log sar.log
		echo " " | tee -a stress.log sar.log
        done
	
	echo " " | tee -a stress.log sar.log
	echo "***************** N END *****************" | tee -a stress.log sar.log
	echo " " | tee -a stress.log sar.log
	echo " " | tee -a stress.log sar.log
done
