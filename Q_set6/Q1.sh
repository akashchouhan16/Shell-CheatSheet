#! /usr/bin/bash
# To Check if a File exists and display its permissions

read -p "Enter the Test File name : " file

if [ -f $file ]; then

    if [ -w $file ]
    then
        echo "$file has Writable permissions."
    else
        echo "$file does not have writable permissions."
    fi

    if [ -r $file ]
    then
        echo "$file has read permissions."
    else
        echo "$file does not have read permissions."
    fi
    if [ -x $file ]
    then
        echo "$file has executible permissions."
    else
        echo "$file does not have executible permissions."
    fi
else
    echo "File Doesn't Exit!";
fi

read -p "Enter any key to terminate the code... " $terminate

# ====== Discarded Changes =======
# file = "abc.txt"
# if [ -e $file ]
# then 
#     echo "File Exists!"
#     ls -l $file
# else
#     echo "File doesn't exist."
# fi
# if [ -f $1 ]; then
#     if [ -w $1 ]; then
#         echo "Write = Yes"
#     else
#         echo "Write = No"
#     fi

#     if [ -r $1 ]; then
#         echo "Read = Yes"
#     else
#         echo "Read = No"
#     fi

#     if [ -x $1 ]; then
#         echo "Execute = Yes"
#     else
#         echo "Execute = No"
#     fi
# else 
#     echo "File does not exist."
# fi