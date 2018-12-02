#!/bin/sh
#Question: 
# Write a shell program to accept a positive integer number from the terminal 
#     and calculate the factorial of the number. Factorial of a number n is 
#     defined as factorial(n) = n * (n-1) * . . .* 2 * 1
#          Given factorial(0) = 1

# Always write assumptions made, either as comment or as description
# and keep the rough work, do not erase it out

#  accept a integer from the terminal
  echo "Enter a positive integer n: "
  read n

#      Its shell script, use $ to get value of variable , 
#      And enclose in backquote ` ` to imply its command and not just a string

  echo "The $n factorial number is: "
  if   [ $n -eq 1 ]    #  factorial(0) = 1
    then
      echo "1"
  else
      factorial=1     # start with factorial=1
      i=1             #  and from i = 1
      while [ $i -le $n ]  # loop to multiply numbers from 1 till n to factorial
        do
          factorial=` expr $factorial \* $i `  # escape * as \* 
          i=` expr $i + 1 `
        done        
      echo "$factorial" 
  fi

# OR
# using function definition in calculator , write factorial function and
#     call factorial( number n ) 

  echo "The $n factorial number is: "

  echo " define factorial (x) 
                 {
                   if (x <= 1) return (1);
                   return ( factorial(x-1) * x );
                 } ; 
        factorial($n) " | bc
