#!/bin/bash

for i in $(seq 1 $2);
do
  echo "File ${i}"
  runghc ${1} < ${i}.in | diff - ${i}.ans
  echo "" 
done
exit 0
