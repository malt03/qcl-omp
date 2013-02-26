#!/bin/sh

i=2
j=1
while [ $i -lt 524289 ]
do
    echo "include \"grover.qcl\";grover(${i});" > ./code/main.qcl
    echo $j >> ./log/time.log
    echo "===============================================${j}===================================" >> ./log/qclps_grover.log
    sh ./code/qclps.sh &
    (time qcl ./code/main.qcl) 2>> ./log/time.log
    pid=`ps -ef | grep "./code/qclps.sh" | grep -v grep | awk '{ print $2; }'`
    kill $pid
    echo "" >> ./log/time.log
    echo "" >> ./log/time.log
    i=`expr $i \* 2`
    j=`expr $j + 1`
done
