#! /usr/bin/bash

#To sort the array elements using bubble Sort algorithm.

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
echo "Input Array : "
echo ${arr[*]}

# i=0
# n=${#arr[@]}-1
# j=0
# while [ $i -lt 5 ]
# do
#     while [ $j -lt ${5-i-1} ]
#     do
#         if [ ${arr[j]} -gt ${arr[$((j+1))]} ] 
#         then
#             # swap 
#             temp=${arr[j]} 
#             arr[$j]=${arr[$((j+1))]}   
#             arr[$((j+1))]=$temp 
#         fi
#     j=$((j+1))
#     done
# i=$((i+1))
# done

for ((i = 0; i<5; i++)) 
do
      
    for((j = 0; j<5-i-1; j++)) 
    do
      
        if [ ${arr[j]} -gt ${arr[$((j+1))]} ] 
        then
            temp=${arr[j]} 
            arr[$j]=${arr[$((j+1))]}   
            arr[$((j+1))]=$temp 
        fi
    done
done
echo -n "Sorted Array  : "
echo ${arr[*]}



































# while [ $i -lt $n ]
# do
#     while [ $j -le ${n-i-1} ]
#     do
#         if [ ${arr[j]} -gt ${arr[j+1]} ]
#         then
#             temp=$arr[j]
#             arr[j]=$arr[j+1]
#             arr[j+1]=$temp
#         fi
#         j=$((j+1))
#     done
#     i=$((i+1))
# done
# echo -n "Output Array : "
# for i in ${arr[@]}
# do
#     echo -n "$i, "
# done