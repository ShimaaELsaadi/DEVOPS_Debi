#! /bin/bash
#script to get the rating
read -p "Enter your grade:" g
if [ $g -ge 100 ] ||[ $g -lt 0 ]
then
       echo "Invalid Input"
elif [ $g -ge 85 ]
then 
	echo "Exellent"
elif [ $g -ge 75 ]
then 
	echo "Very Good"
elif [ $g -ge 65 ]
then 
	echo "Good"
elif [ $g -ge 50 ]
then 
	echo "Normal"
else
	echo "Failed"
fi

