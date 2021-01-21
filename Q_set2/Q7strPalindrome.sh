#! /usr/bin/bash
len=0
i=1
echo -n "Enter a String: "
read str
len=`echo $str | wc -c`
len=`expr $len - 1`
halfLen=`expr $len / 2`
while [ $i -le $halfLen ]
do
    c1=`echo $str|cut -c$i`
    c2=`echo $str|cut -c$len`
if [ $c1 != $c2 ] ; then
echo "string is not palindrome"
exit
fi
i=`expr $i + 1`
len=`expr $len - 1`
done
echo "String is Palindrome"
# read -p "Enter the string : " str

# rev=$(echo $str | rev)
# if [ $n -eq $rev ]
# then
#    echo "Is palindrome"
# else
#    echo "Is not palindrome"
# fi