<<Documentation
Name            :
Date            :
Description     :Square of a number
Input           :
Output          :
Documentation

#!/bin/bash

read -p "Enter a number to square: " num
var=`echo "scale=3;($num^2)"|bc`
echo The square of $num is $var.
