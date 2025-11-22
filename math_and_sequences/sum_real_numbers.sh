<<Documentation
Name            : Vignesh Balaji
Date            : 11/09/2021
Description     : Real Number Addition
Input           :
Output          :
Documentation

#!/bin/bash


var='^[+-]?[0-9]?[.]?[0-9]?+$'
sum=0

echo "Enter the numbers to be summed : " ; echo 
read -a num
length=${#num[@]}

for next_num in `seq 0 $((length-1))`
do
    if [[ ${num[$next_num]} =~ $var ]]
 then
     sum=`echo "$sum + ${num[$next_num]}"|bc` 
 else
     set_variable=1
    fi
done

 if [ $((set_variable)) -eq 1 ]
 then
     echo "Enter only Numerical values!"
 else
 echo "The sum of $length numbers is : " $sum
 fi
 
