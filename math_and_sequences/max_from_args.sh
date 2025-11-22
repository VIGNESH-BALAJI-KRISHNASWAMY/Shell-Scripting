<<Documentation
Name            : Vignesh Balaji
Date            : 11/09/2021
Description     : Finding Largest Number
Input           :
Output          :
Documentation

#!/bin/bash


var='^[+-]?[0-9]?[.]?[0-9]?+$'
 
largest_num=$1
length=$#

if [ $((length)) -gt 0 ]
then
    echo Finding the largest numbers among $@
    for next_num in $@
        do
    if [[ $next_num =~ $var ]]
    then
        if [ $((next_num)) -ge $((largest_num)) ]
        then
        largest_num=$next_num
        fi
    else
         error_set=1
    fi
    done
    if [ $((error_set)) -eq 1 ]
    then
    echo "Enter only Numerical Values!"
    else
    echo "The Largest of $length numbers given is: " $largest_num
    fi
else
    echo "No Arguments are passed!!"
fi
