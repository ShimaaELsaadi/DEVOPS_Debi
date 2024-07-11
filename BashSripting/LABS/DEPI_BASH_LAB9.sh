#! /bin/bash
#script to read 10 numbers from user and print its summation

sum=0

for((i=0;i<10;i++));
do 
	read -p "Enter Number $i :" num
	sum=$((sum+num))
done
echo "The summation=$sum"

#end

