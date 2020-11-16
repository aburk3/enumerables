# Reimplement #first
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-first

my_array = %w[foo bar baz]

def test_first(my_array)
  #* Option 1
  my_array.first

  #* Option 2
  # my_array.first(2)
  
end

# Test before overwriting first method
expected_result = test_first(my_array)

def my_array.first(my_arg=nil)
  my_arr = []
  count = 1

  self.each do |element|
    return element if my_arg.nil?

    my_arr << element unless count > my_arg
    count += 1
  end
  my_arr
end

# Test after overwriting first method
actual_result = test_first(my_array)

# Comparing results
show_results('test_first', expected_result, actual_result)

