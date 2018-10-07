#!/bin/bash

rm *.log

for n in `seq 1 16`;
do
	echo "Value of N is " $n | tee -a stress.log sar.log
	echo "**************** N START ******************" | tee -a stress.log sar.log
	echo " " | tee -a stress.log sar.log
        
        for i in `seq 1 5`;
	do
		echo " " | tee -a stress.log sar.log
		echo "Test run " $i | tee -a stress.log sar.log
		echo "<<<<<<<<<<<<<<<<<<< iteration start <<<<<<<<<<<<<<<<<<<<<<<" | tee -a stress.log sar.log
		echo " " | tee -a  stress.log sar.log
	
		stress-ng -v --hdd $n --hdd-opts wr-rnd --metrics-brief --perf -t 20s | tee -a stress.log &
		sar -d 1 20 | tee -a sar.log &

		sleep 25
		echo " " | tee -a  stress.log sar.log
		echo ">>>>>>>>>>>>>>>>>>> iteration end >>>>>>>>>>>>>>>>>>>>>" | tee -a stress.log sar.log
		echo " " | tee -a stress.log sar.log
	done

	echo " " | tee -a stress.log sar.log
	echo "***************** N END *****************" | tee -a stress.log sar.log
	echo " " | tee -a stress.log sar.log
	echo " " | tee -a stress.log sar.log
done
