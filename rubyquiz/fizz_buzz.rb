#***************************************************
#****** FizzBuzz
#****************************************************
#Write a program that prints the numbers from 1 to 100.
#But for multiples of three print “Fizz” instead of the
#number and for the multiples of five print “Buzz”. For
#numbers which are multiples of both three and five
#print “FizzBuzz”.

def fizz_buzz(number)
  if number % 15 == 0
    'fizzbuzz'
  elsif number % 5 == 0
    'buzz'
  elsif number % 3 == 0
    'fizz'
  else
    number
  end
end

1.upto(100){ |number| p fizz_buzz(number) }
