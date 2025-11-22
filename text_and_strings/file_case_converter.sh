<<Documentation
Name            : K.Vignesh Balaji
Date            : 18/08/2021
Description     : A Shell script to convert string lower to upper and upper to lower.
Input           : ./22_Assignment.sh 22_Ass_file.txt 
Output          : File Exists
                  1. Lower case to Upper case 
                  2. Upper case to Lower case 
                  Please select the option : 1
                  HAI
                  MY NAME
                  IS
                  I
                  AM
                  FROM
Documentation

#!/bin/bash


if [ $# -eq 0 ]                             #condition to detect zero argument case
then
    echo "Please pass the file as argument"
else
    if [ -f $1 ]                            #codition to detect if passed file exists
    then
        echo "File Exists"
        if [ -s $1 ]                        #condition to detect if passed file is empty
        then   
            echo -e "1. Lower case to Upper case \n2. Upper case to Lower case "
            read -p "Please select the option : " num
                     if [ $num -eq 1 ]
                     then
                        cat $1 | tr [:lower:] [:upper:]    #tr command to translate the content in passed file to upper case
                     else
                        cat $1 | tr [:upper:] [:lower:]    #tr command to translate the content in passed file to lower case
                     fi
         else
              echo "File is empty"
         fi
     else
         echo "File don't exists!"
     fi
 fi
