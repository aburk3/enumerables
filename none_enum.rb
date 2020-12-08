# Reimplement #none
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-none

my_arr = %w(ant bear cat)

def test_none(elements)
  result = elements.none? do |word|
    word.length == 5
  end
  puts result
end

# Test before overwriting none method
expected_result = test_none(my_arr)

def my_arr.none?(*args)
  result = false
  self.each do |element|
    return false if yield element
  end
  true
end

# Test after overwriting none method
actual_result = test_none(my_arr)

# Comparing results
show_results('test_none', expected_result, actual_result)
