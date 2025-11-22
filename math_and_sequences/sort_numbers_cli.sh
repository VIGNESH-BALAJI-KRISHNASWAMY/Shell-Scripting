<<Documentation
Name            : K.Vignesh Balaji
Date            : 19/08/2021
Description     : A script to sort a given number in ascending or descending order.
Input           : ./12_sorting.sh  a 0 9 4 8 19 15 35 47 2 001 012 0045
Output          : The Ascending Order is:	  0 001 2 4 8 9 012 15 19 35 0045 47
Documentation

#!/bin/bash

var='^[+]?[a-z]?[A-Z]?+$' #variable to check whether the first element of array is a character to decide ascending or descending order

array=($@)                #store the CLA's in the array
                       
num_len=$(($#-1))         #num of integers will always be less than the array length by 1 as the first element will be a character.
                        
arr_len=$#                #find the array length.
                        

if [[ $1 =~ $var ]]       #condition to check passed first element is a variable.  
then
    if [ $1 = a -o $1 = A ]  #condition for Ascending order   
    then
        for fixed in `seq $num_len`         #Loop 1 acts as a fixed position until the iterations in the dynamic loop completed.
        do
            for dynamic in `seq $num_len`   #Loop 2 updates the fixed position dynamically in each of its iteration.
            do
                    if [ ${array[$fixed]} -lt ${array[$dynamic]} ]  #Ascending order condition.
                    then
                        temp=${array[$dynamic]}
                        array[$dynamic]=${array[$fixed]}
                        array[$fixed]=$temp
                    fi
            done
        done
        echo
       echo -e "The Ascending Order is:\t`echo ${array[@]}|cut -d" " -f2-$arr_len` " #printing the ascending order after removing the initial conditional character.
       echo
   elif [ $1 = d -o $1 = D ]
   then
       for fixed in `seq $num_len`
          do
              for dynamic in `seq $num_len`
              do
                  if [ ${array[$fixed]} -gt ${array[$dynamic]} ] #Descending order condition
                  then
                      temp=${array[$dynamic]}
                      array[$dynamic]=${array[$fixed]}
                      array[$fixed]=$temp
                   fi
              done
          done
          echo
         echo -e "The Descending Order is:\t`echo ${array[@]}|cut -d" " -f2-$arr_len` "
         echo
     else
         echo "ERROR:Provide \"a or A\" for Ascending Order and \"d or D\" for Descending Order"
         echo
     fi
 else
     echo "ERROR:Please Provide <a or A> for Ascending order or <d or D> for Descending order in the begining of CLA sequence! "
     echo
fi

