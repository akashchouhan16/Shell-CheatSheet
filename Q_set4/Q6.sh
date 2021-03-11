#1 /usr/bin/bash
# to perform linear Search on an array.

# declare -a arr
# echo "Enter Array Elements : "
# i=0
# query=0

# while [ $i -lt 5 ]
# do
#     echo -n "Enter val of arr[$i] : "
#     read query
#     arr[i]=$query
#     i=$((i+1))
# done

# read -p "Enter the key : " key
# for i in ${arr[@]}
# do
#     if [ ${i} -eq $key ]
#     then
#         echo "$key found in the input array."
#         exit
# done
# Found="Not Found!"
# for i in $arr
# do
#     if [ $key == $i ]
#     then
#         echo "Search Success."
#         Found="Element Found!"
#         break;
#     fi
# done

# echo $Found
# echo "Type the number of elements: "
# read num_of_elements
echo "Enter the elements of the array separated by spaces : "
read array;
echo "Type the key to search: "
read query;

check="Element Not Found"
for e in $array 
do
	if [ $query == $e ]; 
	then
		echo "Successful search!";
		check="Element Found";
		exit
	fi
done

echo "Element Not Found!";
