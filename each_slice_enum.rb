# Reimplement #each_cons
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 4

my_arr = (1..10)

def test_each_cons(arr)
    arr.each_cons(3) do |e|
      puts "#{e}"
    end
end

# expected_result = test_each_cons(my_arr)

def my_arr.each_cons(*args, &block)
  return enum_for(:each_cons) unless block_given?
  
  group_limit = args[0]
  group_arr = []
  current_count = 1
  
  self.each do |element|
    # binding.pry
    binding.pry if element == 10
    if check_for_clear(self, group_arr, group_limit, current_count)
      yield group_arr
      group_arr.clear


      perform_op(group_arr, block)


    elsif current_count == self.count
      group_arr << element
      yield
    else
      group_arr << element
    end
    # binding.pry
    current_count += 1
  end
  
end

def perform_op(group_arr, &block)
  block.call group_arr
  group_arr.clear
end

def check_for_clear(original_arr, group_arr, group_limit, current_count)
  if group_arr.length == group_limit or current_count == original_arr.count
    return true
  end
  false
end

actual_result = test_each_cons(my_arr)

# show_results('test_each_cons', expected_result, actual_result)
