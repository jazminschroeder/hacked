# Given an unsorted array of integers, find 2 numbers that add to X
# e.g. [3, 4, 6, 7, 2, 3]
# 3,7
# 4,6
# 7,3
#
require 'ruby-prof'
RubyProf.measure_mode = RubyProf::PROCESS_TIME

class FindTwoNumbers

  def initialize(input = [])
    1000.times { input << rand(100) }

    ['with_hashes', 'with_pointers', 'with_ruby'].each do |implementation|
      p implementation
      RubyProf.start
      send(implementation, input)
      result = RubyProf.stop
      printer = RubyProf::FlatPrinter.new(result)
      printer.print(STDOUT)
    end
  end

  def with_hashes(array)
    array = array.sort
    matches = {}
    iteration = 0
    array.each do |number|
      iteration += 1
      match = 10 - number
      if matches[match]
        #p [matches[match], number]
      else
        matches[number] = number
      end
    end
  end

  def with_pointers(array)
    iteration = 0
    array = array.sort
    min = 0
    max = array.length-1
    while min < max do
      iteration+=1
      sum = array[min] + array[max]
      if sum == 10
        #p [array[min], array[max]]
        min += 1
        max -+ 1
      elsif sum > 10
        max -= 1
      else
        min += 1
      end
    end
  end

  def with_ruby(array)
    array.combination(2) do |num1, num2|
      if num1+ num2 == 10
        #p [num1, num2]
      end
    end
  end
end

FindTwoNumbers.new
