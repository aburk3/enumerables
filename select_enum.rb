# Reimplement #select
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-select

my_range = (1..10)

def test_select(elements)
  elements.select do |i|
    i % 3 == 0
  end
end

# Test before overwriting select method
expected_result = test_select(my_range)

def my_range.select(*args)
  return enum_for(:select) unless block_given?
  my_arr = []
  self.each do |element|
    my_arr << element if yield element
  end
  my_arr
end

# Test after overwriting select method
actual_result = test_select(my_range)

# Comparing results
show_results('test_select', expected_result, actual_result)
