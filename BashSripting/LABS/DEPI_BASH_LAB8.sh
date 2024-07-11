#! /bin/bash

#script to ask user to name and check if his answer equal to Amin or not

read -p "What is my name:" name

until [ "$name" == "Amin" ];
do
	echo "Wrong Answer!"
	echo "Try Again"
	read -p "What is my name:" name
done

echo "You Got It"

#END
	
