#!/bin/sh

while [ 1 ]
do
    ps aux | grep ./code/main.qcl | grep -v grep >> ./log/qclps_grover.log
done
