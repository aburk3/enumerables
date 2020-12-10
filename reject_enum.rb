# Reimplement #reject
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-reject

my_arr = %w(ant bear cat anima)

def test_reject(elements)
  elements.reject do |word|
    word.length == 5
  end
end

# Test before overwriting reject method
expected_result = test_reject(my_arr)

def my_arr.reject(*args)
  return enum_for(:reject) unless block_given?

  false_arr = []

  self.each do |element|
    false_arr << element if not yield element
  end

  false_arr
end

# Test after overwriting reject method
actual_result = test_reject(my_arr)

# Comparing results
show_results('test_reject', expected_result, actual_result)
