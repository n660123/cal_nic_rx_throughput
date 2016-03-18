#!/bin/bash
 
INTERVAL="1"  # update interval in seconds
 
while true
do
        R1=`cat /sys/class/net/wlan0/statistics/rx_bytes`
        T1=`cat /sys/class/net/wlan0/statistics/tx_bytes`
        sleep $INTERVAL

        R2=`cat /sys/class/net/wlan0/statistics/rx_bytes`
        T2=`cat /sys/class/net/wlan0/statistics/tx_bytes`

        Tx_diff=`expr $T2 - $T1`
        Rx_diff=`expr $R2 - $R1`

		Tx=$(echo "$Tx_diff/1024/1024*8" | bc -l | awk '{printf("%.3f",$Tx_diff)}')
		Rx=$(echo "$Rx_diff/1024/1024*8" | bc -l | awk '{printf("%.3f",$Rx_diff)}')
	
        echo "wlan0 TX: $Tx Mbps, RX: $Rx Mbps"
done