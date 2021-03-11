#! /usr/bin/bash

# To swap two variables using functions.

swap(){
    read -p "Enter two values : " a b
    echo "Before Swapping..."
    echo "a = $a && b = $b"
    a=$((a+b))
    b=$((a-b))
    a=$((a-b))
    echo "After Swapping..."
    echo "a = $a && b = $b"
}
# Involking the function.
swap
