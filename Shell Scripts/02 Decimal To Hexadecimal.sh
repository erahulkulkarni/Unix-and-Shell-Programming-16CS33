#!/bin/sh
#Question: 
# Write a shell script to to accept a integer from the terminal and convert to
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
#      use calculator bc , to find base 16 representation of entered bsae 10 number
#      And enclose in backquote ` ` to imply its commands and not just string

  hexNum=` echo "obase=16; $num" | bc `

  echo "$num in base 10 = $hexNum in base 16"
