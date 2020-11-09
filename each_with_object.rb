# Reimplement #each_with_object
require 'pry'

require_relative 'enum_test_helper'

my_arr = (1..10)

def test_each_with_object(arr)
    result = arr.each_with_object([]) do |i, a|
      a << i*2
    end
end

expected_result = test_each_with_object(my_arr)

def my_arr.each_with_object(*args)
  return enum_for(:each_with_object) unless block_given?
  
  object = args[0]
  self.each do |element|
    yield element, object
  end
  return object
end

actual_result = test_each_with_object(my_arr)

show_results('test_each_with_object', expected_result, actual_result)
