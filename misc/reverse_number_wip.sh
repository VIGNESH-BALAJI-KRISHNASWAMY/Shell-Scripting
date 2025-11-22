<<Documentation
Name            : Vignesh Balaji
Date            : 11/09/2021
Description     : Reversing a number given in command line argument.
Input           :
Output          :
Documentation

#!/bin/bash

arr=($@)
var='^[+-]?[0-9]?[.]?[0-9]?+$' 



rev=0
for arg in `seq $#`
do
    num=${arr[$arg-1]}
    num_len=${#arr[$arg-1]}
    echo $num_len
    for len in seq $num_len
    do 
        if [ $((temp)) -gt 10 ]
        then 
        temp=$((num % 10))
        num=$((num / 10))
        rev=$(($((rev * 10)) + $temp))
    else
        rev=$rev + $temp
    fi
    done
    echo $rev
    rev=0
    num=0
    temp=0
    echo
done
