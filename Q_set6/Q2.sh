#! /usr/bin/bash
# To check if a file exist and if it exists then append some content into it.


read -p "Enter the Test File name : " file

if [ -e $file ]
then
    echo "Test File exists.."
    if [ -w $file ]
    then
        cat>> $file
    else
        echo " Cannot write to the test file."
    fi
else
    echo "File Does not exist...Creating the File"
    touch xyz.txt
    cat >> $file
    echo "File updated!"
fi