#! /bin/bash

#script to check input is alphabetic or number

read -p "Enter you input: " ip

ch1="${ip:0:1}"

case "$ch1" in
	[a-z])
	echo "You entered string";;
[A-Z])
        echo "You entered string";;

[0-9])
	echo "YOU entered a number";;
	*)
	echo "Not string and number";;
esac

	
