<<Documentation
Name            : KVB
Date            : 12/08/2021
Description     : Deleting Empty lines
Input           : ./7_Assignment.sh 7_Ass_file.txt
Output          : File is existing
                  File has executable permission
                  Empty lines are deleted permanently and is reflected in the file
Documentation

#!/bin/bash


if [ $# -eq 0 ]     #checks for zero arguments
then
    echo "No file is Passed as a argument"
else
    if [ -d $1 ]     #check whether passed is a directory
    then
        echo "Given is a Directory, please provide a file"
    else
        if [ -e $1 ] #to check if the file is existing
        then
            echo "File is existing"
                if [ -x $1 ] #check the file has executable permission
                then
                    echo "File has executable permission"
                else
                    echo "Please provide the executable permission"
                fi
        else
            echo "File is not existing"
        fi
        if [ -f $1 ] #if the file exists then remove the empty line through stream editor option.
        then
            sed -i '/^$/d' $1
            echo "Empty lines are deleted permanently and is reflected in the file"
        fi
     fi
 fi



