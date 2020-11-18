# Reimplement #flat_map
require 'pry'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-flat_map

# my_array = [1, 2, 3, 4]
my_array = [[1, 2], [3, 4]]


def test_flat_map(my_array)
  my_array.flat_map do |e|
    # [e, -e]
    e + [100]
  end
end

# Test before overwriting flat_map method
expected_result = test_flat_map(my_array)

def my_array.flat_map
  return enum_for(:flat_map) unless block_given?

  final_array = []
  self.each do |element|
    result = yield element
    result.each do |item|
      final_array.push(item)
    end
  end
  final_array
end

# Test after overwriting flat_map method
actual_result = test_flat_map(my_array)

# Comparing results
show_results('test_flat_map', expected_result, actual_result)

