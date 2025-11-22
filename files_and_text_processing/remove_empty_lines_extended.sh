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
            file_words=`cat $1 |wc -w`  #count the number of words in a file passed
            if [ $file_words -ne 0 ]    #codition to check the file is empty or not
            then
                    sed -i "/^\s*$/d" $1     #condition to remove the empty lines due to spaces and tabs
                    sed -i '/^$/d' $1        #condition to remove normal empty lines
                 
                 echo "Empty lines are deleted permanently and is reflected in the file"
            else
                echo "File is Empty!"
            fi
        fi
     fi
 fi



