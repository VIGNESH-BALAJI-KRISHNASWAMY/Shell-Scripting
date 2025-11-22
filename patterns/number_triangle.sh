<<Documentation
Name            : K.Vignesh Balaji
Date            : 13/08/2021
Description     : A01 - Read 'n' and generate a pattern given below (number increments from left to right)
Input           : 33
Output          : Error : Number out of range, Please enter 2 < number < 2^5
Documentation

#!/bin/bash

echo "
Type of pattern to be printed      1
                                   1  2
                                   1  2  3
     
     "
read -p "Enter the number of lines needed to be printed : " num

range=`echo "2^5"|bc`     #setting the range
var='^[+]?[0-9]+$'        #error detecting variable to detect the error input

if [[ $num =~ $var ]]
then
    if [ $num -le 2 -o $num -gt $((range-1)) ]
    then
        echo "Error : Number out of range, Please enter 2 < number < 2^5"
    else
        for row in `seq $num`        #Loop for Row
        do
            for col in `seq $row`    #Loop for column which runs only when column <= row
            do
                echo -n -e "$col "   #printing the column value in each matrix position
            done
            echo                     #space for next row
        done
    fi
else
    echo "Enter only positive integer's of range: 2 < number < 2^5"
fi
