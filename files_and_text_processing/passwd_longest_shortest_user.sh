<<Documentation
Name            : K.Vignesh Balaji
Date            : 18/08/2021
Description     : A script to display the longest and shortest user-names on the system.
Input           :  ./18_Assignment.sh 
Output          :  The Longest Username is:	gnome-initial-setup
                   The Shortest Username is:	lp
Documentation

#!/bin/bash

user_name=(`cat /etc/passwd|cut -d: -f1`) #an array of username is created
num_users=${#user_name[@]}                #length of the array is calculated


lar_usr_name=${user_name[0]}              #initializing the first position of an array for comparision purpose
short_usr_name=${user_name[0]}

for var in `seq $num_users`
do
    if [ ${#lar_usr_name} -lt ${#user_name[$var-1]} ]   #compare initialized array element with all elements of array and swap if large
    then
        lar_usr_name=${user_name[$var-1]}
    fi
    if [ ${#short_usr_name} -gt ${#user_name[$var-1]} ] #compare initialized array element with all elements of array and swap if small
    then
        short_usr_name=${user_name[$var-1]}
    fi
done

echo -e  "The Longest Username is:\t$lar_usr_name"
echo -e  "The Shortest Username is:\t$short_usr_name"
