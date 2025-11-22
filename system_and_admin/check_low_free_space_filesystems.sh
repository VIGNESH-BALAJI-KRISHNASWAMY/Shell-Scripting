<<Documentation
Name            : K.Vignesh Balaji
Date            : 18/08/2021
Description     : Display the names of any file-system which have less than 10% free space available
Input           : ./29_Assignment.sh
Output          : All file-systems are having free space greater than 10%
Documentation

#!/bin/bash

file_system=(`df |tr -s " "|cut -d" " -f1`)           #creating array of filesystem and used space using df,tr and cut cmd
used_space=(`df |tr -s " "|cut -d" " -f5|tr -d "%"`)  
no_pass_case=0

length=${#file_system[@]}                             #finding the length of array created

for index in `seq $((length))`        #since first element stored in all array is the "heading of df command", the loop...              
do                                          #...neglects its first iteration.
    
    if [ $((${used_space[$index]})) -gt 90 ]          #condition to detect filesystem having space less than or equal to 10%. 
    then
        echo "File system ${file_system[$index]} has only $((100-${used_space[$index]}))% of space left"
        no_pass_case=1
    fi
done

if [ $no_pass_case -eq 0 ]
then
    echo "All file-systems are having free space greater than 10%"
fi
