<<Documentation
Name            : K.Vignesh Balaji
Date            : 18/08/2021
Description     : A script to determine whether a given file system or mount point is mounted.
Input           : ./26_Assignment.sh udev  
Output          : File-system udev is mounted on /dev  and it is having 0% used space with 482120 KB free.
Documentation

#!/bin/bash

cla_passed=$1

if [ $# -eq 1 ]             #condition to check whether argument is passed
then
    file_system=(`df |tr -s " "|cut -d" " -f1`)     #array for contents of filesystem using df,tr and cut cmd
    avail_space=(`df |tr -s " "|cut -d" " -f4`)     #array for contents of available space  using df,tr and cut cmd
    used_percent=(`df |tr -s " "|cut -d" " -f5`)    #array for contents of used space using df,tr and cut cmd
    mounte_on=(`df |tr -s " "|cut -d" " -f6`)       #array for contents of mount on using df,tr and cut cmd

    len_file_system=${#file_system[@]}              #finding the length of the file system

    for position in `seq $len_file_system`          #Loop to traverse the content of filesystem array and check whether passed argument is present.
    do
        if [ $1 = ${file_system[$position -1]} ]
        then
            out_set=1                              #if passed argument is present then print the respective index position of each array..
            index=$(($position -1))                 #...content to display the message 
        fi
    done
           
    if [ $((out_set)) -eq 1  ]                      #out_set would have been set if provided argument is present in the filesystem.
    then
       echo "File-system $1 is mounted on ${mounte_on[$index]}  and it is having ${used_percent[$index]} used space with ${avail_space[$index]} KB free."
    else
       echo "$1 is not mounted"
    fi
else
    echo "Error : Please pass the name of the file-system through command line."
    
fi
