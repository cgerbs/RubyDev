# COEN164 - Lab1 Part B (Write Code)
# Chris Gerbino
# TA: Samantha Song

#!note: Part A of  this lab was done using irb, hence no code for Part A

# 1
def str_dup(wordCount, str)
  1..wordCount.each do |i|
    print(str)
  end
end

str_dup(5, 'whoaw ')
puts

# 2
def SumNums(maxNumber)
  sum = 0
  1..maxNumber.each do |i|
    print "#{i} = " if i == maxNumber
    print "#{i} + " if i < maxNumber
    sum += i
  end
  print sum
end

SumNums(10)
puts

# 3
def sum_sq(maxNumber2)
  sum = 0
  1..maxNumber2.each do |i|
    sum += (i**2)
  end
  print sum
end

sum_sq(7)
puts

# 4

def prob4(topRowLength)
  counter = topRowLength
  1..topRowLength.each do |i|
    str_dup(counter, '*')
    puts
    counter -= 1
  end
end

prob4(10)
puts

#5
def prob5(topRowLength1)
  counter1 = topRowLength1
  1..topRowLength1.each do |i|
    spaces = i - 1
    str_dup(spaces, ' ')
    str_dup(counter1, '*')
    puts
    counter1 -= 1
  end
end

prob5(10)
puts

#6
def prob6(botRowLength)
  numberOfStars = 1
  until numberOfStars > botRowLength
    spaces1 = (botRowLength - numberOfStars) / 2
    str_dup(spaces1, ' ')
    str_dup(numberOfStars, '*')
    numberOfStars += 2
    puts
  end
end

prob6(11)

#7
def say_hello(name)
  print "hello #{name}"
end

say_hello('Sam')
