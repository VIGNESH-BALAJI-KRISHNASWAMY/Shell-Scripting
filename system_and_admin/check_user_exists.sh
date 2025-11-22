<<Documentation
Name            : K.Vignesh Balaji
Date            : 18/08/2021
Description     : A script to search a user present in your system
Input           : ./32_Assignment.sh root
Output          : The given User name "root" is present!
Documentation

#!/bin/bash

if [ $# -eq 0 ]     #zero argument condition check
then
    echo "ERROR:No User name is passed as a argument!"
else
    user_name=(`cat /etc/passwd|cut -d: -f1`)       #an array of username using cat and cut command
    num_users=${#user_name[@]}                      #fnding length of the array
    check_usr_name=$1                               #username to be found out in the array
   
        for var in `seq $num_users`                 #Loop to traverse every element in an array
        do
            if [ $check_usr_name = ${user_name[$var-1]} ]   #if the given username is present in the array then out_set is set to 1
            then
                out_set=1
            fi
        done
    
    if [ $((out_set)) -eq 1 ]                       #printing the output based on the out_set variable
    then
        echo "The given User name \"$check_usr_name\" is present!"
        out_set=0
    else 
        echo "The given User name \"$check_usr_name\" is not present!"
    fi
fi
