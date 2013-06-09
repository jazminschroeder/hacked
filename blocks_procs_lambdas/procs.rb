# This is a simple Proc
greeting = Proc.new do |name|
  "Hello #{name}"
end

puts greeting.call('John')

def say_hi(greeting)
  greeting.call('Jaz')
end
puts say_hi(greeting)

#This is the lambda version
greeting = lambda do |name|
  "Hello #{name}"
end

puts greeting.call('Max')

#Convert a Proc to block
welcome = Proc.new do |name|
  puts "Welcome #{name}"
end

%w(Bill Max).each(&welcome)

#Refactoring with Procs
def welcome
  %w(Bill Max).each do |name|
    yield "Hi there #{name}"
  end
end

welcome{|welcome_message| puts welcome_message}

def welcome(&block)
  %w(Bill Max).each(&block)
end

welcome{|name| puts "Hello there #{name}"}


def list(&block)
  %w(Max Aria).each do |name|
    if block_given?
      yield name
    else
      puts name
    end
  end
end

list
list{|name| puts "I am greeting #{name}" }
