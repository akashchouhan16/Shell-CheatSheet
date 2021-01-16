#! /usr/bin/bash
#To Find the average of three input marks
echo "Enter marks of three subjects : "
read s1 s2 s3
# avg=`expr $s1 + $s2 + $s3 `
# avg=`expr $avg / 3`
avg=$(((s1+s2+s3)/3))
echo "Average Marks = $avg"
