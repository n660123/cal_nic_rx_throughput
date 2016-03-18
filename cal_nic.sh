#!/bin/bash

while [ 1 ]
do	
	NIC=wlan0

	rx_old=$(cat /proc/net/dev | grep $NIC | cut -d ':' -f 2 | awk '{print $1}')
	RXSTARTtime=`date +%s`
	echo "rx_old=$rx_old"
	#echo "RXSTARTtime=$RXSTARTtime"
	sleep 1

	rx=$(cat /proc/net/dev | grep $NIC | cut -d ':' -f 2 | awk '{print $1}')
	RXENDtime=`date +%s`
	echo "rx=$rx"
	#echo "RXENDtime=$RXENDtime"

	rx_diff=$(($rx-$rx_old))
	#X_diff=`echo "scale=9; ((((($tx-$tx_old)/1024)/1024)*8)/($TXENDtime-$TXSTARTtime))" | bc -l`
	echo "$rx_diff"

	#sleep 1
done


