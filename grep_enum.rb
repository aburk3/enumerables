# Reimplement #grep
require 'pry'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-grep

my_range = (1..100)


def test_grep(my_range)
  my_range.grep 38..44
end

# Test before overwriting grep method
expected_result = test_grep(my_range)

def my_range.grep(*args)

  final_array = []
  self.each do |element|
    final_array.push(element) if args[0] == element
  end
  final_array
end

# Test after overwriting grep method
actual_result = test_grep(my_range)

# Comparing results
show_results('test_grep', expected_result, actual_result)

