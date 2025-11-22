<<Documentation
Name            : K.Vignesh Balaji
Date            : 18/08/2021
Description     : Count the number of users with user IDs between the given range on the system
Input           : ./30_Assignment.sh 
Output          : Pass two arguments only! e.g <starting_id> <ending_id>
                  Since no Range is passed as CLA Default Range is taken from 500 to 10000
                  Total count of user id between 500 and 10000 is: 2
Documentation

#!/bin/bash

var='^[+]?[0-9]+$'  #Error corrector variable

if [ $# -eq 2 ]     #setting range as per user
then
    initial=$1
    final=$2
    range_set=1
elif [ $# -lt 2 -o $# -ge 3 ]   #condition for correcting the inappropriate no of CLA's passed by the user
then
        echo "Pass two arguments only! e.g <starting_id> <ending_id>"
fi

if [ $# -eq 0 ]     #setting default range if CLA's are not passed
then
    initial=500
    final=10000
    range_set=1
    echo "Since no Range is passed as CLA Default Range is taken from 500 to 10000"
fi

if [ $((range_set)) -eq 1 ]     #condition that lets in to find the no.of users between the given range.
    then
        if [ $initial -gt $final ]  
        then
            echo "Invalid Range <starting_id> should be less than <ending_id>"
        else
            if [[ ($initial =~ $var) && ($final =~ $var) ]]  #condition to check whether CLA given are numbers 
            then
                user_id=(`cat /etc/passwd|cut -d: -f3`)     #extracting the user id field from the path /etc/passwd and making an array
                num_user_id=${#user_id[@]}                  #calculating the no of user id's
                inc=0                                       #initializing variable
                for var in `seq $num_user_id`               #Loop to traverse between the number of user id's
                do
                     for count in `seq $initial $final`     #loop to traverse between the range fixed by user or default range
                     do
                        if [ $count -eq $((${user_id[$var]})) ] #checking each element in the array with each element in the range
                        then
                            inc=$((inc+1))                      #if the user id is within the range increment the no.of users.
                        fi
                     done
                done
                echo "Total count of user id between $initial and $final is: $inc"
            else
                 echo "Range is not Valid! provide positive numbers as range "
            fi
         fi
     fi
