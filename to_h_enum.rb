# Reimplement #to_h
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-to_h

my_range = (1..7)

def test_to_h(elements)
  result = elements.to_h do |element|
    [element, element ** 2]
  end
  result
end

# Test before overwriting to_h method
expected_result = test_to_h(my_range)

def my_range.to_h
  my_hash = {}
  self.each do |element|
    result = yield element
    my_hash[element] = result[1]
  end
  my_hash
end

# Test after overwriting to_h method
actual_result = test_to_h(my_range)

# Comparing results
show_results('test_to_h', expected_result, actual_result)
