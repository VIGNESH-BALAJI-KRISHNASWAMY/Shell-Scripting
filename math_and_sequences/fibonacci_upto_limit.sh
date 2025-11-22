<<Documentation
Name            : K.Vignesh Balaji
Date            : 13/08/2021
Description     : A script to read 'n' and generate Fibonacci numbers <= n
Input           : Enter the maximum limit till which Fibnocci terms is to be calculated : 89
Output          :  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89.
Documentation

#!/bin/bash


var='^[+-]?[0-9]+$'
read -p "Enter the maximum limit till which Fibnocci terms is to be calculated : " num

if [[ $num =~ $var ]]                                   #condition to check the error input
then
        if [ $num -eq 0 ]                               #if input is 0 then the program stops with a prompt
        then
            echo "The first $num th fibnocci term is : 0"
        elif [ $num -lt 0 ]
        then
            echo "Please provide only positive limit !"
        else
            current=0                                   #initializing the variable to be used in the loop.
            previous=1
            for i in `seq $((num))`                     #loop that iterate the addition.
            do
                if [ $((next)) -le $num ]               #if the number exceeds the max limit provided then loop stops
                then
                     next=$(($previous+$current))       
                     previous=$current                  #though previous is set to 1 initially, this condition is to start the sequence from 0. 
                     current=$next
                     echo -n -e " $previous"
                     if [ $current -le $num ]           #condition for presentation.(comma and fullstop in sequence)
                     then
                     echo -n ","
                     else
                         echo -n "."
                     fi
                 fi 
             done
         fi
             echo
else
    echo "Please provide only Numeric Values !"

fi
