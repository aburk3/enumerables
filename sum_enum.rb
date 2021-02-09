# Reimplement #sum
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-sum

my_range = (1..3)

def test_sum(elements)
  result = elements.sum do |element|
    element * 2
  end
end

# Test before overwriting sum method
expected_result = test_sum(my_range)

def my_range.sum
  total = 0
  self.each do |element|
    if block_given?
      total += yield element 
    else
      total += element
    end
  end
  total
end

# Test after overwriting sum method
actual_result = test_sum(my_range)

# Comparing results
show_results('test_sum', expected_result, actual_result)
