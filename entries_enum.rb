# Reimplement #entries
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-entries
#* https://www.geeksforgeeks.org/ruby-range-entries-function/

range = (0..10)

def test_entries(range)
    range.entries()
end

expected_result = test_entries(range)

def range.entries(*args)
  my_arr = []
  self.each do |element|
    my_arr << element
  end
  my_arr
end

actual_result = test_entries(range)

show_results('test_entries', expected_result, actual_result)
