<<Documentation
Name            :
Date            :
Description     : For,while,fibbnoci terms until a number
Input           :
Output          :
Documentation

#!/bin/bash

read -p "Enter the maximum number till which Fibnocci terms is to be calculated : " num
if [ $num -eq 0 ]
then
    echo "The first $num th fibnocci term is : 0"
else

current=0
previous=1
for i in `seq $((num))`
 do
     if [ $((next)) -le $num ]
    then
     next=$(($previous+$current))
     previous=$current
     current=$next
    echo -n -e "\t$previous"
  fi 
 done
echo
fi

 
