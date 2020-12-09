# Reimplement #one
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-one

my_arr = %w(ant bear cat)

def test_one(elements)
  elements.one? do |word|
    word.length == 5
  end
end

# Test before overwriting one method
expected_result = test_one(my_arr)

def my_arr.one?(*args)
  is_true_count = 0
  args_exist = args.empty?
  arg = args[0] if args_exist

  self.each do |element|
    if block_given?
      is_true_count += 1 if yield element
    elsif args_exist
      # This can be improved to somehow handle any pattern
      is_true_count += 1 if element.is_a?(arg) # E.g. Integer
    end
  end

  return is_true_count == 1
end

# Test after overwriting one method
actual_result = test_one(my_arr)

# Comparing results
show_results('test_one', expected_result, actual_result)
