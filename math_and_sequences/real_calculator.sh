<<Documentation
Name            :
Date            :
Description     : Assignment 4. Arithmetic operations on Real Numbers
Input           :
Output          :
Documentation

#!/bin/bash

read -p "Enter \"two numbers\" and \"an operator\" to perform the arithmetic operation \"number1 operator number2\" : " num1 op num2 
case $op in
  +)
      sum=`echo "scale=5;$num1+$num2"|bc`
      echo The Sum of $num1 and $num2 is $sum
      ;;
  -)
      diff=`echo "$num1-$num2"|bc`
      echo The Difference between $num1 and $num2 is $diff
      ;;
 /)
      div=`echo "scale=5;$num1/$num2"|bc`
      echo The division of $num1 by $num2 is $div
      ;;
 \*)
      pro=`echo "$num1*$num2"|bc`
      echo The product of $num1 and $num2 is $pro
      ;;
  *)
      echo Provide a correct operator
 esac
