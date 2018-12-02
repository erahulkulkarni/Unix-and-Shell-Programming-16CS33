#!/bin/sh
#Question: 
# Write a shell program to accept a positive integer n from the terminal and 
#   print n th Fibonacci number. A number in Fibonacci series is expressed as 
#   sum of its previous two numbers. 
#       fibonacci(n) = fibonacci(n-1) + fibonacci(n-2)
#           given fibonacci(1) = 0 and 
#                 fibonacci(2) = 1

# Always write assumptions made, either as comment or as description
# and keep the rough work, do not erase it out

#  accept a integer from the terminal
  echo "Enter a positive integer n: "
  read n

#      Its shell script, use $ to get value of variable , 
#      And enclose in backquote ` ` to imply its command and not just a string

  fibonacci1=0         #  fibonacci(1) = 0
  fibonacci2=1         #  fibonacci(2) = 1
  nextFibonacci="" 

  echo "The $n fibonacci number is: "
  if   [ $n -eq 1 ]    #  fibonacci(1) = 0
    then
      echo "$fibonacci1"
  elif [ $n -eq 2 ]    #  fibonacci(2) = 1
    then
      echo "$fibonacci2"
  else     # fibonacci(n) = fibonacci(n-1) + fibonacci(n-2), and since 1st two 
      i=3  # fibonacci numbers are 0 and 1, so start from next, i.e. 
      while [ $i -le $n ]  # 3rd number till the n th number, from i = 3 till n
        do
          nextFibonacci=` expr $fibonacci1 + $fibonacci2 `
          fibonacci1=$fibonacci2
          fibonacci2=$nextFibonacci
          i=` expr $i + 1 `
        done       
      echo "$nextFibonacci"
  fi

