# Reimplement #find_index
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-find_index

# my_range = (1..10)
my_range = (1..100)

def test_find_index(my_range)
  #* Option 1 (Int given)
  my_range.find_index(5)

  #* Option 2 (non Int, non nil arg)
  # my_range.find_index('hi')
  #* Option 3 (block given)
  # my_range.find_index do |i|
  #   i % 5 == 0 and i % 7 == 0
  # end
end

# Test before overwriting find_index method
expected_result = test_find_index(my_range)

def my_range.find_index(my_arg=nil)
  return enum_for(:find_index) unless block_given? || !my_arg.nil?

  raise_exception(expected: 'Int', received: my_arg) if !my_arg.nil? && !my_arg.is_a?(Integer)

  self.each_with_index do |element, index|
    if block_given?
      return index if yield element
    else
      return index if element == my_arg
    end
  end
  nil
end

# Test after overwriting find_index method
actual_result = test_find_index(my_range)

# Comparing results
show_results('test_find_index', expected_result, actual_result)

