# Reimplement #chunk?
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 3

animals = ['raven', 'cat', 'dog', 'lamb', 'hors']

def test_chunk(arr)
    arr.chunk do |element|
        element.length == DESIRED_LENGTH
    end
end

expected_result = test_chunk(animals)

true_results = []
false_results = []
def animals.chunk(*args)
    each do |key,val|
        binding.pry
        if yield(val)
            true_results << val
            puts [yield(val), true_results]
            reset_result
        else
            false_results << val
            puts [yield(val), false_results]
        end
    end
end

def reset_result
    result.clear
end

actual_result = test_chunk(animals)

show_results('test_chunk', expected_result, actual_result)
