# Reimplement #all?
require 'pry'

require_relative 'enum_test_helper'

MAX_LENGTH = 4

animals = ['cat', 'dog', 'lamb', 'horse']

empty_animals = []

def test_all(arr)
    arr.all? do |element|
        element.length <= MAX_LENGTH
    end
end

expected_result = test_all(animals)
expected_result_2 = test_all(empty_animals)

def animals.all?(*args)
    each do |val|
        return args.size == 1 && args.first == val
        return false if !yield(val)
    end
    return true
end

actual_result = test_all(animals)
actual_result_2 = test_all(empty_animals)

show_results('test_any', expected_result, actual_result)
show_results('test_any', expected_result_2, actual_result_2)