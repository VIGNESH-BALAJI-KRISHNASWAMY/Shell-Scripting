<<Documentation
Name            : KVB
Date            : 13/08/2021
Description     : A script to print chess board
Input           : ./11_Assignment.sh 
Output          : 10101010
                  01010101
                  10101010
                  01010101
                  10101010
                  01010101
                  10101010
                  01010101

Documentation

#!/bin/bash

    for row in `seq 8`    #loop for row
    do
        for col in `seq 8`  #loop for column
        do
            var=`echo "$(($row + $col))%2"|bc`  #condition to choose betwwen 1's and 0's
            if [ $var -eq 0 ]                   #if sum of row and column is even then print 1 else 0
            then
                echo -e -n " \e[40m " " "     # echo -e 1
            else
                echo -e -n " \e[47m " " "     # echo -e 0
            fi
        done
        echo -e " \e[0m " " "
    done

