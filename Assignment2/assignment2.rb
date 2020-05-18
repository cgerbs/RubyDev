# frozen_string_literal: true

# Chris Gerbino
# Assignment2
# COEN164

puts "\n\t\t QUESTION #1\n\n"
# in questions one we will create a function that takes in a string to search within, and possibly another string that represents the search term
#   IF there is NOT search term given, the function should return every unique word and the number of times it occurs
#   IF there IS a search term provided, the function should only return the number of occurances of the searchterm in the given string

# NOTE: string was provided in the assignment
str = 'Facebook and its founder must release documents and electronic correspondence to a defense lawyer whose client has fled from criminal charges that he falsely claimed a majority ownership in the social media giant, a federal judge said Friday.'

# function to return word occurance count

def count_occurances(str, search_term = '')
  local_str = str.downcase.split(/\W+/) # now string should be ready for comparison
  # puts local_str
  # puts
  result = {} # hash table to return results

  if search_term == '' # no search term param passed
    local_str.each do |word|
      result[word] = if result.key? word
                       result[word] + 1
                     else
                       1
                     end
    end
    puts result
  else # search term param passed
    search_term_count = 0
    local_str.each do |word1|
      search_term_count += 1 if word1 == search_term
    end
    puts "#{search_term} appears #{search_term_count} times!\n"
  end
end

count_occurances(str, 'and')
count_occurances(str)
puts puts

puts "\t\t QUESTION #2\n\n"
# write a method to be able to query students
#   e.g. search_students(students, firstname: "ken")

# array given in assignment
students = [
  { firstname: 'John', lastname: 'LastnameJohn', phonenumber: 123_456_789 }, # arr1
  { firstname: 'Ken', lastname: 'Lastnameken', phonenumber: 456_734_244 }, # arr2
  { firstname: 'Marisa', lastname: 'lastnamemarisa', phonenumber: 443_234_567 }, # arr3
  { firstname: 'Ken', lastname: 'Kenlastname', phonenumber: 456_734_244 } # arr4
]
# students[arr#][:<attr>] #returns 'attribute w/in arr#'

# need to create:
# - method called 'search_students(arrayOfData, <attr>: "<name_searched>")
# - This method needs to return the value w/in <attr> for given array of data

def search_students(data_array, firstname: "" , lastname: "", phonenumber: 000_000_00)
  #p data_array[0][:firstname] .. "John"
  puts "Firstname  Lastname     Phone#"
  data_array.each do |student|
    #puts student[:firstname] .. returns first name of 'student' w/in data_array
    if ((student[:firstname].to_s).downcase).eql?((firstname.to_s).downcase)
      puts "#{student[:firstname]}        #{student[:lastname]}  #{student[:phonenumber]}"
    elsif ((student[:lastname].to_s).downcase).eql?((lastname.to_s).downcase)
      puts "#{student[:firstname]}        #{student[:lastname]}  #{student[:phonenumber]}"
    elsif ((student[:phonenumber].to_i)).eql?((phonenumber.to_i))
      puts "#{student[:firstname]}        #{student[:lastname]}  #{student[:phonenumber]}"
    end
  end

end

search_students(students, firstname: "Ken", )


puts puts
puts "\n\t\t QUESTION #3\n\n"

# need to write a class that allows me to compress a string and a method that will return the og string
  # The class should include:
    # -compressed string (based on string given as input when creating new instance of  the class)
    # -an accompaning array of integers, that represents the original string, based on # of word
      # ex. og string "i want to go on a walk do you want to go on a walk"
      # compress string "i want to go on a walk do you"
      # i = 0, want = 2, to = 3, go = 4, on = 5, a = 6, walk = 7, do = 8, you = 9
      # int array ->    [0 2 3 4 5 6 7 8 9 2 3 4 5 6 7]

# 1. going to use '.uniq' method to compress og string.. this will be done in the class method i believe
# 2. use the compressed string to number to words
# 3. used the numbered words to create the int array that reps og string
# 4. @ end of class method set the class attributes to the 'int array' and 'compressed string' that were calculated
# 5. write method to compute og string again.. this shouldnt be to hard... method will need access to class attributes 

class CompressString 
  attr_accessor :numArr, :compressedString

  def initialize(og_string: "")
    self.compressedString = compressStr(og_string) 
     puts self.compressedString[1] # -> 'love'
    self.numArr = generate_arr(og_string, self.compressedString)
  end

  def compressStr(string)  
    new_str = ((string).split.uniq)
    # puts new_str
    new_str # returning this string
  end

  def generate_arr(og_str, compressed_arr)
    int_arr = []
    i = 0
    compressed_arr.each do |word|
      puts word
      puts i
      i += 1
    end
  end

end

string = CompressString.new(og_string: "I love you but do you love me")
#puts string