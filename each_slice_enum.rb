# Reimplement #each_slice
require 'pry'

require_relative 'enum_test_helper'

my_arr = (1..10)

def test_each_slice(arr)
    arr.each_slice(3) do |e|
      puts "#{e}"
    end
end

expected_result = test_each_slice(my_arr)

def my_arr.each_slice(*args, &block)
  return enum_for(:each_slice) unless block_given?

  group_limit = args[0]
  group_arr = []

  self.each do |element|
    perform_op(group_arr, &block) if group_arr.length == group_limit
    add_to_group(group_arr, element)
  end
  yield group_arr if !group_arr.empty?
end

def add_to_group(group_arr, element)
  group_arr << element
end

def perform_op(group_arr, &block)
  block.call group_arr
  group_arr.clear
end

actual_result = test_each_slice(my_arr)

show_results('test_each_slice', expected_result, actual_result)
