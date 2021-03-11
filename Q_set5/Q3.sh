#! /usr/bin/bash
# To find the sum of all array elements

sum(){
    echo "Enter Array Elements : "
    read -a arr
    sum=0
    for((i=0;i<${#arr[@]};i++)) doclear
    
        sum=$((sum+${arr[$i]}))
    done
    echo "Sum of all the Elements = $sum"
}
# Invoking Function sum()
sum