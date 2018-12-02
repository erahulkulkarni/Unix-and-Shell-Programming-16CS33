#!/bin/sh
#Question: 
# Write a shell script to accept a integer from the terminal and check if its a 
#    palindrome. A number is palindrome if the reverse of the number turns out to 
#    be the same number. 12321, whose reverse is 12321, which is the original 
#    number, is a palindrome. Number 12345 is not a palindrom as its reverse is
#    54321 ≠ original number.

# Always write assumptions made, either as comment or as description
# and keep the rough work, do not erase it out

#  accept a integer from the terminal

  echo "Enter an integer: "
  read num

# Content can be reversed using command rev ,  reverse lines characterwise 
#   As the datatype is decided during run, loosely typed programming language  
#     use rev to find reverse of number num, considering num as string

#      Its shell script, use $ to get value of variable , 
#      enclose in backquote ` ` to imply its commands and not just string

  reverse=` echo $num | rev `

  echo "$num is "
  if [ $num = $reverse ]  # string comparision using = , instead of == as in C
    then
      echo "a palindrome"
  else
      echo "not a palindrome"
  fi 

# or using while loop , consider num as number, find reverse, 
#   then compare with original

  reverse=0     #initialize reverse
  temp=$num     #save num in another variable

  while [  $temp -ne 0  ]
    do                          # escape * and use of ` expr ` to evaluate
      reverse=` expr  $reverse \* 10   +   $temp % 10  `  # extract last digit
                                                 # and add to existing reverse
      temp=` expr $temp / 10 `  # remove last digit
    done

  echo "$num is "
  if [ $num = $reverse ]  # string comparision using = , instead of == as in C
    then
      echo "a palindrome"
  else
      echo "not a palindrome"
  fi 
