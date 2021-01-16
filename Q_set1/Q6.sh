#! /usr/bin/bash
#To Convert temperature in Celsius to Fahrenheit.
echo "Enter Temperature in Celsius : "
read C
echo "Temp in Celsius = $C";
echo -n "Temp in Fahrenheit = ";
awk "BEGIN {print ($C*1.8) + 32}"
# F=$(((C*(9 / 5) + 32)))
# # k=`expr 9 / 5`
# # F=`expr $C \* $k`
# # F=`expr + 32`
# echo "Temperature in Fahrenheit = $F"
# echo -n "Enter temperature (C) : "
# read tc
# # formula Tf=(9/5)*Tc+32
# tf=$(echo "scale=2;((9/5) * $tc) + 32" | bc )
# echo "$tc C = $tf F"
