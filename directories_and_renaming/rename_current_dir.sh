<<Documentation
Name            : K.Vignesh Balaji
Date            : 22/08/2021
Description     : A script to rename current working directory with given name.
Input           :  ./15_Assignment.sh Name_Assigned
 Output         : Before execution of renaming the present working directory is : 
                 /home/emertxe/Desktop/dir_fr_ass14/dir1/new_folder/my_name_changed

                 After execution of renaming the present working directory is : 
                 /home/emertxe/Desktop/dir_fr_ass14/dir1/new_folder/Name_Assigned
Documentation

#!/bin/bash

dir_new_name=$1
dir_present_name=`basename $PWD`

if [ $dir_new_name =  $dir_present_name ]
then
    echo "ERROR:Both the current and new names are similar!"
    echo
else
    echo "Before execution of renaming the present working directory is : "
    pwd
    echo
   mv $PWD ../$dir_new_name
   cd ../
   cd $dir_new_name

   echo "After execution of renaming the present working directory is : "
   pwd
   echo
fi
