# Reimplement #drop
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 4

my_arr = [1, 2, 3, 4, 5, 0]

def test_drop(arr)
    arr.drop(5)
end

expected_result = test_drop(my_arr)

def my_arr.drop(*args)
    raise "wrong number of arguments (given #{args.count}, expected 1)" if args.count != 1
    number_to_remove = args[0].to_i
    args[0].to_i.times do |element|
        self.shift
    end
    return self
end

actual_result = test_drop(my_arr)

show_results('test_drop', expected_result, actual_result)
