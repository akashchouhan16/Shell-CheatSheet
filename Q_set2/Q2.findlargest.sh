#To find Largest Among three numbers
#Assumption : All three  are distinct numbers.
read -p "Enter three numbers : " a b c 
if [ $a -gt $b -a $a -gt $c ]
then
    echo "$a is the largest number"
elif [ $b -gt $a -a $b -gt $c ]
then
    echo "$b is the largest number"
else
    echo "$c is the largest number"
fi