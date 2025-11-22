<<Documentation
Name            : K.Vignesh Balaji
Date            : 18/08/2021
Description     : A script to print the following:
                    • Currently logged users
                    • Your shell directory
                    • Home directory
                    • OS name & version
                    • Current working directory
                    • Number of users logged in
                    • Show all available shells in your system
                    • Hard disk information
                    • CPU information.
                    • Memory information.
                    • File system information.
                    • Currently running process
Input           : Enter 
Output          :   1.Currently logged users
                    2.Your shell directory
                    3.Home directory
                    4.OS name & version
                    5.Current working directory
                    6.Number of users logged in
                    7.Show all available shells in your system
                    8.Hard disk information
                    9.CPU information.
                    10.Memory information.
                    11.File system information.
                    12.Currently running process 
                     to display the respective content : 1
                    currently logged user(/'s) is(/are) : 
                    emertxe
                    Do you want to continue y/n : n
Documentation

#!/bin/bash
character="y"       #declaring a character to enter while loop

while [ $character = "y" ]
do
    read -p "Enter 
1.Currently logged users
2.Your shell directory
3.Home directory
4.OS name & version
5.Current working directory
6.Number of users logged in
7.Show all available shells in your system
8.Hard disk information
9.CPU information.
10.Memory information.
11.File system information.
12.Currently running process 
 to display the respective content : " num
 echo

 case $num in               #case to select the appropriate function to run.
     1) user=`whoami`
         echo -e "currently logged user(/'s) is(/are) : \n$user"
         echo ;;
     2) shell_dir=`echo $SHELL`
         echo -e "Shell Directory is : \n$shell_dir" 
         echo ;;
     3) home=`echo $HOME`
         echo -e "Home directory is : \n$home"
         echo ;;
     4) os=`uname -v`
         echo -e "OS name and Version : \n$os"
         echo ;;
     5) current=`pwd`
         echo -e "current working directory is : \n$current"
         echo ;;
     6) num_user=`who -q`
         echo -e "Number of users logged in is: \n$num_user"
         echo ;;
     7) all_shells=`cat /etc/shells`
         echo -e "Available shells are:  \n$all_shells"
         echo ;;
     8) hd_info=`df -h`
         echo -e "Hard disk information :\n$hd_info"
         echo ;;
     9) cpu_info=`cat /proc/cpuinfo`
         echo -e "cpu info : \n$cpu_info"
         echo ;;
     10) mem_info=`cat /proc/meminfo`
         echo -e "mem info : \n$mem_info"
         echo ;;
     11) fs_info=`df`
         echo -e "file system info : \n$fs_info" 
         echo ;;
     12) cur_run_pro=`ps`
         echo -e "current running process : \n$cur_run_pro"
         echo ;;
     *)
         echo "please provide the number within the range"
 esac

 read -p "Do you want to continue y/n : " character   #deciding variable that decides the loop should run or not
 done
 exit

