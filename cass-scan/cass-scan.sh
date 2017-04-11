#!/bin/bash

option="cassandra"
echo "Running $option Process"
ps -ef | grep $option | cut -d' ' -f5 >>  $(date +%Y%m%d_%H%M%S)_`hostname`.out
echo "Writing Results to $(ls -t | head -n1)"
sed -i '1s/^/Running '$option' Process\n/' $(ls -t | head -n1)

echo "Now checking the following process for lsof"
while read -r process; do
                echo "$(ls -t | head -n1)::$process" 
                lsof -p $process | grep delete 
done < $(ls -t | head -n1)














































