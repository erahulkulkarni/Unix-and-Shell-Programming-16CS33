#!/bin/sh
#Question: 
# Write a shell program to accept a integer from the terminal and check if its a
#     prime number. A number is prime if it is only divisible by 1 and itself.

# Always write assumptions made, either as comment or as description
# and keep the rough work, do not erase it out

#  accept a integer from the terminal
  echo "Enter an integer: "
  read num

#      Its shell script, use $ to get value of variable , 
#      And enclose in backquote ` ` to imply its command and not just a string

  divisor=2 
  squareRootOfNumber=` echo "sqrt( $num )" | bc `

  while [ $divisor -le $squareRootOfNumber ] # while divisor is less than or equal 
    do  # to square root of number
      remainder=` expr $num % $divisor `
      if [ $remainder  -eq  0  ] # if remainder is zero 
        then   # then number is not prime , exit
          echo "$num is not prime"
          exit
      fi
      divisor=` expr $divisor + 1 `
    done

  # if control is here then no numbers from 2 till square root of number divided 
  #   the number, where remainder was not 0, hence it is prime
  echo "$num is prime"     #  Optimus: Dennis O'Neil
