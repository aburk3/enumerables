# Reimplement #inject
require 'pry'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-inject

my_range = (5..10)


def test_inject(my_range)
  my_range.inject do |sum, n|
    total = sum + n
    puts "Total: #{sum} + #{n} = #{total}"
    total
  end
end

# Test before overwriting inject method
puts "Ruby implementation"
expected_result = test_inject(my_range)

def my_range.inject(*args)
  accumulator = nil
  index = 0
  self.each do |element|
    if index == 0
      if !args[0].nil?
        accumulator = args[0]
        index += 1
        next
      else
        accumulator = element
        index += 1
        next
      end
    else
      accumulator = yield accumulator, next_element(self.to_a, index)
      index += 1
    end
  end
  accumulator
end

def next_element(array, index)
  array[index]
end

# Test after overwriting inject method
puts "Custom implementation"
actual_result = test_inject(my_range)

# Comparing results
show_results('test_inject', expected_result, actual_result)