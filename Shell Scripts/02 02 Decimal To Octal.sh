#!/bin/sh
#Question: 
# Write a shell script to to accept a integer from the terminal and convert to
#   octal number. Number 21 in decimal = 25 in octal(Convert base 10 to base 8).

# Always write assumptions made, either as comment or as description
# and keep the rough work, do not erase it out

#  accept a integer from the terminal
  echo "Enter an integer: "
  read num

#      Its shell script, use $ to get value of variable , 
#      use calculator bc , to find base 8 representation of entered base 10 number
#      And enclose in backquote ` ` to imply its command and not just a string

  octalNum=` echo "obase=8; $num" | bc `

  echo "$num in base 10 = $octalNum in base 8"

# OR 
# using while loop

  temp=$num  # save a copy of number
  octalNum=""  # initialize octal to empty string
  while [ $temp -ne 0 ] #while number not 0, divide by 8, remainder is digit in 
    do # number's octal representation, append remainder to a octal number  
      remainder=` expr $temp % 8 `  # get last digit in remainder
      temp=` expr $temp / 8 `       # then exclude last digit from number
      octalNum=` echo "$remainder$octalNum" `
    done

  echo "$num in base 10 = $octalNum in base 8"
