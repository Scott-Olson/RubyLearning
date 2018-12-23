# Getting inputs

# getting inputs from the command prompt
variable = gets
# gets autocatically adds a blank line (new line) after the input
# use .chomp to remove the blank line
variable = gets.chomp

# String interpolation
var_name = "yes"
puts "String that prints #{var_name}"

# .capitalize
var2 = var_name.capitalize

#.capitalize!
# this modifies the value contained within the original variable
var_name.capitalize!

# replaces s with th
print "Thtring, pleathe!: "
user_input = gets.chomp
user_input.downcase!
# does the string .include? "substring"
if user_input.include? "s"
# global substitution! in existing string
  user_input.gsub!(/s/, "th")
else
  puts "Nothing to do here!"
end
  
puts "Your string is: #{user_input}"

# for loop non inclusive
for num in 1...10
  puts num
end

# for loop inclusive
for num in 1..15
  puts num
end


# loop that skips if it is odd and breaks on 0
i = 20
loop do
  i -= 1
  next if i%2 != 0
  print "#{i}"
  break if i <= 0
end


# array iterator
array = [1,2,3,4,5]

array.each do |x|
  x += 10
  print "#{x}"
end

# set number of times doing something
10.times do 
  puts"test"
end

# loop testing
i = 1
until i == 51 do
	print i 
  i += 1
end



# Ruby IRB
# interactive ruby shell in console for testing ruby shite
# exit to quit


def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end

yield_name("Eric") { |n| puts "My name is #{n}." }

# Now call the method with your name!
yield_name("Scott"){ |x| puts "My name is #{x}"}


def double(input_one)
	puts "Running the method"
  yield(input_one)
  puts "Out of yield"
end

double(28) { |x| puts x*2 }
# outputs 56

# Proc Syntax
# Procs are easy to define, you just call Proc.new and passin the block you want to save.
cube = Proc.new { |x| x ** 3 }


[1, 2, 3].collect!(&cube)
# ==> [1, 8, 27]
[4, 5, 6].map!(&cube)
# ==> [64, 125, 216]

# CLASSES
class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end
	
  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")

ruby.description
python.description
javascript.description


# the @ symbol before a variable signifies that its an instance variable

class Computer
  $manufacturer = "Mango Computer, Inc."
  @@files = {hello: "Hello, world!"}
  
  def initialize(username, password)
    @username = username
    @password = password
  end
  
  def current_user
    @username
  end
  
  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.

# varaibles starting with $var is global
# variables starting with @var is an instance variable
# variables starting with @@var are class variables

# Class variables are like instance variables, but instead of belonging to an instance of a class, 
# they belong to the class itself. Class variables always start with two @s, like so: @@files.

# Global variables can be declared in two ways. 
# The first is one that's already familiar to you: you just define the variable outside of any method or class, and voilà! It's global.
 # If you want to make a variable global from inside a method or class, just start it with a $, like so: $matz.


# creating instance variable
# every instance of person has these variable properties
class Person
  def initialize(name, age, profession)
    @name = name
    @age = age
    @profession = profession
  end
end

# We can create class variables by starting a variable name with two @ symbols. 
# Class variables are attached to entire classes, not just instances of classes, like so:
class MyClass
  @@class_variable
end
# class variables can be accessed by all the instances of that class
class Person
  # Set your class variable to 0 on line 3
  @@people_count = 0 
  
  def initialize(name)
    @name = name
    # Increment your class variable on line 8
    @@people_count += 1 
  end
  
  def self.number_of_instances
    # Return your class variable on line 13
    return @@people_count
  end
end

matz = Person.new("Yukihiro")
dhh = Person.new("David")

puts "Number of Person instances: #{Person.number_of_instances}"

# class inheritance
class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error

# class inheritance and Super()
class Creature
  def initialize(name)
    @name = name
  end
  
  def fight
    return "Punch to the chops!"
  end
end

# Add your code below!

class Dragon < Creature
  def fight
    puts "Instead of breathing fire..."
    super()
  end
end


class Message
  @@messages_sent = 0
  def initialize(from, to)
    @from = from
    @to = to
    @@messages_sent += 1
  end
end

class Email < Message
  def initialize(from, to)
    super(from, to)
  end
end

my_message = Message.new('Scott', 'Taylor')

# Ruby practice making a virtual machine
class Machine
  @@users = {}
  
  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end
  
  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created by #{@username} at #{time}."
  end
  
  def Machine.get_users
    @@users
  end
end

my_machine = Machine.new("eric", 01234)
your_machine = Machine.new("you", 56789)

my_machine.create("groceries.txt")
your_machine.create("todo.txt")

puts "Users: #{Machine.get_users}"