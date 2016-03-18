#!/bin/bash

while [ 1 ]
do	
	NIC=wlan0

	eval `cat /proc/net/dev | grep $NIC | cut -d ':' -f 2 | awk '{print "tx_old="$9}'`
	TXSTARTtime=`date +%s.%N`
	#echo "tx_old=$tx_old"
	#echo "TXSTARTtime=$TXSTARTtime"
	sleep 1

	eval `cat /proc/net/dev | grep $NIC | cut -d ':' -f 2 | awk '{print "tx="$9}'`
	TXENDtime=`date +%s.%N`
	if [ $tx_old -gt $tx ]; then 
		tx=$((4294967296+$rx))
		#echo "Count NIC stop byte:  " $tx
	#else
		#echo "Count NIC stop byte:  " $tx
	fi
	#echo "tx=$tx"
	#echo "TXENDtime=$TXENDtime"
	TX_diff=`echo "scale=9; ((((($tx-$tx_old)/1024)/1024)*8)/($TXENDtime-$TXSTARTtime))" | bc -l`
	echo "$TX_diff"

	#sleep 1
done


