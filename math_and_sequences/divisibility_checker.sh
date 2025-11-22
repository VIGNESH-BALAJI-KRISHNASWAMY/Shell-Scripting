<<Documentation
Name            : Vignesh Balaji
Date            : 07-08-2021
Description     : Divisibility by 5
Input           :
Output          :
Documentation

#!/bin/bash

read -p "Enter a number to check its divisibility : " num
read -p "Enter the Divisor to check $num is divisible : " divisor

case $divisor in
    1)
        echo "$num is divisible by $divisor"
        ;;
    2)
        var=`echo $((num % divisor))|bc`
        echo $var
        if [ $var -eq 0 ]
       then
          echo "$num is divisible by $divisor"
      else
         echo "$num is not divisible by $divisor"
     fi
        ;;
    5)
        if [ $(($num%5)) == 0 ]
        then 
            echo divisible
        else
            echo not
        fi
      
esac
