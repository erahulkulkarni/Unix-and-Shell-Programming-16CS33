#!/bin/sh
#Question: 
#Moore's law is the observation that the number of transistors in a dense 
#  integrated circuit(IC) doubles approximately every two years. A transistor is a
#  semiconductor device used to build electronic circuits. An IC is a set of
#  electronic circuits on one small flat piece of semiconductor material.

# Example: Assume if in year 2000, 1 transistor was present on IC, then in year 
#   2002 : 2 transistors , 2004 : 4 transistors, 2006 : 8 transistors, 2008 : 16 
#   transistors and in year 2010 : 32 transistors would be present on IC respectively. 

# Write a Shell script that:
#  a) Reads from end user using suitable messages:
#     i. Year, YP ( say year past/ previous, a year where number of transistors on 
#                   IC are known ) and
#    ii. Number of transistor on IC during that year, TIC ( both integers )
#   iii. ( As compared to YP , a) Year in future, YF ( integer )
#  b) Checks if YP , TIC and YF are logically correct
#  c) Predicts number of transistors that would be present on IC in year YF
#  d) Prints with suitable message, future year YF and predicted number of transistors
#     on IC for that year.

# Always write assumptions made, either as comment or as description
# and keep the rough work, do not erase it out

#  a) Reads from end user using suitable messages:
#     i. Year, YP ( say year past/ previous, a year where number of transistors on 
#                   IC are known ) and
  echo "Year in past, yp = "
  read yp

#    ii. Number of transistor on IC during that year, TIC ( both integers )
  echo "Number of transistor on IC during $yp = "
  read tic

#   iii. ( As compared to YP , a) Year in future, YF ( integer )
  echo "Year in future where number of transistors to be predicted, yf = "
  read yf

#  b) Checks if YP , TIC and YF are logically correct: 
  echo "Entered values of YP , TIC and YF are logically "
#  Check if they are non negative, all are greated than zero, and yf > yp
  if [ $yp -gt 0  -a  $tic -gt 0  -a  $yf -gt 0  -a  $yf -gt $yp ]
    then
      echo "correct"
  else
      echo "incorrect"
      exit 1
  fi

#  c) Predicts number of transistors that would be present on IC in year YF

#    number of transistors in a dense IC doubles approximately every two years

#    Say you start in year 2000 with 5 transistors , then
#      in 2002 its 10 transistors,  5 * 2 , doubles 
#      in 2004 its 20 transistors, 10 * 2 , double of earlier
#      in 2006 its 40 transistors, 20 * 2 , double of earlier .
#      in 2008 its 80 transistors, 40 * 2 , double of earlier . .

#    Hence you are multiplying tic by 2 , 4 , 8 , 16 , 32 ..
#       If the difference in years is 2 , 4 , 6 ,  8 , 10 respectively

#    If you divide the difference of years by 2:  ( yf - yp ) / 2
#                                  1 , 2 , 3 , 4  , 5
#    and 2 to the power of this result gives us the required multiple
#     2 ^ ( ( yf - yp ) / 2 )  =   2 , 4 , 8 , 16 , 32

#    Therefor tic * (  2 ^ ( ( yf - yp ) / 2 )  ) are transistors in future

#      Its shell script, use $ to get value of variable , 
#      use calculator bc , to find power of
#      do not forget to escape * and use of expr to evaluate
#      And enclose in backquote ` ` to imply its commands and not just string

  multiple=` echo "2 ^ ( ( $yf - $yp ) / 2 )" | bc `

  ticInYf=` expr  $tic \* $multiple  `

#  d) Prints with suitable message, future year YF and predicted number of
#        transistors on IC for that year.

  echo "If during $yp , transistors on IC were $tic," 
  echo "  then during $yf , number of transistors will be $ticInYf " 


# or using while loop , double tic every two years, from yp to yf

  ticInYf=$tic    #initialize 

  while [ $yp -lt $yf ]        # from yp to yf
    do 
        ticInYf=` expr $ticInYf + $ticInYf `  # or  $ticInYf \* 2
                                              # doubles
        yp=` expr $yp + 2 `    # increment yp by two instead of 1  
                               # that is every two years  
    done

  echo "During $yf , number of transistors will be $ticInYf " 
