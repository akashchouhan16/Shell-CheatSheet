#! /usr/bin/bash

#To write a Menu Driven file-handling Shell Script. Let it offer the user the choice of creating, copying, removing and renaming files. Once the user has made a choice, have the program ask the user for the necessary information and execute the corresponding code.

echo "Enter 1 to Open up a File | Enter 2 to remove a file | Enter 3 to Copy | Enter 4 to Rename File | Enter 0 to terminate"
read -p "Enter a choice : " choice

if [ $choice == "1" ]
then
    ./Q2.sh
fi
if [ $choice == "2" ]
then
    read -p "Enter the File name to Remove the file : " file
    rm $file
    echo "File removed.."
fi

if [ $choice == "4" ]
then
    echo "Enter Old file name and the new file name : "
    read Old
    read new
    mv $Old $new
fi

if [ $choice == "0" ]
    echo "Code Terminated!"
fi