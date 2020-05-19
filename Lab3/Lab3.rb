#Chris Gerbino
#COEN164 - Lab 3
#April 27, 2020
#TA: Samantha Song

# 1: Make up an example to check if a class method is inherited or not
puts 'PROBLEM #1'

class Sports
  def initialize(teamName, numberOfPlayers)
    @teamName = teamName
    @numberOfPlayers = numberOfPlayers
  end

  def overview
    puts "#{@teamName} has #{@numberOfPlayers} players" #remember to use '@' symbol here
  end
end

class Rugby < Sports
  def initialize(teamName, numberOfPlayers)
    super #using super to access attribute/methods of 'Sports'
  end
  # def overview
  #     super
  # end
end

# creating class that is not inherited
class TypeOfRugby
  def initialize(rugbyVariation)
    @rugbyVariation = rugbyVariation
  end

  def output
    puts "Type of rugby === #{rugbyVariation}"
  end
end

scuts = Rugby.new('SCU', 15)
league = TypeOfRugby.new('League')
#scuts.overview
#puts scuts.method(:overview).owner... Sports
#puts league.method(:output).owner

if scuts.method(:overview).owner == Rugby.superclass
  puts "\tinherited"
else
  puts "\tNOT inherited"
end

puts #for formatting

if league.method(:output).owner == TypeOfRugby
  puts "\tNOT inherited"
else
  puts "\tinherited"
end

puts #for formatting

# 2: Module1 has methods method11, method12, and method13. Module2 has methods method21, method22, method23
# Define Module1 and Module2 as well as a class that can access all of these modules
puts 'PROBLEM #2'

module Module1
  def method11
    # !NOTE: "__method__" returns a symbol of the method?... dont know what this means but the name is not a string.
    #           If I use "__method__.to_s" it convers the symbol to a string... yay happy days
    puts "\tSucessfully accessed #{__method__}"
    #foo = __method__.to_s
    #puts foo.is_a? String
  end
  def method12
    puts "\tSucessfully accessed #{__method__}"
  end
  def method13
    puts "\tSucessfully accessed #{__method__}"
  end
end

module Module2
  # using "__method__.to_s" here... so each method prints its name as a string not a symbol
  def method21
    puts "\tSucessfully accessed #{__method__.to_s}"
  end
  def method22
    puts "\tSucessfully accessed #{__method__.to_s}"
  end
  def method23
    puts "\tSucessfully accessed #{__method__.to_s}"
  end
end

class ModuleAccessor
  include Module1
  include Module2
end

test = ModuleAccessor.new
test.method11
test.method12
test.method13
test.method21
test.method22
test.method23

puts #for formatting
puts #for formatting

#3: Given two classes in different files that use the same class name and same class-method name...
# This is a problem because the class names will clash and one will get overrided
# Use modules so you can use both classes without changing the name

# !NOTE: for simplicity I will not put these in seperate files

puts 'PROBLEM #3'

module Gym
  class Push
    def up
      40
    end
  end
end

module Dojo
  class Push
    def up
      30
    end
  end
end

gymPush = Gym::Push.new
#40
puts gymPush.up
dojoPush = Dojo::Push.new
#30
puts dojoPush.up
puts
puts

#4
puts 'PROBLEM #4'

class Parent
  def initialize(name = 'nobody')
    @name = name
  end
end

class Child < Parent
  attr_accessor :name, :grade
  def initialize(name, grade)
    super(name) #added statement
    @grade = grade
  end
end

y = Child.new('yuan', 100)

print 'name is: ', y.name
puts
puts y.grade
y.grade = 90
puts y.grade
puts
puts

#5
puts 'PROBLEM #5'

module Dojo
  A = 4
  module Kata
    B = 8
    module Roulette
      class ScopeIn
        def push
          15
        end
      end
    end
  end
end

A = 16
B = 23
C = 42

object1 = Dojo::Kata::Roulette::ScopeIn.new
puts object1.push
puts Dojo::A
puts Dojo::Kata::B
puts "Second Occurance of A = #{A}"
puts "Second Occurance of B = #{B}"
puts C
puts
puts

#6
puts 'PROBLEM #6'
module Greetings
  def english
    puts 'Hello!'
  end

  def french
    puts 'Bonjour!'
  end

  def spanish
    puts 'Hola!'
  end
end

class Hello
  include Greetings
end

helloCaller = Hello.new
helloCaller.english
helloCaller.french
helloCaller.spanish
puts
puts
#!NOTE: I dont see a difference between 6a and 6b i believe they are both asking the same thing
#7: rendering
puts 'PROBLEM #7'
require_relative('rendering')
module Rendering
  #a
  DEFAULT_FONT = self::Font.new('defaultFont')
  DEFUALT_PAPER_SIZE = self::PaperSize.new('Us Letter')
  #b
  #c
  #d
  class Font
    def check_default
      puts "name: #{DEFAULT_FONT.name} weight: #{DEFAULT_FONT.weight} size: #{
             DEFAULT_FONT.size
           }"
    end

    def check_self
      puts "name: #{self.name} weight: #{self.weight} size: #{self.size}"
    end
  end

  class PaperSize
    def check_default
      puts "name: #{DEFUALT_PAPER_SIZE.name} weight: #{
             DEFUALT_PAPER_SIZE.width
           } size: #{DEFUALT_PAPER_SIZE.height}"
    end

    def check_self
      puts "name: #{self.name} weight: #{self.width} size: #{self.height}"
    end
  end
end
#!NOTE: not sure what it means by seperate the module into 2 seperate files
#f
fontTest = Rendering::Font.new('fontName')
paperTest = Rendering::PaperSize.new('newPaperSize')
fontTest.check_default
fontTest.check_self
puts
paperTest.check_default
paperTest.check_self
puts
puts

#8
puts 'Problem #8'
#hi ="I hate you".scan(/[aeiou]/i).length
#puts hi
class VowelFinder
  #include Enumerable

  def vowelObject(string1)
    vowelCounter = 0
    vowelArray = %w[a e i o u]
    vowelCounter = string1.scan(/[aeiou]/i).length
    puts vowelCounter
  end
end
vtest = VowelFinder.new
stringTest = 'Input a string that you want to count the vowels for'
puts vtest.vowelObject(stringTest)
