#!/bin/bash

rm *.log

for n in 4000 8000 16000 32000 64000 128000 256000 512000 1024000;
do
	echo "Value of N is " $n | tee -a stress.log sar.log top.log
	echo "**************** N START ******************" | tee -a stress.log sar.log top.log
	echo " " | tee -a stress.log sar.log top.log
        
        for i in `seq 1 5`;
	do
		echo " " | tee -a stress.log sar.log top.log
		echo "Test run " $i | tee -a stress.log sar.log top.log
		echo "<<<<<<<<<<<<<<<<<<< iteration start <<<<<<<<<<<<<<<<<<<<<<<" | tee -a stress.log sar.log top.log
		echo " " | tee -a  stress.log sar.log top.log
	
		stress-ng --bigheap 2 --bigheap-growth $n --metrics-brief --perf -t 60s | tee -a stress.log &
		sar -r 2 30 | tee -a sar.log &
		top -H -d 2 -n 30 | tee -a top.log &

		sleep 65
		echo " " | tee -a  stress.log sar.log top.log
		echo ">>>>>>>>>>>>>>>>>>> iteration end >>>>>>>>>>>>>>>>>>>>>" | tee -a stress.log sar.log top.log
		echo " " | tee -a stress.log sar.log top.log
	done

	echo " " | tee -a stress.log sar.log top.log
	echo "***************** N END *****************" | tee -a stress.log sar.log top.log
	echo " " | tee -a stress.log sar.log top.log
	echo " " | tee -a stress.log sar.log top.log
done
