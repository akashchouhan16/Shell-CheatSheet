#To Check whether the given year is a leap year
echo -n "Enter year : "
read y
y1=$((y%4))
y2=$((y%100))
y3=$((y%400))
if [ $y1 -eq 0 -a $y2 -ne 0 -o $y3 -eq 0 ]
then 
echo "$y is leap year"
else
echo "$y is not a leap year"
fi