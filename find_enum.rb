# Reimplement #find
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-find

# my_range = (1..10)
my_range = (1..100)

def test_find(elements)
  arg = Proc.new {"No matches found"}
  elements.find do |i|
    i % 5 == 0 and i % 7 == 0
  end
end

# Test before overwriting find method
expected_result = test_find(my_range)

def my_range.find(ifnone = nil)
  return enum_for(:find) unless block_given?

  self.each do |element|
    return element if yield element
  end

  return nil if ifnone.nil?

  return ifnone.call()

end

# Test after overwriting find method
actual_result = test_find(my_range)

# Comparing results
show_results('test_find', expected_result, actual_result)
