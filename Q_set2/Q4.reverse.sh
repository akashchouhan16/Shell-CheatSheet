#To reverse a given integer.
read -p "Enter a number : " num
rev=0
digit=0
temp=$num
while [ $temp -ne 0 ]
do
    digit=$((temp%10))
    rev=$((rev*10 + digit))
    temp=$((temp/10))
done
echo "Reverse number is : $rev"
