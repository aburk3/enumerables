# Reimplement #tally
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-tally

my_arr = ["a", "b", "c", "b"]

def test_tally(elements)
  elements.tally
end

# Test before overwriting tally method
expected_result = test_tally(my_arr)

def my_arr.tally
  new_hash = {}
  self.each do |element|
    new_hash[element] = 0 unless new_hash.key?(element)

    new_hash[element] = new_hash[element] + 1
  end
  new_hash
end

# Test after overwriting tally method
actual_result = test_tally(my_arr)

# Comparing results
show_results('test_tally', expected_result, actual_result)
