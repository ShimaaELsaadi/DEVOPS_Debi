#! /bin/bash
#script to check if the number is even or odd

#Get input from user
read -p "Please Enter Integer number: " num

#check if odd or even

if [ $((num % 2)) == 0 ]
then
	echo "$num is even."
else
	echo "$num is odd."
fi

#END

