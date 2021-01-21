#! /usr/bin/bash
#To Display The array elements in reverser order.

declare -a arr
i=0
element=0
while [ $i -le 5 ]
do
    echo "Enter element arr[$i] : "
    read element
    arr[$i]=$element
    i=$((i + 1))
done
echo "Displaying the Array Elements in Reverse Order : "

# Using While Loop

i=${#arr[@]}
while [ $i -gt 0 ]
do
    i=$((i-1))
    echo -n "${arr[i]},"
done

# Using For Loop

# for (( i =${#arr[@]}-1 ; i>=0 ; i-- )); do
    # echo -n "${arr[i]},"
# done
