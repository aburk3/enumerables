# Reimplement #slice_after
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-slice_after

my_range = (1..10)

def test_slice_after(elements)
  elements.slice_after do |i|
    i % 3 == 0
  end
end

# Test before overwriting slice_after method
expected_result = test_slice_after(my_range)

def my_range.slice_after(*args)
  return enum_for(:slice_after) unless block_given?
  my_arr = []
  self.each do |element|
    my_arr << element if yield element
  end
  my_arr
end

# Test after overwriting slice_after method
actual_result = test_slice_after(my_range)

# Comparing results
show_results('test_slice_after', expected_result, actual_result)
