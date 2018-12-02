#!/bin/sh
#Question: 
# Write a shell script to to accept a integer from the terminal and convert to
#   binary number. Number 5 in decimal = 101 in binary(Convert base 10 to base 2).

# Always write assumptions made, either as comment or as description
# and keep the rough work, do not erase it out

#  accept a integer from the terminal
  echo "Enter an integer: "
  read num

#      Its shell script, use $ to get value of variable , 
#      use calculator bc , to find base 2 representation of entered base 10 number
#      And enclose in backquote ` ` to imply its command and not just a string

  binaryNum=` echo "obase=2; $num" | bc `

  echo "$num in base 10 = $binaryNum in base 2"

# OR 
# using while loop

  temp=$num  # save a copy of number
  binaryNum=""  # initialize binary to empty string
  while [ $temp -ne 0 ] #while number not 0, divide by 2, remainder is digit in 
    do # number's binary representation, append remainder to a binary number  
      remainder=` expr $temp % 2 `  # get last digit in remainder
      temp=` expr $temp / 2 `       # then exclude last digit from number
      binaryNum=` echo "$remainder$binaryNum" `
    done

  echo "$num in base 10 = $binaryNum in base 2"
