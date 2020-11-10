# Reimplement #filter
require 'pry'
require 'prime'
require_relative 'enum_test_helper'

#* https://ruby-doc.org/core-2.6/Enumerable.html#method-i-filter

elements = [:foo, :bar]

def test_filter(elements)
  results = elements.filter do |i|
    i == :foo
  end
end

expected_result = test_filter(elements)

def elements.filter
  return enum_for(:filter) unless block_given?

  my_arr = []
  self.each do |element|
    my_arr << element if yield element
  end
  my_arr
end

actual_result = test_filter(elements)

show_results('test_filter', expected_result, actual_result)
