# Reimplement #take
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-take

my_arr = [1, 2, 3, 4, 5, 0]

def test_take(elements)
  result = elements.take(3)
  puts result
end

# Test before overwriting take method
expected_result = test_take(my_arr)

def my_arr.take(n)
  count = 0
  new_arr = []
  self.each do |element|
    new_arr << element
    count += 1
    break if count == n
  end
  new_arr
end

# Test after overwriting take method
actual_result = test_take(my_arr)

# Comparing results
show_results('test_take', expected_result, actual_result)
