# Reimplement #each_cons
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 4

my_arr = (1..10)

def test_each_cons(arr)
    arr.each_cons(3) do |e|
      puts e
    end
end

# expected_result = test_each_cons(my_arr)

def my_arr.each_cons(*args)
  return enum_for(:each_cons) unless block_given?

  group_size = args[0]
  group = []
  
  new_arr = self.to_a
  location = 0
  # binding.pry
  # new_arr[location..-1].each do |element|
  self.each do |element|
    # binding.pry
    
    # if group.length == group_size
    #   yield group.to_s
    #   group.clear
    #   location += 1
    # else
    #   group << element
    # end
  end
  number_to_remove = args[0].to_i
end

def create_group(elements, group_size, location)
  count = 0
end

actual_result = test_each_cons(my_arr)

# show_results('test_each_cons', expected_result, actual_result)
