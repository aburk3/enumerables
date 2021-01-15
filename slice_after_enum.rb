# Reimplement #slice_after
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-slice_after

lines = ["foo\n", "bar\\\n", "baz\n", "\n", "qux\n"]

def test_slice_after(elements)
  result = elements.slice_after(/(?<!\\)\n\z/)
  result
end

# Test before overwriting slice_after method
expected_result = test_slice_after(lines)

def lines.slice_after(pattern)
  my_arr = []
  grouping = []
  self.each do |element|
    if element.match(pattern)
      grouping << element
      my_arr << grouping.dup
      grouping.clear
    else
      grouping << element
    end
  end
  my_arr.each
end


# Test after overwriting slice_after method
actual_result = test_slice_after(lines)

# Comparing results
show_results('test_slice_after', expected_result, actual_result)
