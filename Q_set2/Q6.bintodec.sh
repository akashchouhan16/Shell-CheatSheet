#To Convert Decimal to Binary equivalent.
# read -p "Enter the num : " n
# val=0
# power=1
# while [ $n -ne 0 ]
# do
#     r=$((n % 2))
#     val=$((r*power + val))
#         power=$((power* 10))
#         n=$((n/ 2))
# done
# echo "Binary equivalent = $val "


echo "Enter any Binary no : "
read binary
len=${#binary}
i=1
pow=$((len - 1 ))
while [ $i -le $len ]
do
n=`echo $binary | awk '{ printf substr( $0,'$i',1 )}' `
j=1
p=1
while [ $j -le $pow ]
do
p=$(( p * 2 ))
j=$(( j + 1 ))
done
dec=$(( n * p ))
findec=$(( findec + dec ))
pow=$((pow - 1 ))
i=$(( i + 1 ))
done
echo "Equivalent Decimal no: $findec"
# digit=0
# number=0
# temp=$n
# power=1
# i=0
# j=0
# while [ $temp -ne 0 ]
# do 
#     digit=$((temp % 10))
#     while [ $j -gt 0 ]
#     do
#         power=$((power*2))
#     done
#     j=$((j+1))
#     temp=$((temp/10))
#     number=$(((number) + (digit*power)))
# done
# echo "Decimal Number : $number"
# read terminate