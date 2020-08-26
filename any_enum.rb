# Reimplement #any?
require 'pry'

require_relative 'enum_test_helper'

DESIRED_LENGTH = 4

ANIMALS_WITH_FOUR = ['cat', 'dog', 'lamb', 'horse']

def test_any(arr)
    result = arr.any? do |element|
        element.length == DESIRED_LENGTH
    end
end

expected_result = test_any(ANIMALS_WITH_FOUR)

def ANIMALS_WITH_FOUR.any?(*args)
    each do |val|
        return true if args.size == 1 && args.first == val
        return true if block_given? && yield(val)
    end
    false
end

actual_result = test_any(ANIMALS_WITH_FOUR)

show_results('test_any', expected_result, actual_result)
