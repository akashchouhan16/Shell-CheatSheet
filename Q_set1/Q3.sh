#! /usr/bin/bash
#To Perform All basic Arithmetic operations on two numbers.

sum=`expr $1 + $2`
echo "Sum = $sum"
diff=`expr $1 - $2`
echo "Difference = $diff"
mul=`expr $1 \* $2`
echo "Product = $mul"
div=`expr $1 / $2`
echo "result upon division = $div"
mod=`expr $1 % $2`
echo "$1 mod $2 = $mod"
# read -p "press any key to terminate.." key