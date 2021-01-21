#! /usr/bin/bash
# To accept Five elements from the user into an array and display them.

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
echo "Array elements saved."
echo "Displaying the array : "
for i in ${arr[@]}
do
    echo -n "${i}, "
done

read -p "Enter any key to free the array..." terminate
unset arr
