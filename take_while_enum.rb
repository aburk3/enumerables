# Reimplement #take_while
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-take_while

my_arr = [1, 2, 3, 4, 5, 0]

def test_take_while(elements)
  result = elements.take_while do |element|
    element < 4
  end
  puts result
end

# Test before overwriting take_while method
expected_result = test_take_while(my_arr)

def my_arr.take_while
  return enum_for(:take_while) unless block_given?

  new_arr = []
  self.each do |element|
    new_arr << element if yield element
    break unless yield element
  end
  new_arr
end

# Test after overwriting take_while method
actual_result = test_take_while(my_arr)

# Comparing results
show_results('test_take_while', expected_result, actual_result)
