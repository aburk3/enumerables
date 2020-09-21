# Reimplement #count
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 4

array = [1, 2, 4, 2]

def test_count(arr)
    arr.count do |x|
        x % 2
    end
end

expected_result = test_count(array)

def array.count(*args)
    count = 0
    each do |val|
        if block_given?
            count += 1 if yield(val)
        else
            count += 1 
        end
    end
    count
end

actual_result = test_count(array)

show_results('test_count', expected_result, actual_result)
