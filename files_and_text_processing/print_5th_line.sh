<<Documentation
Name            : K.Vignesh Balaji
Date            : 17/08/2021
Description     : A Script to print the 5th line of a file passes through command line.
Input           : ./23_Assignment.sh 23_Ass_file.txt 
Output          : File Exists
                  File has executable permission
                  The fifth line of the file 23_Ass_file.txt is :  i am from tamilnadu
Documentation

#!/bin/bash


if [ $# -eq 0 ]
then
    echo "ERROR:No File is passed!"
else
    if [ -f $1 ]
    then
        echo "File Exists"
        if [ -x $1 ]
        then
            echo "File has executable permission"
            line_length=`wc -l $1| cut -d" " -f1`
            if [ $line_length -eq 0 ]
            then
                echo "ERROR:The given file $1 is empty"
            elif [ $line_length -lt 5 ]
            then
                echo "ERROR:The given file $1 has only $line_length lines. Hence 5th line cannot be printed!"
            elif [ $line_length -ge 5 ]
            then
                line5=`cat $1 | head -5 | tail -1` #line5= head -5 $1 |tail -1
                echo "The fifth line of the file $1 is :  $line5"
            fi
        else
            echo "File has no executable permission!"
        fi
    else
        echo "ERROR:File doesn't exists!"
    fi
fi
