#! /usr/bin/bash

# To obtain x^y

power(){
    echo "Enter x and y : "
    read x y
    res=1
    i=1
    while [ $i -le $y ]
    do
        res=$((res*x))
        i=$((i+1))
    done
    echo "$x^$y = $res"
}

power