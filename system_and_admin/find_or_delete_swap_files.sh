<<Documentation
Name            : K.Vignesh Balaji
Date            : 25/08/2021
Description     : A script to delete all the .swp files found in your system or directory
Input           :./19_Assignment.sh /home/emertxe/Desktop/Vikiba/Homework
Output          : Directory exists
                  Current Working Directory: /home/emertxe/Desktop/Vikiba/Homework
                  swap files to be deleted from : Homework 

                  No Swap files present in the Homework directory to delete
Documentation

#!/bin/bash

if [ $# -eq 0 ] #zero argument detector
then
    echo "Since no Directory is passed as a argument, displaying from entire ~/ directory"
    echo
    echo -e "Swap files found : \n`find ~/ -type f -name *.swp`"  #display all the swap file from home directory using find cmd

elif [ $# -eq 1 ] 
then
    if [ -d $1 ]    #condition to detect the directory
    then
        echo "Directory exists"
        cd $1
        echo "Current Working Directory: $PWD"
        
        last_dir=`basename $PWD`                                   #the relative directory from which swap files to be deleted
        echo "swap files to be deleted from : $last_dir "
        echo
        
        swap_files=(`find ../$last_dir -type f -name *.swp`)       #creating an array of found swap files from the given directory
        count=${#swap_files[@]}                                    #no.of array elements
        
        if [ $count -eq 0 ]                                        #condition to detect zero swap files
        then
            echo "No Swap files present in the $last_dir directory to delete"
        else
            find ../$last_dir -type f -name *.swp -delete         #deleting the swap files using find cmd
            echo swap file are deleted from $last_dir if it would have been priorly existing!
        fi

    elif [ -f $1 ]                                                 #condition to detect files 
    then
        echo "ERROR:Given is a file. Please Pass the directory!"
    else
        echo "Given Directory $1 does not exists"
    fi
else
    echo "ERROR:Pass only one Directory at a time!"
fi
