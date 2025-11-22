<<Documentation
Name            : K.Vignesh Balaji
Date            : 25/08/2021
Description     : A script in which album name is given to rename existing album name in a corresponding directory properly by inserting  same  index numbers.
Input           : ./16_Assignment.sh Today
Output          :

Before Executing the script : 
16_Assignment.sh*  Today002.txt  Today004.txt  Tomorrow001.jpg	Tomorrow003.jpg  Tomorrow005.jpg  Tomorrow007.jpg  Tomorrow009.jpg
Today001.txt	   Today003.txt  Today005.txt  Tomorrow002.jpg	Tomorrow004.jpg  Tomorrow006.jpg  Tomorrow008.jpg  Tomorrow010.jpg

After Executing the script :
16_Assignment.sh*  Today001.txt  Today002.txt  Today003.txt  Today004.txt  Today005.txt  Today007.jpg  Today009.jpg
Today001.jpg	   Today002.jpg  Today003.jpg  Today004.jpg  Today005.jpg  Today006.jpg  Today008.jpg  Today010.jpg
Documentation

#!/bin/bash

new_name=$1                                     #new name passed as argument which is to be assigned to the current jpg files 

if [ $# -eq 1 ]                                 #condition to check zero argument.
then
    echo "Before Executing the script : " 
    ls -F                                       #displaying the content of current directory before execution
        for file in `ls *.jpg`
        do
            num=`echo $file|tr -cd [:digit:]`   #extracting numbers present along with the old name of jpg files using tr and echo cmd
            mv $file $new_name$num.jpg          #renaming the jpg file present in the current directory with new name and the old...
        done                                        #...number using mv cmd
    echo
    echo "After Executing the script :"
    ls -F                                       #displaying the content of current directory after execution
else
    echo "Please provide New Name for the Album"
fi
