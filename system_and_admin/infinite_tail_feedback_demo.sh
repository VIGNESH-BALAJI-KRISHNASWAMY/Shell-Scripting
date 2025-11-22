<<Documentation
Name            : K.Vignesh Balaji
Date            : 24/08/2021
Description     : A Script which uses pipes or redirection to create an infinite feedback loop.
Input           :./24_Assignment.sh 24_file.txt
Output          : Before execution :
                  I am fine.
                  Thank you.
                  After execution :
                  I am fine.
                  Thank you.
                  I am fine.
                  Thank you.
                  .
                  .
                  .
                  .
Documentation

#!/bin/bash

file_passed=$1                                                      #Read the file through CLA.

if [ $# -eq 0 ]                                                     #zero CLA detection
then
    echo "Pass the file as CLA!"
else
    if [ -f $file_passed ]                                          #condition to check given is a file
    then
       echo -e "Before execution :  \n`cat $file_passed`"           #displaying the file before execution using cat cmd
       
       tail -f $file_passed >> $file_passed|tail -f $file_passed    #creating infinite feedback loop using tail -f cmd and piping
       
       echo -e "After execution :  \n`cat $file_passed`"            #displaying the file after execution using cat cmd
    else
        echo "ERROR:File does not exists!"
    fi
fi
