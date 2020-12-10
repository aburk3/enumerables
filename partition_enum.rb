# Reimplement #partition
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-partition

my_arr = %w(ant bear cat anima)

def test_partition(elements)
  elements.partition do |word|
    word.length == 5
  end
end

# Test before overwriting partition method
expected_result = test_partition(my_arr)

def my_arr.partition(*args)
  return enum_for(:partition) unless block_given?

  true_arr = []
  false_arr = []

  self.each do |element|
    if yield element
      true_arr << element
    else
      false_arr << element
    end
  end

  [true_arr, false_arr]
end

# Test after overwriting partition method
actual_result = test_partition(my_arr)

# Comparing results
show_results('test_partition', expected_result, actual_result)
