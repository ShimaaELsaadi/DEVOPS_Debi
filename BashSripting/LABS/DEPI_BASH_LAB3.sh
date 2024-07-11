#! /bin/bash
#script to creat array 'City Name'

#add arry with 3 values
cities=("Cairo" "Alexandria" "Giza")

#print all cities
echo "our cities:${cities[@]}"

#print the second city name
echo "The scond city is ${cities[1]}"

#enter new city 
n=${#cities[@]}
read -p "Enter new city name :" cities[$n]

#disply number of cities now
n=${#cities[@]}
echo "Number of current cities = $n"

#change name of the first city
read -p "Enter new city name :" cities[0]

#print all cities
echo "our cities:${cities[@]}"

#END

