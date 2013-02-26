#!/bin/zsh

rm ./log/H.log
#rm ./log/qclps.log

i=0
while [ $i -lt 25 ]
do
    echo "qureg q[${i}];H(q);" > ./code/h.qcl
    echo $i >> ./log/H.log
    #echo "===============================================${i}===================================" >> ./log/qclps.log
    #sh ./code/qclps.sh &
    (time qcl ./code/h.qcl) 2>> ./log/H.log
    #pid=`ps -ef | grep "./code/qclps.sh" | grep -v grep | awk '{ print $2; }'`
    #kill $pid
    echo "" >> ./log/H.log
    echo "" >> ./log/H.log
    i=`expr $i + 1`
done
