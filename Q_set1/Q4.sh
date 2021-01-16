#! /usr/bin/bash
echo "Calculating Gross Salary... $#"
read -p "Enter Basic Salary : " basic
gross=$((basic+((basic/100)*30)+(basic/100)*7))
# TA=`expr $1\*0.30`
# HRA=`expr $1\*0.07`
# gross=`expr $1 + $TA + $HRA`
echo "Gross Salary = $gross"
