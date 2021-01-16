#! /usr/bin/bash
# To Add two Numbers
read -p "Enter two numbers : " num1 num2
sum=`expr $num1 + $num2`
echo "Sum = $sum"

sum1=`expr $1 + $2`
echo "Cmd Line Input Sum : $sum1"
