#! /usr/bin/bash

#To find the factorial of a number

fact(){
    read -p "Enter a number : " num
    fact=1
    i=1
    while [ $i -le $num ]
    do
        fact=$((fact * i))
        i=$((i+1))
    done
    echo "Factorial of $num = $fact"
}
# factorial=1
# factRecur(){
#     if [ $1 -eq 0 -o $1 -eq 1 ]
#     then
#         return 1
#     else
#         factorial=$((factorial * $1))
#         factRecur `expr $1 - 1`
#     fi
# }
function factorial(){
    if [ $1 -eq 1 ]
    then
        echo 1
    else
        echo $(($1 * $(factorial $(($1-1)))))
    fi
}

fact
echo -n "Factorial of 5 = "
 factorial 5
# factRecur 5
# res=$?
# echo "Factorial = $res"