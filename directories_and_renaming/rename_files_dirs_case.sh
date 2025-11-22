<<Documentation
Name            : K.Vignesh Balaji 
Date            : 22/08/2021
Description     : A script to rename a file/directory replaced by lower/upper case letters.
Input           : ./14_Assignment.sh
Output          : Content of the present working directory before the renaming operation :  14_Assignment.sh dir/ file1.txt

                  mv: 'file1.txt' and 'file1.txt' are the same file
                  Files are renamed in lowercase and directories are renamed in upper case

                  Content of the present working directory after the renaming operation :  14_assignment.sh DIR/ file1.txt
Documentation

#!/bin/bash

echo -e "Content of the present working directory before the renaming operation : " `ls -F`
echo
for file_dir in `ls`        #Loop to iterate the contents of the present working directory.
do
    if [ -f $file_dir ]     #condition to check passed is a file
    then
        new_name=`echo "$file_dir"|tr [:upper:] [:lower:]`      #new name is created for the file using tr command
        mv $file_dir $new_name                                  #current name of file is renamed with the new name
        
    elif [ -d $file_dir ]   #condition to check passed is a directory
    then
        new_name=`echo "$file_dir"|tr [:lower:] [:upper:]`      #new name is created for the directory using tr command
        mv $file_dir $new_name                                  #current name of directory is renamed with the new name
       
    fi
done
echo "Files are renamed in lowercase and directories are renamed in upper case"
echo
echo -e "Content of the present working directory after the renaming operation : " `ls -F`


