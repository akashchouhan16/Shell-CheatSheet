#1 /usr/bin/bash
# to delete an element from the array at a given position

declare -a arr
echo "Enter Array Elements : "
i=0
element=0

while [ $i -lt 5 ]
do
    echo -n "Enter val of arr[$i] : "
    read element
    arr[i]=$element
    i=$((i+1))
done
echo -n "Input Array : "
echo ${arr[*]}

read -p "Enter a position : " position
unset arr[position]
echo -n "Updated Array : "
echo ${arr[*]}