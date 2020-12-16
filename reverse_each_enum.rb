# Reimplement #reverse_each
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-reverse_each

my_range = (1..3)

def test_reverse_each(elements)
  elements.reverse_each do |v|
    puts v
  end
  elements
end

# Test before overwriting reverse_each method
expected_result = test_reverse_each(my_range)

def my_range.reverse_each(*args)
  return enum_for(:reverse_each) unless block_given?
  my_arr = []
  # Create reverse temp array
  self.each do |element|
    my_arr.unshift(element)
  end

  # Yield temp arr 
  my_arr.each do |element|
    yield element
  end
end

# Test after overwriting reverse_each method
actual_result = test_reverse_each(my_range)

# Comparing results
show_results('test_reverse_each', expected_result, actual_result)
