#!/bin/bash

while true
do
  if pgrep -x "acemd.bin" > /dev/null; then
    #echo "Acemd is Running"
    nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader > /home/acellera/temp.log
    tail /home/acellera/temp.log | while read line
    do
      #echo "Temperature: $line"
      if echo $line | grep -q 8[8,9]; then
        echo 'ALERT: Temp reached critical temp'
        echo 'ACTION : Stopping simulations'
        killall 'acemd.bin'
        killall 'acemd.bin'
        killall 'acemd.bin'
      fi
      if echo $line | grep -q 9[0,1,2,3,4,5,6,7,8,9]; then
        echo 'ALERT: Temp reached critical temp'
        echo 'ACTION : Stopping simulations'
        killall 'acemd.bin'
        killall 'acemd.bin'
        killall 'acemd.bin'
      fi
    done
  else
    #echo "Acemd is not Running"
    sleep 60
  fi
  sleep 60
done
