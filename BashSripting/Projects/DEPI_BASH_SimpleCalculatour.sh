#! /bin/bash
#**********************************************************************
#script to make simple calculator 
#1-add
#2-subteact
#3-multiply
#4-divide
#5-SquareRoot
#6-Percentage
#7-Close
#*********************************************************************

PS3="Choise an operation: "
select op in add sub multi divide SquareRoot Percentage close
do
	case $op in

	add)
		read -p "Enter 1st Number: " num1
		read -p "Enter 2nd Number: " num2
		echo "$num1 + $num2 = $(($num1+$num2))";;
	sub)
                read -p "Enter 1st Number: " num1
                read -p "Enter 2nd Number: " num2
                 echo "$num1 - $num2 = $(($num1-$num2))";;
	multi)
                read -p "Enter 1st Number: " num1
                read -p "Enter 2nd Number: " num2
                 echo "$num1 * $num2 = $(($num1*$num2))";;
	divide)
                read -p "Enter 1st Number: " num1
                read -p "Enter 2nd Number: " num2
		echo "$num1 / $num2 = $(echo "scale=2; $num1 / $num2" | bc)";;
	SquareRoot)
		read -p "Enter The Number: " num1
		echo "sqrt($num1) = $(echo "scale=2; sqrt($num1)" | bc)";;
	Percentage)
		read -p "Enter 1st Number: " num1
                read -p "Enter 2nd Number: " num2
		echo "($num1 / $num2)%=$(echo "scale=2;$num1/$num2*100"|bc)%";;	
	close)
		echo "Closed...."
		break
		;;
	*)
		echo "$REPLY is Invalid"

	;;
	esac
done


	
