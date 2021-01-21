#To Generate Grade from Marks
read -p "Enter Student Total Marks (out of 100): " m 
if [ $m -gt 100 ]
then 
    echo "Invalid Marks Input.. Code Terminated!"
    exit
fi



if [ $m -le 100 -a $m -ge 90 ]
then
    echo "Obtained Grade : O"
elif [ $m -lt 90 -a $m -ge 80 ]
then
    echo "Obtained Grade : E"
elif [ $m -lt 80 -a $m -ge 70 ]
then
    echo "Obtained Grade : A"
elif [ $m -lt 70 -a $m -ge 60 ]
then
    echo "Obtained Grade : B"
else
    echo "Obtained Grade : C"
fi
# read -p "Press any key to terminate.... " $terminate