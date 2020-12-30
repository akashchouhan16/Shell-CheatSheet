#! /usr/bin/bas
echo "Enter Username : "
read user;
echo "Enter password : "
read password
echo "User signed as $user"
#OR
if [ "$user" == "akashchouhan16" ]
then 
    echo "Authorised User request."
else  echo "Unauthorised User request. :/"
fi
read -p "Enter Unique ID " ID
if [ $ID == 156 ]
then
 echo "Hello $ID, nice to meet you!"
 else
    echo "Access denied!....";
fi

# Comparisions
read -p "Enter Num1 : " num1
read -p "Enter Num2 : " Num2
if [ $num1 -gt $num2 ]
then 
    echo "The Number $num1 is greater than $num2\n"
elif [ $num2 -gt $num1 ]
then
    echo "The Number $num2 is greater than $num1\n"
else echo "Both the input numbers are equal.\n"
fi
# FILE Conditionals
FILE="text.txt"
if [ -f "$FILE" ]
then
    echo "$FILE exits"
else
    echo "$FILE does not exists"
fi

read -p "Enter any character to terminate bash" $terminate