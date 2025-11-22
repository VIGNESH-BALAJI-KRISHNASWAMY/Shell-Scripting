<<Documentation
Name            : K.Vignesh Balaji
Date            : 16/08/2021
Description     : BMI
Input           : 	        BMI Calculation
                    Enter the weight in Kg : 60
                    Enter the Height in m : 1.76
Output          :   The BMI is : 19.36983
                    For the given information, the person is: Normalweight
Documentation

#!/bin/bash

var='^[+]?[0-9]?[.]?+[0-9]+$'

echo -e "\tBMI Calculation"                            
read -p "Enter the weight in Kg : " weight             #getting the inputs
read -p "Enter the Height in m : "  height

if [[ $weight =~ $var ]]                               #condition to check whether given input is a number.Ifnot else condition is printed
then
    if [[ $height =~ $var ]]
    then
        bmi=`echo "scale=5;$weight/$height^2"|bc`      #BMI = weight in kg/ height in m square.
        echo "The BMI is : $bmi"
        if [ `echo "$bmi > 30"|bc` -eq 1 ]
        then 
            echo "For the given information, the person is: Obese"              #condition for result of BMI for a person.
        elif [ `echo "$bmi > 25"|bc` -eq 1 -a `echo "$bmi < 30"|bc` -eq 1 ]
        then 
            echo "For the given information, the person is: Overweight" 
        elif [ `echo "$bmi > 18.5"|bc` -eq 1 -a `echo "$bmi < 25"|bc` -eq 1 ] 
        then
            echo "For the given information, the person is: Normalweight"
        elif [ `echo "$bmi < 18.5"|bc` -eq 1 ]
        then
            echo "For the given information, the person is: \"Lean\""
        fi

    else
        echo "Provide Height and Weight only as a Number!"
    fi
else
    echo "Provide Weight only as a Number!"
fi
