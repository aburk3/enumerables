# Reimplement #slice_when
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-slice_when

my_arr = [1,2,4,9,10,11,12,15,16,19,20,21]

def test_slice_when(elements)
  elements.slice_when do |i, j|
    i + 1 != j
  end
end

# Test before overwriting slice_when method
expected_result = test_slice_when(my_arr)

def my_arr.slice_when(*args)
  # return enum_for(:slice_when) unless block_given?
  parent_arr = []
  index = 0
  self.each do |element|
    comparison_element = self[index + 1]
    grouping = [element, comparison_element]
    if yield grouping[0], grouping[1]
      parent_arr << grouping 
    else
      parent_arr << [element]
    end
    index += 1
  end
  parent_arr
end

# Test after overwriting slice_when method
actual_result = test_slice_when(my_arr)

# Comparing results
show_results('test_slice_when', expected_result, actual_result)
