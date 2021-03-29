# Reimplement #to_a
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-to_a

my_range = (1..7)

def test_to_a(elements)
  elements.to_a
end

# Test before overwriting to_a method
expected_result = test_to_a(my_range)

def my_range.to_a
  new_array = []
  self.each do |element|
    if self.is_a?(Hash)
      new_array << [element, self[element]]
      next
    end

    new_array << element
  end
  new_array
end

# Test after overwriting to_a method
actual_result = test_to_a(my_range)

# Comparing results
show_results('test_to_a', expected_result, actual_result)
