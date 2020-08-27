# Reimplement #any?
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 4

animals = ['cat', 'dog', 'lamb', 'hors']

def test_any(arr)
    result = arr.any? do |element|
        element.length == DESIRED_LENGTH
    end
end

expected_result = test_any(animals)

def animals.any?(*args)
    each do |val|
        return true if args.size == 1 && args.first == val
        return true if block_given? && yield(val)
    end
    false
end

actual_result = test_any(animals)

show_results('test_any', expected_result, actual_result)
