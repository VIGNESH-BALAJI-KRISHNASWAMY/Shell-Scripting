<<Documentation
Name            : K.Vignesh Balaji
Date            : 17/08/2021
Description     : A script for generating random 8-character passwords including alpha numeric characters.
Input           : ./20_Assignment.sh 
Output          : The New Password Created is : 'u7 >/[#

Documentation

#!/bin/bash

password=`cat /dev/urandom | tr -cd [:print:] | head -c8` #open the /dev/random and complement delete the printable alpha numeric characters and print any 8 characters to form a password.
echo "The New Password Created is : $password"
