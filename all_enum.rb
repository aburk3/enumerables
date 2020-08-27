# Reimplement #all?
require 'pry'

require_relative 'enum_test_helper'

MAX_LENGTH = 4

animals = ['cat', 'dog', 'lamb', 'horse']

def test_all(arr)
    arr.all? do |element|
        element.length <= MAX_LENGTH
    end
end

expected_result = test_all(animals)

def animals.all?(*args)
    each do |val|
        return true if args.size == 1 && args.first == val
        if block_given? && yield(val)
            result = true
        else
            return false
        end
    end
    result
end

actual_result = test_all(animals)

show_results('test_any', expected_result, actual_result)