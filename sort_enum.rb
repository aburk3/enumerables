# Reimplement #sort
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-sort

my_arr = %w(rhea kea flea)

def test_sort(elements)
  result = elements.sort
end

# Test before overwriting sort method
expected_result = test_sort(my_arr)

def my_arr.sort
  final_arr = []
  index = 0
  self.each do |element|
    final_arr_index = 0
    final_arr.each do |comparison_el|
      is_greater = comparison_el > element
      if is_greater
        final_arr.insert(final_arr_index, element)
        break
      else
        next unless final_arr_index == self.length - 1
        final_arr << element
      end
    end
    final_arr << element if final_arr.empty?
  end
  final_arr
end

# Test after overwriting sort method
actual_result = test_sort(my_arr)

# Comparing results
show_results('test_sort', expected_result, actual_result)
