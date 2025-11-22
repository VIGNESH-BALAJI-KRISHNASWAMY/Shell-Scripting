<<Documentation
Name            : K.Vignesh Balaji
Date            : 13/08/2021
Description     : Read 'n' and generate a pattern given.
Input           : Enter the number of lines needed to be printed : 3e
Output          : Enter only positive integer's of range: 2 < number < 2^5
Documentation

#!/bin/bash

echo "
Type of pattern to be printed      1
                                   2  3
                                   4  5  6
       
     "

read -p "Enter the number of lines needed to be printed : " num
 
range=`echo "2^5"|bc`     #setting the range
var='^[+]?[0-9]+$'        #error detecting variable to detect the error input
  
if [[ $num =~ $var ]]
then
      if [ $num -le 2 -o $num -gt $((range-1)) ]
      then
          echo "Error : Number out of range, Please enter 2 < number < 2^5"
      else
          inc=0
          for row in `seq $num`        #Loop for Row
          do
              for col in `seq $row`    #Loop for column which runs only when column <= row
              do
                inc=$((inc + 1))       #increment the content of the matrix by 1 for each iteration of column, happening in row iteration.
                echo -n "$inc "
              done
              echo                     #space for next row
          done
      fi
else
    echo "Enter only positive integer's of range: 2 < number < 2^5"
fi

