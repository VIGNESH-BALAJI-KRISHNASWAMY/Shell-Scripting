<<Documentation
Name            : K.Vignesh Balaji
Date            : 17/08/2021
Description     : Greeting based on time
Input           : Appended this file along with its path to bashrc file in home.
Output          : Good Morning! Have a nice day :)
                  This is Tuesday 17 in August of 2021 (11:16:51 AM)
Documentation

#!/bin/bash

time=`date +%R|cut -d: -f1`

day=`date +%A` 
date=`date +%d`
month=`date +%B`
year=`date +%Y`
watch_clock=`date +%r|cut -c1-11`
am_pm=`date +%r | cut -c10-11`

hour=`date +%H` #getting 24 hour format.
dec=`echo $((10#$hour))` #condition to make octal representation as decimal eg.08 to 8. if not throws error for hours from 8 AM to 9.59 AM

if [ $((dec)) -ge 5 -a $((dec)) -lt 12 ] #condition to check what the time is, and print the greeting accordingly
then
    echo "Good Morning! Have a nice day :)"
elif [ $((hour)) -ge 12 -a $((hour)) -lt 14 ]
then
    echo "Good Noon! "
    elif [ $((hour)) -ge 14 -a $((hour)) -lt 17 ]
    then
        echo "Good Afternoon!"
        elif [ $((hour)) -ge 17 -a $((hour)) -le 21 ]
        then
            echo "Good Evening"
            elif [ $((dec)) -gt 21 -o $((dec)) -lt 5 ]
            then
                echo "Good Night! "
            fi

            echo "This is $day $date in $month of $year ($watch_clock) "
