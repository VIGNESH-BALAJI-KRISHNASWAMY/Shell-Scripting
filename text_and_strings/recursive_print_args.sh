<<Documentation
Name            : K.Vignesh Balaji
Date            : 23/08/2021
Description     : A Script which uses a recursive function to print each argument passed to the function.
Input           : ./25_Assignment.sh How are you? 
Output          : How
                  are
                  you?
Documentation

#!/bin/bash

arr=($@)                    #creating an array of given command line arguments


function display() {        #function definition

    echo $arr               #displaying first array element(0th position)
   
    arr=(${arr[@]:1})       #using offset to remove first element of array and store it again in the same array.

    length=${#arr[@]}
    
    if [ $length -ne 0 ]    #condition to detect that array elements are zero
    then
        display ${arr[@]}   #recursive function call
    fi
}
display ${arr[@]}           #first function call
