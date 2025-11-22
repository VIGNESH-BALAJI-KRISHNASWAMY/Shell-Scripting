<<Documentation
Name            : K.Vignesh Balaji
Date            : 23/08/2021
Description     : A script to lock down file permissions for a particular directory.
Input           : ./28_Assignment.sh /home/emertxe/Desktop/Vikiba/Classwork/23_08_2021/28_ASS_Dir/
Output          : Directory Exists
                  Current Working Directory : /home/emertxe/Desktop/Vikiba/Classwork/23_08_2021/28_ASS_Dir
                  Listing the Contents of 28_ASS_Dir : 

                  Before Locking the Group and User Permissions : 
                  total 12K
                  drwxr-xr-x 2 emertxe emertxe 4.0K Aug 23 10:26 directory1
                  drwxr-xr-x 2 emertxe emertxe 4.0K Aug 23 10:26 directory2
                  drwxr-xr-x 2 emertxe emertxe 4.0K Aug 23 10:26 directory3
                  -rwx--x--x 1 emertxe emertxe    0 Aug 23 10:25 file1.txt
                  -rwx--x--x 1 emertxe emertxe    0 Aug 23 10:25 file2.txt
                  -rwx--x--x 1 emertxe emertxe    0 Aug 23 10:25 file3.txt

                  After Locking the Group and User Permissions : 
                  total 12K
                  drwxr-xr-x 2 emertxe emertxe 4.0K Aug 23 10:26 directory1
                  drwxr-xr-x 2 emertxe emertxe 4.0K Aug 23 10:26 directory2
                  drwxr-xr-x 2 emertxe emertxe 4.0K Aug 23 10:26 directory3
                  -rwx------ 1 emertxe emertxe    0 Aug 23 10:25 file1.txt
                  -rwx------ 1 emertxe emertxe    0 Aug 23 10:25 file2.txt
                  -rwx------ 1 emertxe emertxe    0 Aug 23 10:25 file3.txt
Documentation

#!/bin/bash

passed_dir=$1

if [ $# -eq 1 ]
then
    if [ -d $passed_dir ]                                       #condition to detect if passed is a directory
    then
        echo "Directory Exists" 
        cd $passed_dir                                          #change the pwd to the passed directory
        echo "Current Working Directory : "$PWD 
        echo "Listing the Contents of `basename $PWD` : "       #displaying from which directory contents are being accessed
        echo
        echo "Before Locking the Group and User Permissions : "
        ls -lh
        for item in `ls`                                        #Loop that traverses the contents of the passed directory
        do
            if [ -f $item ]
            then
                chmod  go-rwx $item                             #mode is being changed for group and others using chmod cmd
            fi
        done
        echo
        echo "After Locking the Group and User Permissions : "
        ls -lh
    else
        echo "ERROR:please pass the absolute path of the directory"
    fi
else
    echo "ERROR:Please pass the directory as CLA"
fi
