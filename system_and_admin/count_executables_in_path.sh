<<Documentation
Name            : K.Vignesh Balaji
Date            : 23/08/2021
Description     : A script in which, for each directory in the $PATH, display the number of executable files in that directory
Input           : ./31_Assignment.sh 
Output          :   current Directory : /usr/local/sbin
                    current count for executable files in /usr/local/sbin is : 0

                    current Directory : /usr/local/bin
                    current count for executable files in /usr/local/bin is : 0

                    current Directory : /usr/sbin
                    current count for executable files in /usr/sbin is : 165

                    current Directory : /usr/bin
                    current count for executable files in /usr/bin is : 1225

                    current Directory : /sbin
                    current count for executable files in /sbin is : 152

                    current Directory : /bin
                    current count for executable files in /bin is : 142

                    current Directory : /usr/games
                    current count for executable files in /usr/games is : 1

                    current Directory : /usr/local/games
                    current count for executable files in /usr/local/games is : 0

                    current Directory : /opt/microchip/xc8/v2.20/bin
                    current count for executable files in /opt/microchip/xc8/v2.20/bin is : 6

                    current Directory : /opt/microchip/xc8/v2.20/bin
                    current count for executable files in /opt/microchip/xc8/v2.20/bin is : 6

                    Total number of executable files present are : 1697
Documentation

#!/bin/bash

arr=(`echo $PATH |tr : '\n'`) #finding path to executable files using $PATH command and store in a array arr after splitting using tr cmd

inc=0                                       #Declaring variables
tot_cnt=0

for path in ${arr[@]}                       #Loop to access the path directories stored in the array arr. 
do
    if [ -d $path  ]                        #condition to check whether passed is a diarectory
    then
        cd $path                            #change directory if passed is a valid directory      
        for exe_file in `ls`                #Loop to access the files in the current working directory
        do
            if [ -x $exe_file ]             #condition to check whether the passed file is executable
            then
                inc=$((inc + 1))            #count the number of executable files in that directory
            fi
        done
        echo "current Directory : "$path
        echo "current count for executable files in $path is : $inc"
        echo
    fi
    tot_cnt=$((tot_cnt + inc))              #Add the number of executable files in each directory.
    inc=0                                   #resetting count for next iteration
done

echo "Total number of executable files present are : $tot_cnt"
