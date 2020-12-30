#! /usr/bin/bash
read -p "Enter Count : " count
if [ $count -eq 9 ]
then  
    echo "Equal!"
else
    echo "Not Equal!"
fi
echo "Enter userid : "
read userid
echo "Enter username : "
read username
if [ $userid -le "156" ]
then
    echo " ~~~~~ Valid User ~~~~~"
else echo "ERROR : Invalid User"
fi
if [ $username != "akashchouhan16" ]
then
    echo "User doesnt exist.."
else echo "Welcome $username!"
fi

read -p "Enter any key to terminate... " key

