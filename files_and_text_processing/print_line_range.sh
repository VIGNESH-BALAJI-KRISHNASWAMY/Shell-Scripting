<<Documentation
Name            : K.Vignesh Balaji
Date            : 17/08/2021
Description     : A script to print contents of file from given line number to next given number of lines.
Input           : ./17_Assignment.sh 1 4 17_Ass_file.txt 
Output          : File Exists
                  File has executable permission
                  The lines of the file 17_Ass_file.txt from 1 to 4 is: 
                  hai
                  my
                  name 
                  is
Documentation

#!/bin/bash

var='^[+]?[0-9]+$'          #error detector variable

if [ $# -lt 3 -o $# -ge 4 ] #condition for appropriate CLA
then
    echo "Inappropriate arguments passed! Pass three arguments <start_line> <no.of_line> <file_name>"
else
    if [ -f $3 ]            #check whether the file exists if so then start the operation by setting start_oper=1
    then
        echo "File Exists"
        start_oper=1
        if [ -x $3 ]
        then
            echo "File has executable permission"
        else
            echo "File has no executable permission!"
        fi
    else
        echo "File doesn't exists!"
    fi
    
    if [ $((start_oper)) -eq 1 ]
    then
        if [[ ($1 =~ $var) && ($2 =~ $var) ]]       #error correction condition if passed CLA is other than integers
        then
            line_length=`wc -l $3| cut -d" " -f1`       #calculate the total line length of a file
            if [ $line_length -eq 0 ]
            then
                 echo "The given file $1 is empty"
            elif [ $line_length -lt $1 ]            #condition that detect if file has minimum lines
            then
                 echo "The given file $3 has only $line_length lines. Hence the lines from line:$1 to line:$(($1+$2-1)) cannot be printed!"
            elif [ $line_length -ge $(($1+$2-1)) ]  
            then
                 lines=`cat $3 | head -$(($1+$2-1)) | tail -$2` #line5= head -5 $1 |tail -1  #condition that crops the required amount of line.
                 echo -e "The lines of the file $3 from $1 to $(($1+$2-1)) is: \n$lines"
            else
                 echo "The file $3 has only $line_length lines.Hence the lines from line:$(($line_length+1)) to line:$(($1+$2-1)) cannot be printed!"
             fi
         else
            echo "provide only positive Numeric argumnets e.g <start_line> <no.of_line> <filename>"
        fi
    fi
fi
