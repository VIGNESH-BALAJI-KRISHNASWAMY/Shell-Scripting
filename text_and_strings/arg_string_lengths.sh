<<Documentation
Name            : K.Vignesh Balaji
Date            : 13/08/2021
Description     : A script to print the length of each and every string using arrays.
Input           : ./10_Assignment.sh   Hey Buddy 
Output          : Length of string (Hey) is :         	3
                  Length of string (Buddy) is :         5 
Documentation

#!/bin/bash


arr=($@)     #creating the array of CLA'S passed

    if [ $# -eq 0 ]                             #check whether the argument is empty
    then
        echo "Please provide the stings!"
    else

        for str in `seq $#`                     #loop to switch next string in array of command line arguments.
        do
            len=${#arr[$str-1]}                 #calculate the length of the string
            str_var=${arr[$str-1]}              #identifies the string in array of cla
            echo -e "Length of string ($str_var) is :         \t$len"
        done
    fi
  
