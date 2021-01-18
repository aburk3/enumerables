# Reimplement #slice_before
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-slice_before

letters = ["a", "b", "c"]

def test_slice_before(elements)
  result = elements.slice_before(/(?<!\\)\n\z/)
  result
end

# Test before overwriting slice_before method
expected_result = test_slice_before(letters)

def letters.slice_before(pattern)
  my_arr = []
  grouping = []
  self.each do |element|
    if element.match(pattern)
      my_arr << grouping.dup
      grouping.clear
      grouping << element
    else
      grouping << element
    end
  end
  my_arr.each
end


# Test after overwriting slice_before method
actual_result = test_slice_before(letters)

# Comparing results
show_results('test_slice_before', expected_result, actual_result)
