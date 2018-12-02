#!/bin/sh
#Question: 
# Write a shell script to accept a integer from the terminal and convert to
#   hexadecimal number. Number 255 in decimal = FF in hexadecimal, that is convert
#   a base 10 number to base 16. In base 10 digits are from 0 to 9. In base 16 
#   digits are from 0 to 9 and then followed by A(which represents 10), B(is 11) 
#   till F(is 15). 

# Always write assumptions made, either as comment or as description
# and keep the rough work, do not erase it out

#  accept a integer from the terminal
  echo "Enter an integer: "
  read num

#      Its shell script, use $ to get value of variable , 
#      use calculator bc , to find base 16 representation of entered base 10 number
#      And enclose in backquote ` ` to imply its command and not just a string

  hexNum=` echo "obase=16; $num" | bc `

  echo "$num in base 10 = $hexNum in base 16"

# OR 
# using while loop

  temp=$num  # save a copy of number
  hexNum=""  # initialize hexadecimal to empty string
  while [ $temp -ne 0 ] #while number not 0, divide by 16, remainder is digit in 
    do # number's hexadecimal representation, append remainder to a hex number  
      remainder=` expr $temp % 16 `  # get last digit in remainder
      temp=` expr $temp / 16 `       # then exclude last digit from number
      case $remainder in   # append digit to known hex number so far
          [0-9]) hexNum=`echo "$remainder$hexNum"`;; 
             10) hexNum=`echo "A$hexNum"`;;
             11) hexNum=`echo "B$hexNum"`;;
             12) hexNum=`echo "C$hexNum"`;;
             13) hexNum=`echo "D$hexNum"`;;
             14) hexNum=`echo "E$hexNum"`;;
             15) hexNum=`echo "F$hexNum"`;;                                
      esac
    done

  echo "$num in base 10 = $hexNum in base 16"
