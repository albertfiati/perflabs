#!/bin/bash

rm *.log

for n in 2 4 8 12 16;
do
	echo "Value of N is " $n | tee -a stress.log sar-memory.log sar-cpu.log
	echo "**************** N START ******************" | tee -a stress.log sar-memory.log sar-cpu.log
	echo " " | tee -a stress.log sar-memory.log sar-cpu.log
        
        for i in `seq 1 5`;
	do
		echo " " | tee -a stress.log sar-memory.log sar-cpu.log
		echo "Test run " $i | tee -a stress.log sar-memory.log sar-cpu.log
		echo "<<<<<<<<<<<<<<<<<<< iteration start <<<<<<<<<<<<<<<<<<<<<<<" | tee -a stress.log sar-memory.log sar-cpu.log
		echo " " | tee -a stress.log sar-memory.log sar-cpu.log
	
		stress-ng -v --pthread $n --pthread-ops 1000000 --pthread-max 64 --metrics-brief --perf -t 25s | tee -a stress.log &
		sar -r 1 25 | tee -a sar-memory.log &
		sar -u ALL 1 25 | tee -a sar-cpu.log &

		sleep 30
		echo " " | tee -a stress.log sar-memory.log sar-cpu.log
		echo ">>>>>>>>>>>>>>>>>>> iteration end >>>>>>>>>>>>>>>>>>>>>" | tee -a stress.log sar-memory.log sar-cpu.log
		echo " " | tee -a stress.log sar-memory.log sar-cpu.log
	done

	echo " " | tee -a stress.log sar-memory.log sar-cpu.log
	echo "***************** N END *****************" | tee -a stress.log sar-memory.log sar-cpu.log
	echo " " | tee -a stress.log sar-memory.log sar-cpu.log
	echo " " | tee -a stress.log sar-memory.log sar-cpu.log
done
